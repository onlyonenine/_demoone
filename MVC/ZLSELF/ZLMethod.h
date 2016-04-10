//
//  ZLMethod.h
//  ZL290201
//
//  Created by bwfstu on 16/2/29.
//  Copyright © 2016年 zhanglei. All rights reserved.
//
#import <UIKit/UIKit.h>
#import <Foundation/Foundation.h>
#import <AVFoundation/AVFoundation.h>
#import <QuartzCore/QuartzCore.h>
#import <Foundation/Foundation.h>

@interface ZLMethod : NSObject
#pragma mark ---读取文件URL
+(NSURL *)getURLWithName:(NSString *)name;



#pragma mark --播放短音频
+(void)playShortSoundWithName:(NSString *)soundName;
@end

#pragma mark -- 跳转页面时候的效果动画
/**＊＊＊＊＊＊使用步骤＊＊＊＊＊＊＊＊＊＊*/
/***1.添加QuartzCore.framework  ***/
/***2.导入头文件#import <QuartzCore/QuartzCore.h>***/

typedef enum
{
    ZLTransitionAnimationTypeCameraIris,
    //相机
    ZLTransitionAnimationTypeCube,
    //立方体
    ZLTransitionAnimationTypeFade,
    //淡入
    ZLTransitionAnimationTypeMoveIn,
    //移入
    ZLTransitionAnimationTypeOglFilp,
    //翻转
    ZLTransitionAnimationTypePageCurl,
    //翻去一页
    ZLTransitionAnimationTypePageUnCurl,
    //添上一页
    ZLTransitionAnimationTypePush,
    //平移
    ZLTransitionAnimationTypeReveal,
    //移走
    ZLTransitionAnimationTypeRippleEffect,
    ZLTransitionAnimationTypeSuckEffect
}ZLTransitionAnimationType;

/**动画方向*/
typedef enum
{
    ZLTransitionAnimationTowardFromLeft,
    ZLTransitionAnimationTowardFromRight,
    ZLTransitionAnimationTowardFromTop,
    ZLTransitionAnimationTowardFromBottom
}ZLTransitionAnimationToward;

@interface UIView (ZLTransitionAnimation)

//为当前视图添加切换的动画效果
//参数是动画类型和方向
//如果要切换两个视图，应将动画添加到父视图
- (void)setTransitionAnimationType:(ZLTransitionAnimationType)transtionAnimationType toward:(ZLTransitionAnimationToward)transitionAnimationToward duration:(NSTimeInterval)duration;

@end



