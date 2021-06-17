//
//  main.m
//  Patched 12
//
//  Created by Ben Sova on 5/29/21.
//

#import <Cocoa/Cocoa.h>
#import "P2App.h"

int main(int argc, const char * argv[]) {
    NSLog(@"Hello, and welcome to Patched 12!");
    NSLog(@"If you're seeing this you're probably running the patcher from the Command Line!");
    NSLog(@"%@", [P2App isPatched]);
    #if DEBUG
    NSLog(@"Running From Xcode in DEBUG configuration.");
    #else
    NSLog(@"Running Either Normally or From Terminal in RELEASE configuration.");
    #endif
    return NSApplicationMain(argc, argv);
}
