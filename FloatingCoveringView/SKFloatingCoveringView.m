//
//  SKFloatingCoveringView.m
//  FloatingCoveringView
//
//  Created by sunshuaikun on 17/3/13.
//  Copyright © 2017年 sunshuaikun. All rights reserved.
//

#import "SKFloatingCoveringView.h"
@interface SKFloatingCoveringView(){
    CGPoint        _originPoint;               // 拖拽的原始点
    UIView         *_dragView;                  //拖动的view
}
@end

@implementation SKFloatingCoveringView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self customView];
    }
    return self;
}
- (void)customView{
    _dragView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_MAIN_WIDTH, KDragviewHeight)];
    _dragView.backgroundColor = [UIColor clearColor];
    
    UIPanGestureRecognizer *panGesture = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(dragSlideView:)];
    
    [_dragView addGestureRecognizer:panGesture];
    
    UIImageView *dragImage = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 20, 20)];
    dragImage.center = CGPointMake(self.center.x, dragImage.center.y);
    dragImage.image = [UIImage imageNamed:@"dropDown"];
    dragImage.backgroundColor = [UIColor clearColor];
    dragImage.contentMode = UIViewContentModeTop;
    dragImage.userInteractionEnabled = YES;
    [_dragView addSubview:dragImage];
    [self addSubview:_dragView];
}
/*
 
 */
- (void)dragSlideView:(UIPanGestureRecognizer *)gesture {
    CGPoint currentPostion = [gesture locationInView:self];
    CGFloat myHeight = KDragviewHeight;
    switch (gesture.state) {
        case UIGestureRecognizerStateBegan:
            _originPoint = currentPostion;
            break;
        case UIGestureRecognizerStateChanged:{
            self.center = CGPointMake(self.center.x, self.center.y+currentPostion.y);
            //            self.height = self.height-currentPostion.y;
            //控制上下边缘拖动范围
            if (self.frame.origin.y < 10) {
                self.frame = CGRectMake(self.frame.origin.x, 10, self.frame.size.width, SCREEN_MAIN_HEIGHT-10);
            }
            if (self.frame.origin.y > SCREEN_MAIN_HEIGHT-myHeight) {
                self.frame = CGRectMake(self.frame.origin.x, SCREEN_MAIN_HEIGHT-myHeight, self.frame.size.width, SCREEN_MAIN_HEIGHT);
            }
            
            NSDictionary* requestDict = @{
                                          @"myHeight" :[NSString stringWithFormat:@"%f",self.frame.origin.y],
                                          };
            [[NSNotificationCenter defaultCenter] postNotificationName:KDragNotification object:self userInfo:requestDict];
        }
            
            break;
        case UIGestureRecognizerStateEnded:
            break;
        default:
            break;
    }
    [gesture setTranslation:CGPointMake(0, 0) inView:self];
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
