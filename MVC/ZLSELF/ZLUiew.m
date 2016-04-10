//
//  ZLUiew.m
//  _demo2.29
//
//  Created by bwfstu on 16/3/31.
//  Copyright © 2016年 zhanglei. All rights reserved.
//

#import "ZLUiew.h"

@implementation ZLUiew

#pragma mark  ----自定制带点击事件的Imageview
-(UIImageView *)ZLImageViewWithFrame:(CGRect )frame Tag:(int)tag {
    UIImageView *imageV = [[UIImageView alloc]init];
    imageV.frame = frame;
    imageV.userInteractionEnabled = YES;
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    button.frame = CGRectMake(0, 0, imageV.frame.size.width, imageV.frame.size.height);
    button.tag   = tag;
    [button addTarget:self action:@selector(ZlButtonImageClick:) forControlEvents:UIControlEventTouchUpInside];
    [imageV addSubview:button];
    return imageV;
}
//Imgeviewbutton 的点击事件
-(void)ZlButtonImageClick:(UIButton *)button {
    
}
#pragma mark    ---自定制下部带标题,图片带点击的imageView
-(UIView *)ZLTitleImageWithImage:(NSString *) image placeImage:(NSString *)placreImage imageTitle:(NSString *)title Frame:(CGRect)frame Tag:(int)tag {
    UIView *view = [[UIView alloc]initWithFrame:CGRectMake(frame.origin.x, frame.origin.y, frame.size.width, frame.size.height+30)];
    UIImageView *imagV = [self ZLImageViewWithFrame:CGRectMake(15, 15, frame.size.width-30, frame.size.height-30*0.75) Tag:tag];
    [imagV setImageWithURL:[NSURL URLWithString:image] placeholderImage:[UIImage imageNamed:placreImage]];
    UILabel *label = [[UILabel alloc]initWithFrame:CGRectMake(0, frame.size.height, frame.size.width, 30)];
    label.font = [UIFont systemFontOfSize:15];
    label.text = title;
    label.textColor = [UIColor lightGrayColor];
    label.textAlignment = NSTextAlignmentCenter;
    [view addSubview:label];
    [view addSubview:imagV];
    return view;
}
@end
