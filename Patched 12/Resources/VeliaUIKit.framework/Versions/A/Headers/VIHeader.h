//
//  VIHeader.h
//  VeliaUIKit
//
//  Created by Ben Sova on 5/16/21.
//

#ifndef VIHeader_h
#define VIHeader_h

#import <Cocoa/Cocoa.h>

@interface VIHeader : NSView

@property (strong) IBOutlet NSTextField *titleText;
@property (strong) IBOutlet NSTextField *subTitleText;

@property (nonatomic, strong) NSString *title;
@property (nonatomic, strong) NSString *subtitle;

-(id)initWithTitle:(NSString*)newTitle subTitle:(NSString*)newSubtitle frame:(NSRect)frame;

@end

#endif /* VIHeader_h */
