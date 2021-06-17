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
    return [[self runTask:@"/usr/sbin/nvram" arguments:@[ @"4D1FDA02-38C7-4A6A-9CC6-4BCCA8B30102:PSVersion" ]][0]
            substringFromIndex:47];
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
