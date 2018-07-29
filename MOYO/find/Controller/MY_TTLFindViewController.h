//
//  MY_TTLFindViewController.h
//  VTIME
//
//  Created by MadridLee on 2017/9/6.
//  Copyright © 2017年 MadridLee. All rights reserved.
//

#import "RootBaseViewController.h"
#import <MAMapKit/MAMapKit.h>
#import <AMapLocationKit/AMapLocationKit.h>
#import <MapKit/MapKit.h>
@interface MY_TTLFindViewController : UIViewController

@property (strong, nonatomic) UIViewController* controllerView;

@property (nonatomic, strong) MAMapView * mapView;

@property (nonatomic, strong) AMapLocationManager * locationManager;

@property (nonatomic, strong) NSDictionary * dict;

@property (nonatomic, assign) NSInteger proid;

@end
