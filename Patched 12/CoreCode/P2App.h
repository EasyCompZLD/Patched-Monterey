//
//  P2App.h
//  Patched 12
//
//  Created by Ben Sova on 5/29/21.
//

#ifndef P2App_h
#define P2App_h

#import <Foundation/Foundation.h>
#import "VIButton.h"

@interface P2App : NSObject

+(NSString*_Nonnull)version;
+(NSString*_Nonnull)build;
+(NSString*_Nonnull)isPatched;
+(NSArray*_Nonnull)runTask:(NSString*_Nonnull)binary arguments:(NSArray<NSString *> * _Nullable)arguments;

@end

@interface NSView (P2Adds)

-(void)setCenter:(CGPoint)center;
-(CGPoint)getCenter;
-(void)centerInSuperView;
-(void)limitToView;
-(void)centerXInSuper;

@end

#endif /* P2App_h */
