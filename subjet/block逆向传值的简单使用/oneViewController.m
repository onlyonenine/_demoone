//
//  oneViewController.m
//  _demo4.7
//
//  Created by bwfstu on 16/4/7.
//  Copyright © 2016年 zhanglei. All rights reserved.
//

#import "oneViewController.h"
#import "twoViewController.h"

@interface oneViewController ()

@end

@implementation oneViewController

- (void)viewDidLoad {
    [super viewDidLoad];
}
-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    twoViewController *vc = [[twoViewController alloc]init];
    vc.block = ^(UIColor *color){
        self.view.backgroundColor = color;
    };
    [self.navigationController pushViewController:vc animated:YES];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
