//
//  AMapViewController.m
//  TogetherLu
//
//  Created by Louie on 16/12/27.
//  Copyright © 2016年 TogetherLu. All rights reserved.
//

#import "MY_TTLFindViewController.h"
#import "MY_LLMapListViewController.h"
#import "MY_LLCustomerServiceViewController.h"
#import "MY_TTLToBeNobilityViewController.h"
/** 大头针 */
#import "MAAnnotationClustering.h"
#import "MAClusterAnnotationView.h"
#import "MAClusterAnimator.h"
#import "MY_GLTaskPageViewController.h"
#import "MY_TTLMapCheckViewController.h"
//  地图缩放比例
#define ZoomLevel 13
#define ZoomLevelMax 9.5

@interface MY_TTLFindViewController ()<MAMapViewDelegate, AMapLocationManagerDelegate,  MAClusteringManagerDelegate>
{
    NSMutableDictionary * _nearbyDic;
    NSMutableArray * _annotations;
    NSMutableArray * _manannotations;
    NSMutableArray * _womanannotations;
    CGFloat _lastPinchScale;
    UIPinchGestureRecognizer * _builtinPinch;
    UIButton* btnHide;
    UIButton* publishBtn;//发布任务
    UIButton* aMapBtn;//定位按钮
    CLLocation *_locationNow;//位置
}
@property (nonatomic, strong) MAClusteringManager *clusteringManager;

@property (nonatomic, strong) MAClusterAnimator *animator;
@property (nonatomic, strong) MY_LYPersonInfoModel *userModel;

@end

@implementation MY_TTLFindViewController

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
//    [UIApplication sharedApplication].statusBarStyle = UIStatusBarStyleLightContent;
    self.controllerView.tabBarController.tabBar.hidden = NO;
    [self.navigationController.navigationBar setBackgroundImage:[[UIImage alloc]init] forBarMetrics:UIBarMetricsDefault];
    [self.navigationController.navigationBar setShadowImage:[[UIImage alloc]init]];
    self.navigationController.navigationBar.hidden = YES;
    self.navigationController.navigationBar.translucent = YES;
//     [[NSNotificationCenter defaultCenter] postNotificationName:@"addheight" object:self userInfo:@{@"height":@(SCREEN_HEIGHT - 49 - 64)}];
    
    NSString * where = [NSString stringWithFormat:@"userId = %td",[USERID integerValue]];
    NSArray *arry = [[MY_LLDBManager sharedManager] selectClass:[MY_LYPersonInfoModel class] withWhere:where];
    self.userModel = arry.firstObject;
//    MY_LLPersonInfoModel *userModel = [[MessageInfoModel sharedManager] loadPersonModelWithID:[USERID integerValue]];
    btnHide.selected = [self.userModel.secretStatus boolValue]; // 0 按钮显示：隐藏     1 按钮显示：显示自己
    [self locationStartWihtZoomLevel:ZoomLevel];
    
    if ([Utility isAuditEnvironment]) {
        
        if ([CLLocationManager authorizationStatus] == kCLAuthorizationStatusDenied){ //没有开启定位
            UIAlertAction * cancelAction = [UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {
                
            }];
            UIAlertAction * confirmAction = [UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
                
                //跳转到定位权限页面
                NSURL *url = [NSURL URLWithString:UIApplicationOpenSettingsURLString];
                if( [[UIApplication sharedApplication] canOpenURL:url] ) {
                    [[UIApplication sharedApplication] openURL:url];
                }
            }];
            UIAlertController * alertCrtl = [UIAlertController alertControllerWithTitle:@"提示" message:[NSString stringWithFormat:@"“MOYO”想要使用您的位置,以便附近的用户方便找到你"] preferredStyle:UIAlertControllerStyleAlert];
            
            [alertCrtl addAction:cancelAction];
            [alertCrtl addAction:confirmAction];
            
            [self presentViewController:alertCrtl animated:YES completion:nil];
        }else{
            
            UIAlertAction * cancelAction = [UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {
                
            }];
            UIAlertAction * confirmAction = [UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
                //跳转到定位权限页面
                //                NSURL *url = [NSURL URLWithString:UIApplicationOpenSettingsURLString];
                //                if( [[UIApplication sharedApplication] canOpenURL:url] ) {
                //                    [[UIApplication sharedApplication] openURL:url];
                //                }
            }];
            UIAlertController * alertCrtl = [UIAlertController alertControllerWithTitle:@"提示" message:[NSString stringWithFormat:@"“MOYO”想要使用您的位置,以便附近的用户方便找到你"] preferredStyle:UIAlertControllerStyleAlert];
            
            [alertCrtl addAction:cancelAction];
            [alertCrtl addAction:confirmAction];
            
            [self presentViewController:alertCrtl animated:YES completion:nil];
        }
    }
    
}

- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
     [UIApplication sharedApplication].statusBarStyle = UIStatusBarStyleDefault;
    [self.navigationController.navigationBar setBackgroundImage:nil forBarMetrics:UIBarMetricsDefault];
    [self.navigationController.navigationBar setShadowImage:nil];
    self.navigationController.navigationBar.hidden = NO;
    self.navigationController.navigationBar.translucent = NO;
//    [self.mapView removeAnnotations:self.mapView.annotations];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    _annotations = [NSMutableArray array];
    _manannotations = [NSMutableArray array];
    _womanannotations = [NSMutableArray array];
    
    _nearbyDic = [NSMutableDictionary dictionary];
//    [self addNavBtn:nil isLeft:YES target:self action:@selector(backClick) bgImageName:@"editInfo_backButton"];

    [self setAMapUI];
    
}


- (void)setAMapUI{
    
    _animator = [MAClusterAnimator new];
    
    self.clusteringManager = [[MAClusteringManager alloc] init];
    
    self.clusteringManager.delegate = self;
    
    //  高德地图
    [self initMapView];
    
    //定位初始化
    [self configLocationManager];
    
    [self uiConfig];
    
    //    [self mapView:self.mapView regionDidChangeAnimated:YES];
}

-(void)uiConfig
{
//    if ([Utility isAuditEnvironment] == NO) {   //非审核创建按钮
//        UIButton* btnVip = [UIButton buttonWithType:UIButtonTypeCustom];
//        [self.view addSubview:btnVip];
//        [btnVip setTitle:@"成为贵族" forState:UIControlStateNormal];
//        [btnVip setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
//        [btnVip addTarget:self action:@selector(becomeVipClick:) forControlEvents:UIControlEventTouchUpInside];
//        btnVip.titleLabel.font = [UIFont systemFontOfSize:12];
//        btnVip.backgroundColor = BTNCOLOR;
//        btnVip.layer.masksToBounds = YES;
//        btnVip.layer.cornerRadius = 27/2;
//        [btnVip mas_makeConstraints:^(MASConstraintMaker *make) {
//            make.right.equalTo(self.view.mas_right).offset(-17);
//            make.top.equalTo(self.view.mas_top).offset(582 * SCREEN_HEIGHT / 667);
//            make.height.mas_equalTo(27);
//            make.width.mas_equalTo(71);
//        }];
//    }
    
    //  判断是正式服 直接显示发布任务
    if (![Utility isAuditEnvironment]) {
        
        btnHide = [UIButton buttonWithType:UIButtonTypeCustom];
        [self.view addSubview:btnHide];
        [btnHide setTitle:@"隐藏自己" forState:UIControlStateNormal];
        [btnHide setTitle:@"显示自己" forState:UIControlStateSelected];
        [btnHide setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        [btnHide addTarget:self action:@selector(btnHideClick:) forControlEvents:UIControlEventTouchUpInside];
        btnHide.titleLabel.font = [UIFont systemFontOfSize:12];
        btnHide.backgroundColor = GOLDCOLOR;
        btnHide.layer.masksToBounds = YES;
        btnHide.layer.cornerRadius = 27/2;
        [btnHide mas_makeConstraints:^(MASConstraintMaker *make) {
            make.right.equalTo(self.view.mas_right).offset(-17);
            //        if ([Utility isAuditEnvironment] == NO) {
            //            make.top.equalTo(self.view.mas_top).offset(544 * SCREEN_HEIGHT / 667);
            //        }else{
            make.top.equalTo(self.view.mas_top).offset(562 * SCREEN_HEIGHT / 667);
            //        }
            
            make.height.mas_equalTo(27);
            make.width.mas_equalTo(71);
        }];
        
        
        publishBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        [self.view addSubview:publishBtn];
        [publishBtn setBackgroundImage:[UIImage imageNamed:@"publishIcon"] forState:0];
        [publishBtn addTarget:self action:@selector(publishBtnClick) forControlEvents:UIControlEventTouchUpInside];
        [publishBtn mas_makeConstraints:^(MASConstraintMaker *make) {
            make.right.equalTo(self.view.mas_right).offset(-17);
            make.bottom.equalTo(btnHide.mas_top).offset(-20);
            make.height.mas_equalTo(71);
            make.width.mas_equalTo(71);
        }];
    }
    
    
    aMapBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [self.view addSubview:aMapBtn];
    [aMapBtn setBackgroundImage:[UIImage imageNamed:@"aMapIcon"] forState:0];
    [aMapBtn addTarget:self action:@selector(aMapIconClick) forControlEvents:UIControlEventTouchUpInside];
    [aMapBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.view.mas_left).offset(25);
        make.bottom.equalTo(self.view.mas_bottom).offset(-20.0);
        make.height.mas_equalTo(46);
        make.width.mas_equalTo(46);
    }];
//    publishIcon
    UIButton* btnKefu = [UIButton buttonWithType:UIButtonTypeCustom];
    [self.view addSubview:btnKefu];
    [btnKefu setTitle:@"联系客服" forState:UIControlStateNormal];
    [btnKefu setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    btnKefu.titleLabel.font = [UIFont systemFontOfSize:12];
    [btnKefu addTarget:self action:@selector(btnKefuClick) forControlEvents:UIControlEventTouchUpInside];
    btnKefu.backgroundColor = GOLDCOLOR;
    btnKefu.layer.masksToBounds = YES;
    btnKefu.layer.cornerRadius = 27/2;
    [btnKefu mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(self.view.mas_right).offset(-17);
        make.top.equalTo(self.view.mas_top).offset(30);
        make.height.mas_equalTo(27);
        make.width.mas_equalTo(71);
    }];
}

#pragma mark - Action Handle
- (void)configLocationManager
{
    self.locationManager = [[AMapLocationManager alloc] init];
    
    [self.locationManager setDelegate:self];
    
    //设置期望定位精度
    [self.locationManager setDesiredAccuracy:kCLLocationAccuracyHundredMeters];
    
    //设置不允许系统暂停定位
    [self.locationManager setPausesLocationUpdatesAutomatically:NO];
    
    //设置定位超时时间
    [self.locationManager setLocationTimeout:DefaultLocationTimeout];
    
    //设置逆地理超时时间
    [self.locationManager setReGeocodeTimeout:DefaultReGeocodeTimeout];
    
    //设置不允许系统暂停定位
    //    [self.locationManager setPausesLocationUpdatesAutomatically:YES];
    
    //设置允许在后台定位
    //    [self.locationManager setAllowsBackgroundLocationUpdates:YES];
    
}

- (void)locationStartWihtZoomLevel:(CGFloat)zoomLevel{
    
    //进行单次带逆地理定位请求
    [self.locationManager requestLocationWithReGeocode:YES completionBlock:^(CLLocation *location, AMapLocationReGeocode *regeocode, NSError *error) {
        if (error) {
            
            if ([Utility isAuditEnvironment]) {// 审核服
                
            }else{
                //            [LQProgressHud showMessage:@"定位失败，请检查定位是否开启"];
                CLLocation *loca =  [[CLLocation alloc] initWithLatitude:31.23 longitude:121.47];
                [self.mapView setCenterCoordinate:loca.coordinate];
                [self.mapView setZoomLevel:12.1 animated:YES];
                _locationNow = loca;
                NSString * longitude = [NSString stringWithFormat:@"%f", loca.coordinate.longitude];
                NSString * latitude = [NSString stringWithFormat:@"%f", loca.coordinate.latitude];
                
                [_nearbyDic setObject:longitude forKey:@"longitude"];
                [_nearbyDic setObject:latitude forKey:@"latitude"];
                
                [self downloadData];
//                [self changeLocationWithCity:regeocode.city longitude:longitude latitude:latitude];
            }
            
        }else{
            //        NSMutableString * address = [NSMutableString stringWithFormat:@"%@%@%@%@", regeocode.city, regeocode.district, regeocode.street, regeocode.number];
            [self.mapView setCenterCoordinate:location.coordinate];
            [self.mapView setZoomLevel:zoomLevel animated:YES];
            _locationNow = location;
            NSString * longitude = [NSString stringWithFormat:@"%f", location.coordinate.longitude];
            NSString * latitude = [NSString stringWithFormat:@"%f", location.coordinate.latitude];
            
            [_nearbyDic setObject:longitude forKey:@"longitude"];
            [_nearbyDic setObject:latitude forKey:@"latitude"];
            
            if (![Utility isAuditEnvironment]) {// 审核服
                [self downloadData];
                [self changeLocationWithCity:regeocode.city longitude:longitude latitude:latitude];
            }
        }
    }];
}

//- (void)setCustomMapStyleWithWebData:(NSData*)data
//{
//    /Users/madridlee/Desktop/开发版本/TogetherLu/TogetherLu/mystyle_sdk_1502874028_0100.data
//}

#pragma mark - Initialization
- (void)initMapView
{
    if (self.mapView == nil)
    {
        [AMapServices sharedServices].enableHTTPS = YES;
        self.mapView = [[MAMapView alloc] initWithFrame:self.view.bounds];
        self.mapView.delegate = self;
        [self.view addSubview:self.mapView];
        NSString *path = [NSString stringWithFormat:@"%@/mystyle_sdk_1502874028_0100.data", [NSBundle mainBundle].bundlePath];
        NSData *data = [NSData dataWithContentsOfFile:path];
        [self.mapView setCustomMapStyleWithWebData:data];
        [self.mapView setCustomMapStyleEnabled:YES];
        self.mapView.showTraffic = NO;
        self.mapView.showsCompass = NO;
        self.mapView.showsScale = NO;
        self.mapView.rotateEnabled = NO;
        self.mapView.rotateCameraEnabled = NO;
        
        ///如果您需要进入地图就显示定位小蓝点，则需要下面两行代码
        self.mapView.showsUserLocation = YES;
        self.mapView.userTrackingMode = MAUserTrackingModeFollow;
       
        //        NSString *path = [NSString stringWithFormat:@"%@/webExportedStyleData.data", [NSBundle mainBundle].bundlePath];
        //        NSData *data = [NSData dataWithContentsOfFile:path];
        //        [self.mapView setCustomMapStyleWithWebData:data];
        //        [self.mapView setCustomMapStyleEnabled:YES];
        
        NSDictionary * locationDic = @{@"longitude":@(121.47),@"latitude":@(31.23)};
//        if (UserObject(@"location")) {
//            locationDic = UserObject(@"location");
//        }
        CGFloat longitude = [locationDic[@"longitude"] doubleValue];
        CGFloat latitude = [locationDic[@"latitude"] doubleValue];
        
        CLLocationCoordinate2D coordinate = CLLocationCoordinate2DMake(latitude, longitude);
        [self.mapView setCenterCoordinate:coordinate];
        [self.mapView setZoomLevel:ZoomLevel animated:YES];
        
//        UIButton* btnOrder = [UIButton buttonWithType:UIButtonTypeCustom];
//        btnOrder.frame = CGRectMake((SCREEN_WIDTH - 135)/2, (self.mapView.frame.size.height - 62 - 64 - 45)/2, 135, 62);
//        [btnOrder setImage:[UIImage imageNamed:@"clickOrd"] forState:UIControlStateNormal];
//        [self.mapView addSubview:btnOrder];
//        [btnOrder addTarget:self action:@selector(tapClick) forControlEvents:UIControlEventTouchUpInside];
    }
}

- (void)mapView:(MAMapView *)mapView mapDidZoomByUser:(BOOL)wasUserAction{
    
    CGFloat zoomLevel = mapView.zoomLevel;
    if (zoomLevel < ZoomLevelMax) {
        
        [self.mapView setZoomLevel:ZoomLevelMax animated:YES];
    } else {
    }
}
#pragma mark - 数据相关
- (void)downloadData {
    
//    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_BACKGROUND, 0), ^{
//        NSLog(@"downloadData-- %@",[NSThread currentThread]);
        [TLHTTPRequest MY_getWithBaseUrl:AMPNearURL parameters:_nearbyDic success:^(NSURLSessionDataTask * _Nonnull task, NSDictionary * _Nonnull dict) {
            if ([[dict objectForKey:@"ret"] boolValue] == 0) {
                [_annotations removeAllObjects];
                [_manannotations removeAllObjects];
                [_womanannotations removeAllObjects];
                for (NSDictionary * dic in dict[@"info"]) {
                    
                    MAAnnotationCluster * pintAnn = [[MAAnnotationCluster alloc] init];
                    [pintAnn setValuesForKeysWithDictionary:dic];
                    
                    CGFloat latitude = [dic[@"latitude"] floatValue];
                    CGFloat longitude = [dic[@"longitude"] floatValue];
                    
                    CLLocationCoordinate2D coordinate = CLLocationCoordinate2DMake(latitude, longitude);
                    //请求数据回来存
                    pintAnn.coordinate  = coordinate;
                    //                    pintAnn.userId      = [NSString stringWithFormat:@"%@", dic[@"userId"]];
                    //                    pintAnn.imageString = [NSString stringWithFormat:@"%@", dic[@"headIcon"]];
                    //                    pintAnn.nickName    = dic[@"nickName"];
                    //                    pintAnn.serverType  = dic[@"serverType"];
                    
                    if ([[dic[@"sex"] stringValue] isEqualToString:@"0"]) {
                        [_womanannotations addObject:pintAnn];
                    }else{
                        [_manannotations addObject:pintAnn];
                    }
                }
                
                [_annotations addObjectsFromArray:_womanannotations];
                [_annotations addObjectsFromArray:_manannotations];
                
//                NSLog(@"dic -- %ld -- %@ ",_annotations.count,_annotations);
                [self.clusteringManager setAnnotations:_annotations];
                [self mapView:self.mapView regionDidChangeAnimated:YES];
            }
        } failure:^(NSURLSessionDataTask * _Nonnull task, NSError * _Nonnull error) {
            
        }];
//    });
}
- (void)changeLocationWithCity:(NSString *)city longitude:(NSString *)longitude latitude:(NSString *)latitude {
    NSMutableString * cityName = [NSMutableString stringWithFormat:@"%@", city];
    if ([Utility isBlankString:cityName]) {
        cityName = [NSMutableString stringWithFormat:@"角落里"];
    }else{
        [cityName deleteCharactersInRange:NSMakeRange(cityName.length - 1, 1)];
    }
    //    储存数据库
    NSString * where = [NSString stringWithFormat:@"userId = %td",[USERID integerValue]];
    NSArray *arry = [[MY_LLDBManager sharedManager] selectClass:[MY_LYPersonInfoModel class] withWhere:where];
    MY_LYPersonInfoModel *uModel = arry.firstObject;
    
//    MY_LLPersonInfoModel * uModel = [[MessageInfoModel sharedManager] loadPersonModelWithID: [USERID integerValue]];
    if(uModel.selectRegion.length <1 ){//是否有地理位置信息
        uModel.selectRegion = @"上海";
    }
//    NSLog(@"FindViewPage:longitude-- %@  latitude-- %@",longitude,latitude);
    uModel.region = cityName;
    uModel.longitude = longitude;
    uModel.latitude = latitude;
//    [[MessageInfoModel sharedManager] insertModelWith:uModel];
    [[MY_LLDBManager sharedManager] updateModel:uModel withWhere:where];
    
    [TLHTTPRequest MY_postWithBaseUrl:EditInfoUrl parameters: @{@"region":cityName,@"longitude":longitude,@"latitude":latitude} success:^(NSURLSessionDataTask * _Nonnull task, NSDictionary * _Nonnull data) {
        
        if ([[data objectForKey:@"ret"] integerValue] == 0) {
        }else{
            if ([data objectForKey:@"msg"]) {
                [LQProgressHud showMessage:[data objectForKey:@"msg"]];
            }
        }
    } failure:^(NSURLSessionDataTask * _Nonnull task, NSError * _Nonnull error) {
        [LQProgressHud showMessage:@"定位失败"];
    }];
    
}

-(void)becomeVipClick:(UIButton *)btn
{
    MY_TTLToBeNobilityViewController* noVc = [[MY_TTLToBeNobilityViewController alloc]init];
//    noVc.hidesBottomBarWhenPushed = YES;
    [self.navigationController pushViewController:noVc animated:YES];
}

//  隐藏自己
- (void)btnHideClick:(UIButton *)btnhide {
    
    btnhide.selected = !btnhide.selected;
    
    NSString * status = @"0";
    if (btnhide.selected) {
        status = @"1";
    }
    
    NSMutableDictionary * parameters = [NSMutableDictionary dictionaryWithObject:status forKey:@"secretStatus"];
    [TLHTTPRequest MY_postWithBaseUrl:HideMeURL parameters:parameters success:^(NSURLSessionDataTask * _Nonnull task, NSDictionary * _Nonnull data) {
        if ([[data objectForKey:@"ret"] integerValue] == 0) {
            NSString * message = @"隐藏自己成功";
            if (!btnhide.selected) {
                message = @"显示自己成功";
            }
            NSString * where = [NSString stringWithFormat:@"userId = %td",[USERID integerValue]];
//            NSArray *arry = [[MY_LLDBManager sharedManager] selectClass:[MY_LLPersonInfoModel class] withWhere:where];
//            MY_LLPersonInfoModel *userModel = arry.firstObject;
            
//            MY_LLPersonInfoModel *userModel = [[MessageInfoModel sharedManager] loadPersonModelWithID:[USERID integerValue]];
            self.userModel.secretStatus = @([status intValue]);
//            [[MessageInfoModel sharedManager] insertModelWith:userModel];
            [[MY_LLDBManager sharedManager] updateModel:self.userModel withWhere:where];
            [LQProgressHud showMessage:message];

        }
        else{
            if ([data objectForKey:@"msg"]) {
                [LQProgressHud showMessage:[data objectForKey:@"msg"]];
            }
        }
    } failure:^(NSURLSessionDataTask * _Nonnull task, NSError * _Nonnull error) {
        [LQProgressHud showMessage:@"登录失败，请检查网络"];
    }];

}


#pragma mark - 代理相关
#pragma mark - MAMapViewDelegate
- (void)mapView:(MAMapView *)mapView regionDidChangeAnimated:(BOOL)animated
{
    // We add a new operation queue to do the clustering
    
//    [[NSOperationQueue new] addOperationWithBlock:^{
//        NSLog(@"regionDidChangeAnimated --%@",[NSThread currentThread]);
        double scale = self.mapView.bounds.size.width / self.mapView.visibleMapRect.size.width;
        NSArray *annotations = [self.clusteringManager clusteredAnnotationsWithinMapRect:mapView.visibleMapRect withZoomScale:scale];
        
        // The clusteringManager will get the main queue to do the UI stuff.
        [self.clusteringManager displayAnnotations:annotations onMapView:mapView];
//    }];
}

//  AMapLocationManager Delegate
- (void)amapLocationManager:(AMapLocationManager *)manager didFailWithError:(NSError *)error
{
//    NSLog(@"%s, amapLocationManager = %@, error = %@", __func__, [manager class], error);
}


- (void)mapView:(MAMapView *)mapView mapDidMoveByUser:(BOOL)wasUserAction{
    
    MKCoordinateRegion region;
    
    CLLocationCoordinate2D centerCoordinate = mapView.region.center;
    region.center= centerCoordinate;
    
    NSString * longitude = [NSString stringWithFormat:@"%f", centerCoordinate.longitude];
    NSString * latitude = [NSString stringWithFormat:@"%f", centerCoordinate.latitude];
    
    [_nearbyDic setObject:longitude forKey:@"longitude"];
    [_nearbyDic setObject:latitude forKey:@"latitude"];
    //    [self downloadData];
}


- (MAAnnotationView *)mapView:(MAMapView *)mapView viewForAnnotation:(id<MAAnnotation>)annotation
{
   
    if ([annotation isKindOfClass:[MAUserLocation class]]) {
        static NSString *const ClusterAnnotationMyID = @"ClusterAnnotationMyID";
        MAClusterAnnotationView *myView = (MAClusterAnnotationView *)[mapView dequeueReusableAnnotationViewWithIdentifier:ClusterAnnotationMyID];

        if (!myView) {
            myView = [[MAClusterAnnotationView alloc] initWithAnnotation:annotation reuseIdentifier:ClusterAnnotationMyID];
            myView.userInteractionEnabled = NO;
            MAAnnotationCluster *cluster = [[MAAnnotationCluster alloc]init];
            //大头针数据
            cluster.sex = @(8);
            myView.annot = cluster;
        }
        return myView;
//        return nil;
    }
    else if ([annotation isKindOfClass:[MAAnnotationCluster class]]) {
        static NSString *const ClusterAnnotationReuseID = @"ClusterAnnotationReuseID";
        MAAnnotationCluster *cluster = (MAAnnotationCluster *)annotation;
        cluster.title = [NSString stringWithFormat:@"%zd items",[cluster.annotations count]];

        MAClusterAnnotationView *clusterView = (MAClusterAnnotationView *)[mapView dequeueReusableAnnotationViewWithIdentifier:ClusterAnnotationReuseID];

        if (!clusterView) {

            clusterView = [[MAClusterAnnotationView alloc] initWithAnnotation:annotation reuseIdentifier:ClusterAnnotationReuseID];

            clusterView.canShowCallout = NO;

            clusterView.calloutOffset = CGPointMake(0, -5);

            //大头针数据
            MAAnnotationCluster *firCluster = cluster;
            if (cluster.annotations) {
                firCluster = cluster.annotations.firstObject;
            }
            //建立model存放
            clusterView.userId   = [NSString stringWithFormat:@"%@", firCluster.userId];
            clusterView.portrait = [NSString stringWithFormat:@"%@", firCluster.headIcon];

            clusterView.annot = firCluster;
            clusterView.annotation = firCluster;

            clusterView.annotations = cluster.annotations;
        }

        clusterView.count = [cluster.annotations count] >  1 ? [cluster.annotations count] : 1 ;
        return clusterView;
    }
    return nil;
}


- (void)mapView:(MAMapView *)mapView didAddAnnotationViews:(NSArray *)views
{
    __weak __typeof(self) weakSelf = self;
    [views  enumerateObjectsUsingBlock:^(UIView* obj, NSUInteger idx, BOOL *stop) {
        __strong   __typeof(weakSelf) strongSelf = weakSelf;
        if ([obj isKindOfClass:[MAClusterAnnotationView class]]) {
            [strongSelf.animator addAnimationToView:obj];
        }
    }];
}

#pragma mark -  MAClusteringManagerDelegate
- (CGFloat)cellSizeFactorForCoordinator:(MAClusteringManager *)coordinator
{
    return 1.0;
}

//点击标注视图事件
- (void)mapView:(MKMapView *)mapView didSelectAnnotationView:(MKAnnotationView *)view {
    
     if (!self.userModel.isNoble && ![self.userModel.inIndex integerValue]){
        MY_TTLMapCheckViewController *mapCheckVC = [[MY_TTLMapCheckViewController alloc]init];
        [self.navigationController pushViewController:mapCheckVC animated:YES];
         return;
     }
    
    MAClusterAnnotationView *clusterView = (MAClusterAnnotationView *)view;
    
    MAAnnotationCluster *cluster = (MAAnnotationCluster *)clusterView.annotation;;
    
    if (clusterView.annotations.count > 1) {
        MY_LLMapListViewController * listVC = [[MY_LLMapListViewController alloc] init];
        listVC.list = cluster.annotations;
        listVC.vcTitle = @"寻Ta";
//        listVC.hidesBottomBarWhenPushed = YES;
        [self.navigationController pushViewController:listVC animated:YES];
    }
    else {
        MY_TTLSelfCenterViewController* selfVc = [[MY_TTLSelfCenterViewController alloc]init];
        
        selfVc.userID = [NSString stringWithFormat:@"%@", cluster.userId];
        
        [self.navigationController pushViewController:selfVc animated:YES];
        
    }
    
}


- (void)btnKefuClick {
    MY_LLCustomerServiceViewController* cusVc = [[MY_LLCustomerServiceViewController alloc]initWithConversationChatter:@"kefu1" conversationType:EMConversationTypeChat];
    cusVc.title = @"客服";
//    cusVc.hidesBottomBarWhenPushed = YES;
    [self.navigationController pushViewController:cusVc animated:YES];
}
#pragma mark ----- 发布任务 ------
- (void)publishBtnClick{
    MY_GLTaskPageViewController * taskVC = [[MY_GLTaskPageViewController alloc]init];
//    taskVC.hidesBottomBarWhenPushed = YES;
    [self.navigationController pushViewController:taskVC animated:YES];
}
#pragma mark ----- 地图重新定位 ------
- (void)aMapIconClick{

    [self locationStartWihtZoomLevel:ZoomLevel];
    
//    [self.mapView setCenterCoordinate:_locationNow.coordinate];

}

- (void)tapClick{
    
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
