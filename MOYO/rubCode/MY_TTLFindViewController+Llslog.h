#import "RootBaseViewController.h"
#import <MAMapKit/MAMapKit.h>
#import <AMapLocationKit/AMapLocationKit.h>
#import <MapKit/MapKit.h>
#import "MY_TTLFindViewController.h"
#import "MY_LLMapListViewController.h"
#import "MY_LLCustomerServiceViewController.h"
#import "MY_TTLToBeNobilityViewController.h"
#import "MAAnnotationClustering.h"
#import "MAClusterAnnotationView.h"
#import "MAClusterAnimator.h"
#import "MY_GLTaskPageViewController.h"
#import "MY_TTLMapCheckViewController.h"

@interface MY_TTLFindViewController (Llslog)
- (void)viewWillAppear:(BOOL)animated llslog:(NSString *)llslog;
- (void)viewWillDisappear:(BOOL)animated llslog:(NSString *)llslog;
- (void)viewDidLoadLlslog:(NSString *)llslog;
- (void)setAMapUILlslog:(NSString *)llslog;
- (void)uiConfigLlslog:(NSString *)llslog;
- (void)configLocationManagerLlslog:(NSString *)llslog;
- (void)locationStartWihtZoomLevel:(CGFloat)zoomLevel llslog:(NSString *)llslog;
- (void)initMapViewLlslog:(NSString *)llslog;
- (void)mapView:(MAMapView *)mapView mapDidZoomByUser:(BOOL)wasUserAction llslog:(NSString *)llslog;
- (void)downloadDataLlslog:(NSString *)llslog;
- (void)changeLocationWithCity:(NSString *)city longitude:(NSString *)longitude latitude:(NSString *)latitude llslog:(NSString *)llslog;
- (void)becomeVipClick:(UIButton *)btn llslog:(NSString *)llslog;
- (void)btnHideClick:(UIButton *)btnhide llslog:(NSString *)llslog;
- (void)mapView:(MAMapView *)mapView regionDidChangeAnimated:(BOOL)animated llslog:(NSString *)llslog;
- (void)amapLocationManager:(AMapLocationManager *)manager didFailWithError:(NSError *)error llslog:(NSString *)llslog;
- (void)mapView:(MAMapView *)mapView mapDidMoveByUser:(BOOL)wasUserAction llslog:(NSString *)llslog;
- (void)mapView:(MAMapView *)mapView viewForAnnotation:(id<MAAnnotation>)annotation llslog:(NSString *)llslog;
- (void)mapView:(MAMapView *)mapView didAddAnnotationViews:(NSArray *)views llslog:(NSString *)llslog;
- (void)cellSizeFactorForCoordinator:(MAClusteringManager *)coordinator llslog:(NSString *)llslog;
- (void)mapView:(MKMapView *)mapView didSelectAnnotationView:(MKAnnotationView *)view llslog:(NSString *)llslog;
- (void)btnKefuClickLlslog:(NSString *)llslog;
- (void)publishBtnClickLlslog:(NSString *)llslog;
- (void)aMapIconClickLlslog:(NSString *)llslog;
- (void)tapClickLlslog:(NSString *)llslog;
- (void)didReceiveMemoryWarningLlslog:(NSString *)llslog;
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender llslog:(NSString *)llslog;

@end
