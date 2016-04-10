//
//  ZLSuperViewController.h
//  ZL0302Tabbar
//
//  Created by bwfstu on 16/3/2.
//  Copyright © 2016年 zhanglei. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AFHTTPSessionManager.h"

#pragma mark ---宏定义区
#define ZLSIZE [UIScreen mainScreen].bounds.size

@interface ZLSuperViewController : UIViewController


#pragma mark ---方法区

#pragma mark ---自定制通过title创建navigationBar的左右按钮
-(void)createNavigationItemsWithTitle:(NSString *)title andWithType:(BOOL)type andWithTag:(NSInteger)tag;
//左右按钮的点击事件1
-(void)onBarButtonClick:(UIBarButtonItem *)sender;

#pragma mark --通过背景图片设置tabbar
-(void)createTabBarBackGroundWithImageName:(NSString *)name;

#pragma mark  ----自定制带点击事件的Imageview
-(UIImageView *)ZLImageViewWithFrame:(CGRect )frame Tag:(int)tag;


#pragma mark    ---自定制下部带标题,图片带点击的imageView
-(UIView *)ZLTitleImageWithImage:(NSString *) image placeImage:(NSString *)placreImage imageTitle:(NSString *)title Frame:(CGRect)frame Tag:(int)tag;



#pragma mark -- GET网络请求
-(NSDictionary *)requestWithGETString:(NSString *)string body:(NSDictionary *)dictionary;

#pragma mark  --- POST请求
-(NSDictionary *)requestPOSTWithString:(NSString *)string body:(NSDictionary *)dictionary;

@end
