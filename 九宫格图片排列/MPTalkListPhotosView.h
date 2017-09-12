//
//  MPTalkListPhotosView.h
//  tenMS
//
//  Created by plum on 17/6/21.
//  Copyright © 2017年 plum. All rights reserved.
//

#import <UIKit/UIKit.h>
static NSInteger sepp  = 15;

@interface MPTalkListPhotosView : UIView
- (void)layerPhotosArr:(NSArray *)img;
+ (CGFloat)getPhotosViewHeight:(NSArray *)arr andSelfW:(CGFloat)selfW;
@end
