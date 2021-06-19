//
//  P2PreRememberView.m
//  Patched Monterey
//
//  Created by TestOS on 6/18/21.
//

#import "P2PreRememberView.h"
#import "P2App.h"

@interface P2PreRememberView ()

@property (strong) IBOutlet NSTextField *titleText;
@property (strong) IBOutlet NSTextField *subTitleText;

@property (strong) IBOutlet NSTextField *firstText;
@property (strong) IBOutlet NSTextField *secondText;
@property (strong) IBOutlet VIButton *startButton;

@property (strong) IBOutlet NSTextField *containerView;
@property (strong) IBOutlet NSStackView *centerStack;

@property (strong) IBOutlet NSTextField *guideline;

@end

@implementation P2PreRememberView

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
    
    self.firstText = [[NSTextField alloc] initWithFrame:CGRectMake(0, 233, 541, 19)];
    self.firstText.stringValue = NSLocalizedString(@"PRE-REMEMBER-TITLE", @"PRE-REMEMBER-TITLE");
    [self.firstText setBezeled:FALSE];
    [self.firstText setBordered:FALSE];
    [self.firstText setSelectable:FALSE];
    [self.firstText setFont:[NSFont boldSystemFontOfSize:15]];
    self.firstText.drawsBackground = false;
    [self.firstText setAutoresizingMask:NSViewMinXMargin | NSViewMaxXMargin | NSViewMinYMargin | NSViewMaxYMargin];
    [self.firstText setAlignment:NSTextAlignmentCenter];
    
    self.secondText = [[NSTextField alloc] initWithFrame:CGRectMake(30, 62, 541, 155)];
    self.secondText.stringValue = NSLocalizedString(@"PRE-REMEMBER-DESCRIPTION", "PRE-REMEMBER-DESCRIPTION");
    self.secondText.drawsBackground = false;
    [self.secondText setBezeled:FALSE];
    [self.secondText setBordered:FALSE];
    [self.secondText setSelectable:FALSE];
    [self.secondText setAutoresizingMask:NSViewHeightSizable];
    self.secondText.lineBreakMode = NSLineBreakByWordWrapping;
    [self.secondText sizeThatFits:CGSizeMake(541, 300)];
    [self.secondText setAlignment:NSTextAlignmentCenter];
    
    self.startButton = [[VIButton alloc] initWithFrame:CGRectMake(239, 46, 122, 26)];
    self.startButton.buttonText = NSLocalizedString(@"CONTINUE", "CONTINUE");
    [self.startButton setWidth:122];
    [self.startButton setAction:@selector(p2PreRememberContinue:)];
    [self.view addSubview:self.startButton];
    
    self.containerView = [[NSTextField alloc] initWithFrame:CGRectMake(26, 20, 550, 243)];
    self.containerView.drawsBackground = false;
    [self.containerView setBezeled:FALSE];
    [self.containerView setBordered:FALSE];
    [self.containerView setSelectable:FALSE];
    self.secondText.translatesAutoresizingMaskIntoConstraints = false;
    
    [self.view addSubview:self.containerView];
    
    self.centerStack = [NSStackView stackViewWithViews:@[ self.firstText, self.secondText, self.startButton ]];
    [self.centerStack setAlignment:NSLayoutAttributeCenterX];
    [self.centerStack setSpacing:15];
    [self.centerStack setFrame:self.containerView.frame];
    self.centerStack.translatesAutoresizingMaskIntoConstraints = false;
    [self.containerView addSubview:self.centerStack];
    [self.centerStack limitToView];
    [self.centerStack centerInSuperView];
}

@end
