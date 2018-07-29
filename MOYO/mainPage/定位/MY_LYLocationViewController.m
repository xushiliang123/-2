//
//  MY_GLLocationViewController.m
//  VTIME
//
//  Created by gll on 2017/9/12.
//  Copyright © 2017年 MadridLee. All rights reserved.
//

#import "MY_LYLocationViewController.h"

#import "LocationTableViewCell.h"
#import "LOtherTableViewCell.h"
#import <AMapLocationKit/AMapLocationKit.h>
#import "MY_LYMessageInfoModel.h"
@interface MY_LYLocationViewController ()<UISearchBarDelegate, AMapLocationManagerDelegate>
{
    NSArray * _cityAll;
    UISearchBar * _searchBar;
    
	CLLocation * LocationPoint;
}
@property (nonatomic, strong)NSMutableArray * dataArray;
@property (nonatomic, strong)NSMutableArray * letterArray;         //  字母排序
@property (nonatomic, strong) AMapLocationManager *locationManager;

@end

@implementation MY_LYLocationViewController

-(BOOL)hidesBottomBarWhenPushed{
    return YES;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    LocationPoint = [[CLLocation alloc]init];
    
    [self addData];
    
    [self createUI];
    
    [self configLocationManager];
}



#pragma mark - 高德
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
    
    //进行单次带逆地理定位请求
    [self.locationManager requestLocationWithReGeocode:YES completionBlock:^(CLLocation *location, AMapLocationReGeocode *regeocode, NSError *error) {
        
        NSMutableString * cityStr = [NSMutableString stringWithFormat:@"%@", regeocode.city];
       
        LocationPoint = location;
//        location.coordinate.longitude
//        location.coordinate.latitude
        if (self.dataArray.count > 1) {
            
            if ([Utility isBlankString:cityStr]) {
                cityStr = [NSMutableString stringWithFormat:@"角落里"];
            }else{
                [cityStr deleteCharactersInRange:NSMakeRange(cityStr.length - 1, 1)];
            }
            
            [self.dataArray replaceObjectAtIndex:1 withObject:@[cityStr]];
            //
            //            for (NSString * str in self.dataArray) {
            //
            //                NSLog(@"%@", str);
            //            }
            NSIndexSet * indexSet = [NSIndexSet indexSetWithIndex:1];
//
            [self.tableView reloadSections:indexSet withRowAnimation:UITableViewRowAnimationFade];
//            [self.tableView reloadData];
        }
        
    }];
}


#pragma mark - 数据
//  数据懒加载
- (NSMutableArray *)dataArray{
    if (nil == _dataArray) {
        _dataArray = [[NSMutableArray alloc] init];
    }
    return _dataArray;
}


- (void)addData{
    
    self.letterArray = [[NSMutableArray alloc] init];
    
    NSString * path = [[NSBundle mainBundle] pathForResource:@"cityDictionary.plist" ofType:nil];
    
    NSDictionary * cityDict = [NSDictionary dictionaryWithContentsOfFile:path];
    
    NSArray * letArray = [cityDict allKeys];
    
    NSArray * array = [letArray sortedArrayUsingComparator:^NSComparisonResult(id  _Nonnull obj1, id  _Nonnull obj2){
        
        return [obj1 compare: obj2];
    }];
    
    for (NSString * letter in array) {
        
        NSArray * array = cityDict[letter];
        
        [self.dataArray addObject:array];
    }
    
    [self.letterArray addObjectsFromArray:array];
    
    //  热门
    [self.letterArray insertObject:@"热" atIndex:0];
    
    NSArray * hotCity = @[@"上海", @"苏州", @"北京", @"杭州", @"深圳", @"广州"];
    
    NSDictionary * dict = [NSDictionary dictionaryWithObject:hotCity forKey:@"hotCity"];
    
    [self.dataArray insertObject:dict atIndex:0];
    
    //  定位
    [self.letterArray insertObject:@"定" atIndex:0];
    
    NSArray * locationCity = @[@"未定位"];
    
    [self.dataArray insertObject:locationCity atIndex:0];
    
    //  全国
    [self.letterArray insertObject:@"" atIndex:0];
    
    NSArray * nationwide = @[@"全国"];
    
    [self.dataArray insertObject:nationwide atIndex:0];
    
    _cityAll = [NSArray arrayWithArray:self.dataArray] ;
}



#pragma mark - UI相关
- (void)createUI{
    
    [self addNavBtn:nil isLeft:YES target:self action:@selector(backClick) bgImageName:@"BackBtn_gray"];

    
    [self createTableView];
    
    CGRect rect = self.tableView.frame;
    rect.size.height = rect.size.height - 64;
    self.tableView.frame = rect;
    
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    
    self.tableView.tableFooterView = [[UIView alloc] init];
    
    [self.tableView registerNib:[UINib nibWithNibName:@"LocationTableViewCell" bundle:nil] forCellReuseIdentifier:@"LocationTableViewCell"];
    
    [self.tableView registerClass:[LOtherTableViewCell class] forCellReuseIdentifier:@"LOtherTableViewCell"];
    
    // 创建UISearchBar对象
    _searchBar = [[UISearchBar alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 49)];
    
    // 设置没有输入时的提示占位符
    [_searchBar setPlaceholder:@"城市名称"];
    // 显示Cancel按钮
    _searchBar.showsCancelButton = NO;
    
    // 设置代理
    _searchBar.delegate = self;
    
    _searchBar.layer.borderWidth = 1;
    _searchBar.layer.borderColor = [[UIColor whiteColor] CGColor];
    _searchBar.barTintColor = [Utility colorWithHexString:@"f8f8f8" alpha:1];
    self.tableView.tableHeaderView = _searchBar;
    
    
    UITextField * searchField = [_searchBar valueForKey:@"_searchField"];
    
    [searchField addTarget:self  action:@selector(searchBarTextChanged:)  forControlEvents:UIControlEventAllEditingEvents];
    
    //    [[NSNotificationCenter defaultCenter] addObserver:_searchBar selector:@selector(searchBarTextChanged) name:UITextFieldTextDidChangeNotification object:_searchBar.text];
}



#pragma mark - UISearchBarDelegate
// UISearchBarDelegate定义的方法，当搜索文本框内文本改变时激发该方法
- (void)searchBar:(UISearchBar *)searchBar
    textDidChange:(NSString *)searchText
{
    // 调用filterBySubstring:方法执行搜索
    [self filterBySubstring:searchText];
}

// UISearchBarDelegate定义的方法，用户单击虚拟键盘上Search按键时激发该方法
- (void)searchBarSearchButtonClicked:(UISearchBar *)searchBar
{
//    NSLog(@"----searchBarSearchButtonClicked------");
    // 调用filterBySubstring:方法执行搜索
    
    [self filterBySubstring:searchBar.text];
    // 放弃作为第一个响应者，关闭键盘
    [searchBar resignFirstResponder];
}


- (BOOL)searchBarShouldBeginEditing:(UISearchBar *)searchBar{
    
    if (!(self.dataArray.count > 0)) {
        
        [self.dataArray removeAllObjects];
        [self.dataArray addObjectsFromArray:_cityAll];
        [self.tableView reloadData];
    }
    return YES;
}



- (void) filterBySubstring:(NSString*) subStr
{
    if (subStr.length > 0) {
        
        for (NSArray * groupCity in self.dataArray) {
            
            BOOL isExist = [groupCity containsObject:subStr];
            
            if (isExist) {
                
                [self.dataArray removeAllObjects];
                [self.dataArray addObject:@[subStr]];
                [self.tableView reloadData];
                return;
            }
        }
        [self.dataArray removeAllObjects];
        [self.tableView reloadData];
        
    }
//    NSLog(@"----filterBySubstring------");
}



#pragma mark - tableView代理方法
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return self.dataArray.count;
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    //    if (2 == section) {
    //
    //        return 1;
    //    }else{
    
    return [self.dataArray[section] count];
    //    }
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    
    if (0 == section || 1 == section) {
        return 0;
    }
    return 30;
}


- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (2 == indexPath.section) {
        
        return 98;
        
    }else{
        return 45;
    }
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    __weak typeof(self) wSelf = self;
    
    if (2 == indexPath.section) {
        
        static NSString * cellId = @"LocationTableViewCell";
        
        LocationTableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:cellId forIndexPath:indexPath];
        
        NSDictionary * dic = self.dataArray[indexPath.section];
        
        NSArray * cityArray = dic[@"hotCity"];
        
        cell.cityArray = cityArray;
        
        cell.cellClickBlock = ^(NSInteger index){
            
            NSString * locationStr = cityArray[index];
            self.changeLocationBlock(locationStr);
            [wSelf updateRegion:locationStr];
        };
        
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        
        return cell;
        
    }else{
        
        static NSString * otherCellId = @"LOtherTableViewCell";
        
        LOtherTableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:otherCellId forIndexPath:indexPath];
        
        CGSize nameSize = [Utility stringSizeWithString:self.dataArray[indexPath.section][indexPath.row] textSize:14 width:0 height:14];
        
        CGRect rect = cell.nameLabel.frame;
        
        rect.size.width = nameSize.width;
        
        cell.nameLabel.frame = rect;
        NSString *str = self.dataArray[indexPath.section][indexPath.row];

        cell.nameLabel.text = str;
        
        cell.locationLabel.text = nil;
        
        if (1 == indexPath.section) {
            
            CGRect rect = cell.locationLabel.frame;
            
            rect.origin.x = CGRectGetMaxX(cell.nameLabel.frame) + 6;
            
            cell.locationLabel.frame = rect;
            
            cell.locationLabel.text = @"GPS定位";
            NSLog(@"%@",str);
        }
        
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        
        return cell;
    }
}


- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    
    UIColor * color = [Utility colorWithHexString:@"#999999" alpha:1.0];
    
    UILabel * label = [Utility createLabeltitleColor:color frame:CGRectMake(0, 0, SCREEN_WIDTH, 30) BackgroundColor:BGCOLOR textSize:12];
    
    if (2 == section) {
        
        label.text = [NSString stringWithFormat:@"     %@门城市", self.letterArray[section]];
        
    }else{
        
        label.text = [NSString stringWithFormat:@"     %@", self.letterArray[section]];
    }
    
    if (0 == section || 1 == section) {
        
        return nil;
    }else{
        
        return label;
    }
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    NSString * locationStr = nil;
    if (2 == indexPath.section) {
        return;
    }else{
        
//        if ( 0 == indexPath.section && 0 == indexPath.row ) {
//
//            return;
//        }
        
        locationStr = self.dataArray[indexPath.section][indexPath.row];
        if ([locationStr isEqualToString:@"全国"]) {
            return;
        }
        self.changeLocationBlock(locationStr);

        [self updateRegion:locationStr];
    }
}

//索引
- (NSArray*)sectionIndexTitlesForTableView:(UITableView *)tableView{
    
    tableView.sectionIndexColor = GOLDCOLOR;
    return self.letterArray;
}


#pragma mark - 网络请求
- (void)updateRegion:(NSString *)region {
    
    if (self.isHomePage) {
        
        
        NSString * jingdu = [NSString stringWithFormat:@"%f",LocationPoint.coordinate.longitude];
        NSString * weidu = [NSString stringWithFormat:@"%f",LocationPoint.coordinate.latitude];

        //        location.coordinate.latitude;
        
//        NSDictionary * dic;
        if (!jingdu && ![jingdu length]) {
            jingdu = DEFAULT_LONGITUDE;
        }
        if (!weidu && ![weidu length]) {
            weidu =  DEFAULT_LATITUDE;
        }
        if ([region isEqualToString:@""] || [region isEqualToString:@"未定位"] || [Utility isBlankString:region]) {
            region = @"上海";
        }
//        dic = @{@"region":region,@"longitude":jingdu,@"latitude":weidu};
//
//        [TLHTTPRequest MY_postWithBaseUrl:EditInfoUrl parameters:dic success:^(NSURLSessionDataTask * _Nonnull task, NSDictionary * _Nonnull data) {
//
//            if ([[data objectForKey:@"ret"] integerValue] == 0) {
//
//                self.changeLocationBlock(region);
                [self updateUserInfoMethod:region];
//
//                [self.navigationController popViewControllerAnimated:YES];
//            }else{
//                if ([data objectForKey:@"msg"]) {
//                    [LQProgressHud showMessage:[data objectForKey:@"msg"]];
//                }
//            }
//        } failure:^(NSURLSessionDataTask * _Nonnull task, NSError * _Nonnull error) {
//
//            [LQProgressHud showMessage:@"失败"];
//        }];
//
//    } else {
//
//        self.changeLocationBlock(region);
//        [self.navigationController popViewControllerAnimated:YES];
    }
}


-(void)updateUserInfoMethod:(NSString *)region{
    
//    withJingDu:LocationPoint.coordinate.longitude WieDu:LocationPoint.coordinate.latitude
    NSString * where = [NSString stringWithFormat:@"userId = %td",[USERID integerValue]];
    NSArray *arry = [[MY_LLDBManager sharedManager] selectClass:[MY_LYPersonInfoModel class] withWhere:where];
    MY_LYPersonInfoModel *uModel = arry.firstObject;
    
//    MY_LLPersonInfoModel * uModel = [[MessageInfoModel sharedManager] loadPersonModelWithID: [USERID integerValue]];
    uModel.selectRegion = region;
    if (LocationPoint.coordinate.longitude) {
        uModel.longitude = [NSString stringWithFormat:@"%f",LocationPoint.coordinate.longitude];
    }else{
        uModel.longitude = DEFAULT_LONGITUDE;
    }
    
    if (LocationPoint.coordinate.latitude) {
        uModel.latitude = [NSString stringWithFormat:@"%f",LocationPoint.coordinate.latitude];
    }else{
        uModel.longitude = DEFAULT_LATITUDE;
    }
//    [[MessageInfoModel sharedManager] insertModelWith:uModel];
    
    [[MY_LLDBManager sharedManager] updateModel:uModel withWhere:where];
    
    [self.navigationController popViewControllerAnimated:YES];

    
}


- (void)searchBarTextChanged:(UITextField *)textFiled{
    
    if (!(textFiled.text.length > 0)) {
        
        if (!(self.dataArray.count > 0)) {
            
            [_searchBar resignFirstResponder];
            [self.dataArray removeAllObjects];
            [self.dataArray addObjectsFromArray:_cityAll];
            [self.tableView reloadData];
        }
    }
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
