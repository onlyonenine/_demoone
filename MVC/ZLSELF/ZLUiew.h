//
//  ZLUiew.h
//  _demo2.29
//
//  Created by bwfstu on 16/3/31.
//  Copyright © 2016年 zhanglei. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <UIImageView+AFNetworking.h>
@interface ZLUiew : UIView
#pragma mark ---自定制带点击事件的UIImageView
-(UIImageView *)ZLImageViewWithFrame:(CGRect )frame Tag:(int)tag;
-(void)ZlButtonImageClick:(UIButton *)button;

#pragma mark    ---自定制下部带标题,图片带点击的imageView
-(UIView *)ZLTitleImageWithImage:(NSString *) image placeImage:(NSString *)placreImage imageTitle:(NSString *)title Frame:(CGRect)frame Tag:(int)tag;
@end
