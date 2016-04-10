//
//  ZLSuperViewController.m
//  ZL0302Tabbar
//
//  Created by bwfstu on 16/3/2.
//  Copyright © 2016年 zhanglei. All rights reserved.
//

#import "ZLSuperViewController.h"
#import "UIImageView+AFNetworking.h"
#import "UIWindow+YzdHUD.h"

@interface ZLSuperViewController ()

@end

@implementation ZLSuperViewController {
    NSDictionary *dic;

}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}
#pragma mark --通过图片设置tabbar
-(void)createTabBarBackGroundWithImageName:(NSString *)name{
    UIImageView *imageV = [[UIImageView alloc]initWithFrame:CGRectMake(0, ZLSIZE.height-49, ZLSIZE.width, 49)];
    imageV.userInteractionEnabled = YES;
    imageV.image = [UIImage imageNamed:name];
    imageV.tag = -5;
    [self.view addSubview:imageV];
    for (int i=0; i<4; i++) {
        UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
        button.frame = CGRectMake(ZLSIZE.width/4.0*i, 0, ZLSIZE.width/4.0, 49);
        button.tag = -1*(i+1);
        [button addTarget:self action:@selector(onTabButtonClick:) forControlEvents:UIControlEventTouchDown];
        [imageV addSubview:button];
    }
}
//tabbar 的点击事件
-(void)onTabButtonClick: (UIButton *) button {
    NSArray *imageNames  =@[];
    NSArray *controllers = @[];
    [self.navigationController pushViewController:controllers[-1*button.tag-1] animated:NO];
    UIImageView *imageV = (UIImageView *)[self.view viewWithTag:-5];
    imageV.image = [UIImage imageNamed:imageNames[-1*button.tag-1]];
}
#pragma mark -- 通过title创建navigationBar的左右按钮
-(void)createNavigationItemsWithTitle:(NSString *)title andWithType:(BOOL)type andWithTag:(NSInteger)tag{
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    button.frame = CGRectMake(0, 8,50,28);
    [button setTitle:title forState:UIControlStateNormal];
    [button setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    button.titleLabel.font = [UIFont boldSystemFontOfSize:13];
    button.titleLabel.adjustsFontSizeToFitWidth = YES;
    
    button.backgroundColor = [UIColor colorWithRed:0.06 green:0.27 blue:0.53 alpha:1.00];
    button.tag = tag;
    button.layer.cornerRadius = 5;
    [button addTarget:self action:@selector(onBarButtonClick:) forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem *item = [[UIBarButtonItem alloc]initWithCustomView:button];
    if (type == YES) {
        self.navigationItem.leftBarButtonItem = item;
    }else{
        self.navigationItem.rightBarButtonItem = item;
    }
    if (title.length == 0) {
        button.backgroundColor = [UIColor clearColor];
    }
}
//左右按钮的点击事件1
-(void)onBarButtonClick:(UIBarButtonItem *)sender{


}

#pragma mark -- GET网络请求
-(NSDictionary *)requestWithGETString:(NSString *)string body:(NSDictionary *)dictionary{
    //    加载中的状态
    [self.view.window showHUDWithText:@"加载中" Type:ShowLoading Enabled:YES];
    
    AFHTTPSessionManager *manage = [AFHTTPSessionManager manager];
    
    manage.responseSerializer = [AFHTTPResponseSerializer serializer];
    
    [manage GET:string parameters:nil progress:^(NSProgress * _Nonnull downloadProgress) {
        
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        //成功
        [self.view.window showHUDWithText:@"加载成功" Type:ShowPhotoYes Enabled:YES];
        dic = [NSJSONSerialization JSONObjectWithData:responseObject options:NSJSONReadingMutableContainers error:nil];
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        //失败
        [self.view.window showHUDWithText:@"加载失败" Type:ShowPhotoNo Enabled:YES];
    }];
    NSLog(@"%@",dic);
    return dic;
    
}

#pragma mark  --- POST请求
-(NSDictionary *)requestPOSTWithString:(NSString *)string body:(NSDictionary *)dictionary{
    [self.view.window showHUDWithText:@"加载中" Type:ShowLoading Enabled:YES];
    AFHTTPSessionManager *manage = [AFHTTPSessionManager manager];
    manage.responseSerializer = [AFHTTPResponseSerializer serializer];
     [manage POST:string parameters:dictionary constructingBodyWithBlock:^(id<AFMultipartFormData>  _Nonnull formData) {
//             body
     } progress:^(NSProgress * _Nonnull uploadProgress) {
//             进度
     } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
//         加载成功
      [self.view.window showHUDWithText:@"加载成功" Type:ShowPhotoYes Enabled:YES];
     dic = [NSJSONSerialization JSONObjectWithData:responseObject options:NSJSONReadingMutableContainers error:nil];
     } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
//         加载失败
     [self.view.window showHUDWithText:@"加载失败" Type:ShowPhotoNo Enabled:YES];
     }];
    return dic;

}
#pragma mark    ---自定制下部带标题,图片带点击的imageView
//
-(UIView *)ZLTitleImageWithImage:(NSString *) image placeImage:(NSString *)placreImage imageTitle:(NSString *)title Frame:(CGRect)frame Tag:(int)tag {
    UIView *view = [[UIView alloc]initWithFrame:CGRectMake(frame.origin.x, frame.origin.y, frame.size.width, frame.size.height+30)];
    UIImageView *imagV = [self ZLImageViewWithFrame:CGRectMake(0 , 0, frame.size.width, frame.size.height) Tag:tag];
    
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
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
