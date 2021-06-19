//
//  VIButton.m
//  Patched Monterey
//
//  Created by Ben Sova on 4/15/21.
//

#import <Cocoa/Cocoa.h>
#import "VIButton.h"
#import "P2App.h"
#import <QuartzCore/QuartzCore.h>

@interface VIButton ()

@property (strong) NSColor *buttonColor;
@property (strong) NSColor *textColor;

@property (nonatomic, strong) NSString *buttonText;

@property (strong) NSTextField *backgroundView;
@property (strong) NSTextField *buttonLabel;

@property (strong) NSTextField *backgroundView2;
@property (strong) NSTextField *buttonLabel2;

@end

@implementation VIButton

- (instancetype)initWithFrame:(NSRect)frameRect {
    self = [super initWithFrame:frameRect];

    self.buttonText = @"Button";
    
    [self addConstraint:[NSLayoutConstraint
        constraintWithItem:self
        attribute:NSLayoutAttributeHeight
        relatedBy:NSLayoutRelationGreaterThanOrEqual
        toItem:nil
        attribute:NSLayoutAttributeNotAnAttribute
        multiplier:1.0
        constant:26.0]];
    
    NSTrackingArea *trackingArea = [[NSTrackingArea alloc]
        initWithRect:self.bounds
        options:NSTrackingMouseEnteredAndExited | NSTrackingActiveAlways
        owner:self userInfo:nil];
    [self addTrackingArea:trackingArea];
    
    self.backgroundView = [[NSTextField alloc] initWithFrame:CGRectMake(0, 0, self.frame.size.width, self.frame.size.height)];
    [self.backgroundView setBezeled:false];
    [self.backgroundView setBordered:false];
    [self.backgroundView setEditable:false];
    [self.backgroundView setSelectable:false];
    self.backgroundView.stringValue = @"";
    self.backgroundView.drawsBackground = true; 
    self.backgroundView.backgroundColor = [NSColor colorNamed:@"AccentSelected"];
    [self addSubview:self.backgroundView];
    
    self.backgroundView2 = [[NSTextField alloc] initWithFrame:CGRectMake(0, 0, self.frame.size.width, self.frame.size.height)];
    [self.backgroundView2 setBezeled:false];
    [self.backgroundView2 setBordered:false];
    [self.backgroundView2 setEditable:false];
    [self.backgroundView2 setSelectable:false];
    self.backgroundView2.stringValue = @"";
    self.backgroundView2.drawsBackground = true;
    self.backgroundView2.backgroundColor = [NSColor colorNamed:@"Accent"];
    
    self.buttonLabel = [[NSTextField alloc] initWithFrame:CGRectMake(0, 5, self.frame.size.width, 13)];
    [self.buttonLabel setBezeled:false];
    [self.buttonLabel setBordered:false];
    [self.buttonLabel setEditable:false];
    [self.buttonLabel setSelectable:false];
    self.buttonLabel.stringValue = self.buttonText;
    self.buttonLabel.alignment = NSTextAlignmentCenter;
    self.buttonLabel.textColor = [NSColor colorNamed:@"Accent"];
    self.buttonLabel.drawsBackground = false;
    [self addSubview:self.buttonLabel];
    
    self.buttonLabel2 = [[NSTextField alloc] initWithFrame:CGRectMake(0, 5, self.frame.size.width, 13)];
    [self.buttonLabel2 setBezeled:false];
    [self.buttonLabel2 setBordered:false];
    [self.buttonLabel2 setEditable:false];
    [self.buttonLabel2 setSelectable:false];
    self.buttonLabel2.stringValue = self.buttonText;
    self.buttonLabel2.alignment = NSTextAlignmentCenter;
    self.buttonLabel2.textColor = [NSColor whiteColor];
    self.buttonLabel2.drawsBackground = false;
    
    self.wantsLayer = true;
    self.layer.cornerRadius = self.frame.size.height / 2;
    self.layer.masksToBounds = true;
    
    self.bezelStyle = NSBezelStyleShadowlessSquare;
    [self setBordered:false];
    self.title = @"";
    
    return self;
}

- (void)viewWillDraw {
    [super viewWillDraw];
    self.buttonLabel.stringValue = self.buttonText;
    self.buttonLabel2.stringValue = self.buttonText;
}

- (void)mouseEntered:(NSEvent *)theEvent{
    [super mouseEntered:theEvent];
    [self setAnimations:[NSDictionary dictionaryWithObject:[self highlightAnimation] forKey:@"subviews"]];
    [[self animator] replaceSubview:self.backgroundView with:self.backgroundView2];
    [[self animator] replaceSubview:self.buttonLabel with:self.buttonLabel2];
    self.needsDisplay = true;
}

- (void)mouseExited:(NSEvent *)theEvent{
    [super mouseExited:theEvent];
    [[self animator] replaceSubview:self.backgroundView2 with:self.backgroundView];
    [[self animator] replaceSubview:self.buttonLabel2 with:self.buttonLabel];
    self.needsDisplay = true;
}

- (CATransition *)highlightAnimation {
    CATransition *transition = [CATransition animation];
    [transition setType:kCATransitionFade];
    [transition setSpeed:1.3];
//    [transition setSubtype:kCATransitionFade];
    return transition;
}

- (void)setWidth:(CGFloat)width {
    [self addConstraint:[NSLayoutConstraint
        constraintWithItem:self
        attribute:NSLayoutAttributeWidth
        relatedBy:NSLayoutRelationGreaterThanOrEqual
        toItem:nil
        attribute:NSLayoutAttributeNotAnAttribute
        multiplier:1.0
        constant:width]];
}

@end
