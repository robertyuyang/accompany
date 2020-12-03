//
//  common.h
//  accompany
//
//  Created by Robert Yu on 11/27/20.
//  Copyright © 2020 robert. All rights reserved.
//

#ifndef common_h
#define common_h

#define RGBHex(hex) [UIColor colorWithRed:((((hex) & 0xff0000) >> 16) / 255.0) green:((((hex) & 0x00ff00) >> 8) / 255.0) blue:((((hex) & 0x0000ff)) / 255.0) alpha:1.0]

@interface UIViewController(Common)
- (void)presentboardVC:(NSString*)boardId;
- (void)addViewWithTag:(NSInteger)tag presentboardVC:(NSString*)boardId;

@end
#endif /* common_h */
