//
//  SKFloatingCoveringView.h
//  FloatingCoveringView
//
//  Created by sunshuaikun on 17/3/13.
//  Copyright © 2017年 sunshuaikun. All rights reserved.
//

#import <UIKit/UIKit.h>
#define KDragviewHeight 25
#define SCREEN_MAIN_HEIGHT [[UIScreen mainScreen] bounds].size.height
#define SCREEN_MAIN_WIDTH [[UIScreen mainScreen] bounds].size.width
#define RGB(r, g, b)      [UIColor colorWithRed:((r) / 255.0) green:((g) / 255.0) blue:((b) / 255.0) alpha:1.0]
#define KDragNotification @"DragNotification"
@interface SKFloatingCoveringView : UIView

@end
