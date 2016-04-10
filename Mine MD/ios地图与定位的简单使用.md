

#ios地图与定位的简单使用
1. 实现地图、导航功能，往往需要先熟悉定位功能，在iOS中通过Core Location框架进行定位操作。Core Location自身可以单独使用，和地图开发框架MapKit完全是独立的，但是往往地图开发要配合定位框架使用。在Core Location中主要包含了定位、地理编码（包括反编码）功能。
2. 代码如下: 

	          #import "ViewController.h"
	          #import <CoreLocation/CoreLocation.h>
	
	          @interface ViewController ()<CLLocationManagerDelegate>
	          /**声明全局变量(记住原因)  要懒加载**/
	          @property(nonatomic,strong)CLLocationManager *LM;
	          @end
	
	          @implementation ViewController {
	          CLLocation  *_location;
	         }
	         //懒加载
	         -(CLLocationManager *)LM {
	         if (!_LM) {
	        _LM = [[CLLocationManager alloc]init];
	        //代理
	        _LM.delegate = self;
	        [_LM requestAlwaysAuthorization];
	        _LM.distanceFilter = 0.1;
	        //定位最准确,耗电最快
	       	_LM.desiredAccuracy = kCLLocationAccuracyBest;
	       }
	       return _LM;
	        }
	      - (void)viewDidLoad {
	    [super viewDidLoad];
	   
	       }
	       //手势点击更新定位
	      -(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent     *)event{
		    [self.LM startUpdatingLocation];
		}
		  //代理事件
		  -(void)locationManager:(CLLocationManager *)manager didUpdateLocations:(NSArray<CLLocation *> *)locations{
		    CLLocation *locationsw= [locations firstObject];
		     //    NSLog(@"%@",locationsw);
		    /* 例如:”北偏东30度方向,移动了8米”
		     实现步骤:
		     1> 获取对应的方向偏向(例如”正东””东偏南”)
		     2> 获取对应的偏离角度(并判断是否是正方向)
		     3> 计算行走距离
		     4> 打印信息
		     */
		    NSString *course = nil;
		    switch ((int)locationsw.course /90) {
		        case 0:
		            course = @"北偏东 ";
		            break;
		        case 1:
		            course = @"东偏南";
		            break;
		        case 2:
		            course = @"南偏西";
		            break;
		        case 3:
		            course = @"西偏北";
		        default:
		            break;
		    }
		    //度数
		    NSString *degree = nil;
		    degree = [NSString stringWithFormat:@"%d度",(int)locationsw.course%90];
		    //距离
		    NSString *distant = nil;
		    if (_location) {
		       distant = [NSString stringWithFormat:@"%f",[locationsw distanceFromLocation:_location]];
		        
		    }
		   _location  =locationsw;
		    NSLog(@"xiaoming %@%@移动%@",course,degree,distant);
		    
		}
3. 注意: 在Info.plist文件中添加如下配置：
    - NSLocationAlwaysUsageDescription
    - NSLocationWhenInUseUsageDescription	
