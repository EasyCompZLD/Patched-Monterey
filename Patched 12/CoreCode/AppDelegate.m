//
//  AppDelegate.m
//  Patched 12
//
//  Created by Ben Sova on 5/29/21.
//

#import "AppDelegate.h"
#import "P2PreMainController.h"

@interface AppDelegate ()

@property (strong) IBOutlet NSWindow *window;

@property (nonatomic, strong) IBOutlet P2PreMainController *p2PreMainController;

@end

@implementation AppDelegate

- (void)applicationDidFinishLaunching:(NSNotification *)aNotification {
    self.p2PreMainController = [[P2PreMainController alloc] initWithNibName:@"P2PreMainController" bundle:nil];
    self.p2PreMainController.view.frame = self.window.contentView.frame;
    [self.window.contentView addSubview:self.p2PreMainController.view];
}


- (void)applicationWillTerminate:(NSNotification *)aNotification {
    // Insert code here to tear down your application
}


@end
