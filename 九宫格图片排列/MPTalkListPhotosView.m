//
//  MPTalkListPhotosView.m
//  tenMS
//
//  Created by plum on 17/6/21.
//  Copyright © 2017年 plum. All rights reserved.
//

#import "MPTalkListPhotosView.h"

#import "UIViewExt.h"

static CGFloat sep  = 8;
static NSInteger maxNum  = 9;

@interface MPTalkListPhotosView ()



@end

@implementation MPTalkListPhotosView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
        [self initView];
        
    }
    return self;
}
#pragma mark - Private
- (void)initView
{
    for (int i = 0; i < maxNum; i++) {
        UIImageView *titleImgView = [[UIImageView alloc]init];
        titleImgView.userInteractionEnabled = YES;
        titleImgView.tag = i+1;
        titleImgView.contentMode = UIViewContentModeScaleAspectFill;
        titleImgView.layer.masksToBounds = YES;
       
        [self addSubview:titleImgView];
    }
    
}
#pragma mark - 
- (void)layerPhotosArr:(NSArray *)img
{
    
    self.hidden = YES;
    
    
    if (!img) {
        return;
    }
    if (![img isKindOfClass:[NSArray class]]) {
        return;
    }
    NSInteger imgcount = img.count;
    if (imgcount==0) {
        return;
    }
    self.hidden = NO;

    int lineNUM = [MPTalkListPhotosView getOneLineNum:imgcount];
    UIImageView *titleImgView0 = nil;
    for (int i = 0; i < maxNum; i++) {
        UIImageView *titleImgView = [self viewWithTag:i+1];
        titleImgView.hidden = YES;

        if (i==0) {
           titleImgView0 = titleImgView;
        }
        if (i < imgcount) {
            titleImgView.hidden = NO;
            NSString *imgname = img[i];
            UIImage *image = [UIImage imageNamed:imgname];
            titleImgView.image = image;
            CGFloat imgW =  (self.width-sep*(lineNUM-1))/lineNUM;
            CGFloat imgL = 0;
            CGFloat imgT = 0;
            if ((imgcount==5&&i>=2)||(imgcount==7&&i>=3)) {
                CGFloat h = 2;
                lineNUM = 3;
                if (imgcount==7&&i>=3) {
                    lineNUM = 4;
                    h = 3;
                }
                imgW =  (self.width-sep*(lineNUM-1))/lineNUM;
                imgT = titleImgView0.bottom+sep;
                imgL = (imgW+sep)* (i-h);
            }else{
                if (imgcount==4) {
                    imgW =  (self.width-sep*2)/3;
                }
                imgT = (imgW+sep)*(i/lineNUM);
                imgL = (imgW+sep)* (i%lineNUM);
            }
            titleImgView.frame = CGRectMake(imgL, imgT, imgW, imgW);
            
        }
    }

    
}
+ (int)getOneLineNum:(NSInteger)arrcount
{
    int lineNum = 2;
    if (arrcount==2||arrcount==4||arrcount==5) {
        lineNum = 2;
    }
    if (arrcount==3||arrcount==6||arrcount==9||arrcount==7) {
        lineNum = 3;
    }
    if (arrcount==8) {
        lineNum = 4;
    }
    return lineNum;

}
+ (CGFloat)getPhotosViewHeight:(NSArray *)arr  andSelfW:(CGFloat)selfW
{
    if (!arr) {
        return 0;
    }
    if (![arr isKindOfClass:[NSArray class]]) {
        return 0;
    }
    
    NSInteger arrcount = arr.count;
    
    if (arrcount) {
        int onelinenum = [MPTalkListPhotosView getOneLineNum:arrcount];
        CGFloat imgWW = (selfW-sep*(onelinenum-1))/onelinenum;
        if (arrcount<=3) {
            return imgWW+sepp;
        }
        if (arrcount==4||arrcount==6||arrcount==8) {
            if (arrcount==4) {
                imgWW =  (selfW-sep*2)/3;
            }
            return imgWW+sep+imgWW+sepp;
        }
        if (arrcount==9) {
            return imgWW+sep+imgWW+sep+imgWW+sepp;
        }
        if (arrcount==5) {
            onelinenum = 3;
            CGFloat imgWW1 = (selfW-sep*(onelinenum-1))/onelinenum;

            return imgWW+sep+imgWW1+sepp;
        }
        if (arrcount==7) {
            onelinenum = 4;
            CGFloat imgWW1 = (selfW-sep*(onelinenum-1))/onelinenum;
            return imgWW+sep+imgWW1+sepp;
        }
        
    }
    return 0;
}


@end
