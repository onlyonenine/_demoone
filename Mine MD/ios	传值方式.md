#iOS	传值方式
##1.属性传值
- 在第二个界面的label显示第一个界面textfiled的文本的信息
- 建立两个控制器 一个twoControllers和一个OneControllers 在twoControllers声明一个text属性,用于接收传过来的字符串

        @interface TwoViewController : UIViewController
        @property(nonatomic,copy)NSString *text;//属性传值
        @end
