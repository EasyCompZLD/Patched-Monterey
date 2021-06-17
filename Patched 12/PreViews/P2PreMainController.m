//
//  P2PreMainController.m
//  Patched 12
//
//  Created by Ben Sova on 5/29/21.
//

#import "P2PreMainController.h"
#import "P2App.h"
#import <VeliaUIKit/VeliaUIKit.h>

@interface P2PreMainController ()

//@property (strong) IBOutlet NSTextField *titleText;
//@property (strong) IBOutlet NSTextField *subTitleText;
//@property (strong) IBOutlet NSStackView *viewStack;
@property (strong) IBOutlet VIHeader *headerView;

@end

@interface NSView (P2Adds)

-(void)setCenter:(CGPoint)center;
-(CGPoint)getCenter;
-(void)centerInSuperView;

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
        attribute:NSLayoutAttributeCenterX
        relatedBy:NSLayoutRelationEqual
        toItem:self
        attribute:NSLayoutAttributeCenterX
        multiplier:1.0
        constant:0.0]];
    [self.superview addConstraint:[NSLayoutConstraint
        constraintWithItem:self.superview
        attribute:NSLayoutAttributeCenterY
        relatedBy:NSLayoutRelationEqual
        toItem:self
        attribute:NSLayoutAttributeCenterY
        multiplier:1.0
        constant:0.0]];
}

@end

@implementation P2PreMainController

-(void)viewDidLoad {
    [super viewDidLoad];
    
    NSString* p2Details = @"v";
    p2Details = [p2Details stringByAppendingString:[P2App version]];
    p2Details = [p2Details stringByAppendingString:@" ("];
    p2Details = [p2Details stringByAppendingString:[P2App build]];
    p2Details = [p2Details stringByAppendingString:@")"];
    
    self.titleText = [[NSTextField alloc] initWithFrame:CGRectMake(30, 288, 237, 30)];
    self.titleText.stringValue = @"Patched Monterey";
    [self.titleText setBezeled:FALSE];
    [self.titleText setBordered:FALSE];
    [self.titleText setSelectable:FALSE];
    [self.titleText setFont:[NSFont boldSystemFontOfSize:21.5]];
    self.titleText.drawsBackground = false;
    [self.view addSubview:self.titleText];

    self.subTitleText = [[NSTextField alloc] initWithFrame:CGRectMake(30, 276, 237, 15)];
    self.subTitleText.stringValue = p2Details;
    [self.subTitleText setBezeled:FALSE];
    [self.subTitleText setBordered:FALSE];
    [self.subTitleText setSelectable:FALSE];
    [self.subTitleText setFont:[NSFont boldSystemFontOfSize:12]];
    self.subTitleText.drawsBackground = false;
    [self.subTitleText setAlphaValue:0.55];
    [self.view addSubview:self.subTitleText];
    
//    self.headerView = [[VIHeader alloc] initWithTitle:@"Patched Monterey" subTitle:p2Details frame:self.view.frame];
    self.headerView = [[VIHeader alloc] initWithFrame:self.view.frame];
//    self.headerView.frame = self.view.frame;
//    [self.headerView.titleText setNeedsDisplay:TRUE];
    [self.view addSubview:self.headerView];
}

@end


/* self.viewStack = [NSStackView stackViewWithViews:@[ self.titleText, self.subTitleText ]];
[self.viewStack setBounds:self.view.bounds];
[self.viewStack setAlignment:NSLayoutAttributeLeading];
[self.view addSubview:self.viewStack];
[self.titleText setAutoresizingMask:NSViewMinXMargin | NSViewMaxXMargin | NSViewMinYMargin | NSViewMaxYMargin];
 */
