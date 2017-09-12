//
//  ViewController.m
//  九宫格图片排列
//
//  Created by plum on 17/9/9.
//  Copyright © 2017年 plum. All rights reserved.
//

#import "ViewController.h"

#import "MPTalkListPhotosView.h"
#import "UIViewExt.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    UIScrollView *comitView = [[UIScrollView alloc]initWithFrame:self.view.bounds];
    comitView.showsVerticalScrollIndicator = NO;
    comitView.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:comitView];
    
    CGFloat left = 15;
    CGFloat top = 30;
    CGFloat sep = sepp;
    CGFloat width = comitView.width - left*2;
    NSMutableArray *imgarr = [NSMutableArray new];
    
    for (int i = 0; i < 9; i++) {
        NSString *imgname = [NSString stringWithFormat:@"%d.jpg",i];
        [imgarr addObject:imgname];
        
        CGFloat height = [MPTalkListPhotosView getPhotosViewHeight:imgarr andSelfW:width];
        MPTalkListPhotosView *vi = [[MPTalkListPhotosView alloc]initWithFrame:CGRectMake(left, top, width, height)];
        [vi layerPhotosArr:imgarr];
        [comitView addSubview:vi];
        
       
        UIImageView *lineview = [[UIImageView alloc]initWithFrame:CGRectMake(0, vi.bottom, comitView.width, 0.5)];
        lineview.backgroundColor = [UIColor lightGrayColor];
        [comitView addSubview:lineview];
        
        
        top+=height+sep;
    }
    
    comitView.contentSize = CGSizeMake(0, top);
    
    

}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
