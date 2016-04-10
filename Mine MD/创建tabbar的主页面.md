#创建tabbar的主页面
##假设有四个tabbar
###先创建四个控制器
 
	    CCXFirstViewController *firstVC = [[CCXFirstViewController alloc]init];
        CCXSecondViewController *secondVC = [[CCXSecondViewController alloc]init];
        CCXThirdViewController *thirdVC = [[CCXThirdViewController alloc]init];
         CCXFourthViewController *fourthVC = [[CCXFourthViewController alloc]init];
###创建一个UITabBarController

        UITabBarController *tabVC = [[UITabBarController alloc]init];
###使  UITabBarController 具有上面64的顶
      
        tabVC.viewControllers = @[[[UINavigationController alloc]initWithRootViewController:firstVC],[[UINavigationController alloc]initWithRootViewController:secondVC],[[UINavigationController alloc]initWithRootViewController:thirdVC],[[UINavigationController alloc]initWithRootViewController:fourthVC]]
###给tabbar 添加名字和图片
- 把图片和title方法数组里
        
        NSArray *arr = @[@"特卖",@"社区",@"购物车",@"我的"];
        NSArray *arrImage = @[@"icon_home_%@",@"icon_community_%@",@"icon_shop_%@",@"icon_me_%@"];
- for 循环遍历

        for (int i=0; i<arr.count; i++) {
        UIViewController *VC = tabVC.viewControllers[i];
        UITabBarItem *item = [[UITabBarItem alloc]initWithTitle:arr[i] image:[[UIImage imageNamed:[NSString stringWithFormat:arrImage[i],@"nor"]] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal] selectedImage:[[UIImage imageNamed:[NSString stringWithFormat:arrImage[i],@"sele"]] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal]];      
        if (2 ==  i) {
            item.badgeValue = @"5";
        }
        VC.tabBarItem = item;}
- 添加到视图根控制器上

        self.window.rootViewController = tabVC;
        [self.window makeKeyAndVisible];      
        
        
        
