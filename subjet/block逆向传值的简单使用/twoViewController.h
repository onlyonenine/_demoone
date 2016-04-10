//
//  twoViewController.h
//  _demo4.7
//
//  Created by bwfstu on 16/4/7.
//  Copyright © 2016年 zhanglei. All rights reserved.
//

#import <UIKit/UIKit.h>
typedef void (^Myblock)(id);

@interface twoViewController : UIViewController

@property(nonatomic,copy)Myblock block;


@end

