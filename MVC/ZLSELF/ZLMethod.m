//
//  ZLMethod.m
//  ZL290201
//
//  Created by bwfstu on 16/2/29.
//  Copyright © 2016年 zhanglei. All rights reserved.
//

#import "ZLMethod.h"

@implementation ZLMethod
#pragma mark ---读取文件URL
+(NSURL *)getURLWithName:(NSString *)name {
    NSArray *arr = [name componentsSeparatedByString:@"."];
    NSString *url = [[NSBundle mainBundle]pathForResource:arr[0] ofType:arr[1]];
    return [NSURL URLWithString:url];
}




#pragma mark -- 播放短音频
+(void)playShortSoundWithName:(NSString *)soundName {
    //    声明SoundID
    SystemSoundID soundID;
    //    绑定音频URL和SsoundID
    AudioServicesCreateSystemSoundID((__bridge CFURLRef _Nonnull)([self getURLWithName:soundName]), &soundID);
    //    委托系统替我们播放这个音频
    AudioServicesPlayAlertSound(soundID);
}

@end





#pragma mark -- 跳转页面时候的效果动画
@implementation UIView (ZLTransitionAnimation)

- (void)setTransitionAnimationType:(ZLTransitionAnimationType)transtionAnimationType toward:(ZLTransitionAnimationToward)transitionAnimationToward duration:(NSTimeInterval)duration
{
    CATransition * transition = [CATransition animation];
    transition.duration = duration;
    NSArray * animations = @[@"cameraIris",
                             @"cube",
                             @"fade",
                             @"moveIn",
                             @"oglFilp",
                             @"pageCurl",
                             @"pageUnCurl",
                             @"push",
                             @"reveal",
                             @"rippleEffect",
                             @"suckEffect"];
    NSArray * subTypes = @[@"fromLeft", @"fromRight", @"fromTop", @"fromBottom"];
    transition.type = animations[transtionAnimationType];
    transition.subtype = subTypes[transitionAnimationToward];
    
    [self.layer addAnimation:transition forKey:nil];
}

@end
