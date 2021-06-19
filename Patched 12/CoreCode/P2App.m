//
//  P2App.m
//  Patched 12
//
//  Created by Ben Sova on 5/29/21.
//

#import "P2App.h"

@implementation P2App

+(NSString*)version {
    return [[NSBundle mainBundle] objectForInfoDictionaryKey:@"CFBundleShortVersionString"];
}

+(NSString*)build {
    return [[NSBundle mainBundle] objectForInfoDictionaryKey:@"CFBundleVersion"];
}

+(NSString*)isPatched {
    return [[[self runTask:@"/usr/sbin/nvram" arguments:@[ @"4D1FDA02-38C7-4A6A-9CC6-4BCCA8B30102:PSVersion" ]][0]
             substringFromIndex:47] substringToIndex:7];
}

+(NSArray*)runTask:(NSString*)binary arguments:(NSArray<NSString *> * _Nullable)arguments {
    
    // Create Task
    NSTask *openTask = [[NSTask alloc] init];
    
    // Set Arguments
    [openTask setLaunchPath:binary];
    if (arguments) {
        [openTask setArguments:arguments];
    }
    
    // Set Pipes
    NSPipe* outPipe = [NSPipe pipe];
    openTask.standardOutput = outPipe;
    openTask.standardError = outPipe;
    
    // Launch and Finish Task
    [openTask launch];
    [openTask waitUntilExit];

    // Get Output
    NSData* outData = [outPipe.fileHandleForReading readDataToEndOfFile];
    NSString* output = [[NSString alloc] initWithData:outData encoding:NSUTF8StringEncoding];
    int statusCode = [openTask terminationStatus];
    
    if (output) {
        [openTask terminate];
        return [NSArray arrayWithObjects:output, statusCode, nil];
    }
    
    return [NSArray arrayWithObjects:@"", statusCode, nil];
}

@end

@implementation NSView (P2Adds)

-(void)setCenter:(CGPoint)center {
    [self setFrame:CGRectMake(center.x - [self bounds].size.width / 2, center.y - [self bounds].size.height / 2, [self bounds].size.width, [self bounds].size.height)];
}

-(CGPoint)getCenter {
    return CGPointMake((self.frame.origin.x + (self.frame.size.width / 2)), (self.frame.origin.y + (self.frame.size.height / 2)));
}

-(void)centerInSuperView {
    [self.superview addConstraint:[NSLayoutConstraint
        constraintWithItem:self.superview
        attribute:NSLayoutAttributeCenterY
        relatedBy:NSLayoutRelationEqual
        toItem:self
        attribute:NSLayoutAttributeCenterY
        multiplier:1.0
        constant:0.0]];
}

-(void)centerXInSuper {
    [self.superview addConstraint:[NSLayoutConstraint
        constraintWithItem:self.superview
        attribute:NSLayoutAttributeCenterX
        relatedBy:NSLayoutRelationEqual
        toItem:self
        attribute:NSLayoutAttributeCenterX
        multiplier:1.0
        constant:0.0]];
}

-(void)limitToView {
    [self.superview addConstraint:[NSLayoutConstraint
        constraintWithItem:self.superview
        attribute:NSLayoutAttributeLeading
        relatedBy:NSLayoutRelationEqual
        toItem:self
        attribute:NSLayoutAttributeLeading
        multiplier:1.0 constant:0]];
    [self.superview addConstraint:[NSLayoutConstraint
        constraintWithItem:self.superview
        attribute:NSLayoutAttributeTrailing
        relatedBy:NSLayoutRelationEqual
        toItem:self
        attribute:NSLayoutAttributeTrailing
        multiplier:1.0 constant:0]];
}

@end
