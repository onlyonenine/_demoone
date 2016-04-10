
#CoreLocation框架
##定位(iOS8.0-
- iOS8.0- 的定位实现
- 设置授权说明（段子写得好，用户授权的概率大）
- 设置位置更新的距离过滤（防止过于频繁的调用代理方法）
- 设置定位精度（精度越高，耗电越快。所以要根据需求选择合适的定位精度）
- 后台定位（勾选后台模式：location update）
 
##定位(iOS8.0+适配)
- iOS8.0+授权适配（两种适配方案：通过系统版本号，通过对象是否响应方法）
（配置info.plist文件中对应的键值）
- requestWhenInUseAuthorization 和 requestAlwaysAuthorization 区别
（前者只有在APP前台时可以定位，后者可以在前后台进行定位）
- 勾选后台运行模式location后的变化（在9.0之前，前者后台依然可以定位，
但会出现蓝条；后者不会出现蓝条；）
- 授权状态的变更，调用对应的代理方法（说明不同状态代表的含义，给予用户对应的提示）
- 演示前后台授权和前台授权同时请求时会发生什么情况，并解释原因。
- 在Info.plist文件中添加如下配置：
  1. NSLocationAlwaysUsageDescription
  2. NSLocationWhenInUseUsageDescription

##定位(iOS9.0补充)
- requestWhenInUseAuthorization 和 requestAlwaysAuthorization 区别（前者
只有在APP前台时可以定位，后者可以在前后台进行定位）
- 勾选后台运行模式location后的变化（效果同上，在while using the app 授权模式下，
要想再次使用后台定位，必须使用allowsBackgroundLocationUpdates方法进行设置，
但同样还是会出现蓝条）
- requestLocation 作用：按照定位精确度从低到高进行排序，逐个进行定位。
如果获取到的位置不是精确度最高的那个，也会在定位超时后，通过代理告诉外界
（必须实现代理的-locationManager:didFailWithError:方法， 不能
与startUpdatingLocation方法同时使用）

##【CLLocation对象详解】
- coordinate（当前位置所在的经纬度）
- altitude	（海拔）
- speed	    （当前速度）
- -distanceFromLocation （获取两个位置之间的直线物理距离）
- 场景演示:打印当前用户的行走方向,偏离角度以及对应的行走距离,
	例如:”北偏东30度方向,移动了8米”
- 实现步骤: 
	1. 获取对应的方向偏向(例如”正东””东偏南”)
 	2. 获取对应的偏离角度(并判断是否是正方向)
	3. 计算行走距离
	4. 打印信息

##【指南针】
1. 演示项目效果:
   - 实现思路:1.获取手机设备朝向(距离磁北方向的角度) 2. 让指南针图片反向旋转对应角度,
这样就可以不断指向磁北
2. 获取手机朝向: [locationM startUpdatingHeading];
3. magneticHeading（磁北方向和真北方向，取值范围：0-359.9；顺时针为正）
4. 注意：获取手机设备朝向不需要用户定位授权

##【区域监听】
1. startMonitoringForRegion （CLCircularRegion区域；注意，因为需要使用到用户的
当前位置，所以iOS8.0+后需要请求用户授权）
2. locationManager:didEnterRegion: （进入区域）
3. locationManager:didExitRegion: （离开区域）
4. 后台区域监听

##【(反)地理编码】
1. 演示项目效果
2. CLGeocoder对象
3. 三种编码方案
4. CLPlacemark讲解（locality：城市名称 thoroughfare：街道名称 name：
全称 CLLocation *location）
5. 反地理编码

##【定位的第三方框架】
1. 优点:可以使用block接收用户的位置,corelocation框架定位使用代理进行传值,
代码比较分散
2. 下载框架（locationManager框架）
3. 使用block进行定位（带delayUntilAuthorized参数的定位：超时时间从什么时候开始
计算）（依然要配置info.plist文件对应的键值对）
4. 通过定位请求ID分别取消定位（不会回调block）和强制完成定位（会回调block）
5. 注意:此框架针对于iOS9.0 ,前台授权时,后台是无法获取用户位置
 

