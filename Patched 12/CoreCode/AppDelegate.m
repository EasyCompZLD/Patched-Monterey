//
//  AppDelegate.m
//  Patched 12
//
//  Created by Ben Sova on 5/29/21.
//

#import "AppDelegate.h"
#import "P2PreMainController.h"
#import "P2PreRememberView.h"
#import "P2PreThanksView.h"
#import <QuartzCore/QuartzCore.h>

@interface AppDelegate ()

@property (strong) IBOutlet NSWindow *window;

@property (nonatomic, strong) IBOutlet P2PreMainController *p2PreMainController;
@property (nonatomic, strong) IBOutlet P2PreRememberView *p2PreRememberView;
@property (nonatomic, strong) IBOutlet P2PreThanksView *p2PreThanksView;

@end

@implementation AppDelegate

- (void)applicationDidFinishLaunching:(NSNotification *)aNotification {
    self.p2PreMainController = [[P2PreMainController alloc] initWithNibName:@"P2PreMainController" bundle:nil];
    self.p2PreMainController.view.frame = self.window.contentView.frame;
    [self.window.contentView addSubview:self.p2PreMainController.view];
}

- (CATransition*)continueAnimation {
    CATransition *transition = [CATransition animation];
    [transition setType:kCATransitionPush];
    [transition setSubtype:kCATransitionFromRight];
    return transition;
}

- (CATransition*)returnAnimation {
    CATransition *transition = [CATransition animation];
    [transition setType:kCATransitionPush];
    [transition setSubtype:kCATransitionFromLeft];
    return transition;
}

- (IBAction)p2PreMainContinue:(NSButton*)sender {
    [self.window.contentView setAnimations:[NSDictionary dictionaryWithObject:[self continueAnimation] forKey:@"subviews"]];
    self.p2PreRememberView = [[P2PreRememberView alloc] initWithNibName:@"P2PreRememberView" bundle:nil];
    [self.p2PreRememberView.view setFrame:self.window.contentView.frame];
    [[self.window.contentView animator] replaceSubview:self.p2PreMainController.view with:self.p2PreRememberView.view];
}

- (IBAction)p2PreRememberContinue:(NSButton*)sender {
    [self.window.contentView setAnimations:[NSDictionary dictionaryWithObject:[self continueAnimation] forKey:@"subviews"]];
    self.p2PreThanksView = [[P2PreThanksView alloc] initWithNibName:@"P2PreThanksView" bundle:nil];
    [self.p2PreThanksView.view setFrame:self.window.contentView.frame];
    [[self.window.contentView animator] replaceSubview:self.p2PreRememberView.view with:self.p2PreThanksView.view];
}

- (void)applicationWillTerminate:(NSNotification *)aNotification {
    // Insert code here to tear down your application
}


@end
