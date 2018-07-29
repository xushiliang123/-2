//
//  CounterMarkViewController.m
//  TogetherLu
//
//  Created by gll on 2017/6/14.
//  Copyright © 2017年 TogetherLu. All rights reserved.
//

#import "CounterMarkViewController.h"
#import "CounterMarkCollectionCell.h" // CollectionCell
#import "AttributeMarkLabel.h"// custom label
#import "MY_LYLoginViewController.h"
#import "MY_LYHomePageViewController.h"
#import "MY_TTLEditInfoViewController.h"

//  修改资料
#import "MY_GLEditMyInfoViewController.h"

#import "SystemMarkModel.h"//标签

static NSString *collectionSectionIndentider = @"collectionSectionIndentider";
@interface CounterMarkViewController ()<UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout>
{
    NSArray * _tasteArray;
    NSArray * _selectedTasteArray;
}
@property (strong,nonatomic)UICollectionView * collectionView;
@property (strong,nonatomic)NSMutableArray * dataAry;
@property (strong,nonatomic)NSMutableArray * selectedMarkAry;
@end

@implementation CounterMarkViewController

-(BOOL)hidesBottomBarWhenPushed{
    return YES;
}


//-(void)backClick{
//
//    for (UIViewController * vc in self.navigationController.viewControllers) {
//        //                    去首页
//        if ([vc isKindOfClass:[MY_TTLLoginViewController class]]) {
//
////            [self.navigationController popToViewController:vc animated:YES];
//            [vc dismissViewControllerAnimated:NO completion:^{
//                [[NSNotificationCenter defaultCenter]postNotificationName:@"KNoticaationRequestLocation" object:nil];
//                [[NSNotificationCenter defaultCenter]postNotificationName:KNoticationDaiyan object:nil];
//            }];
//            self.tabBarController.selectedIndex = 0;
//        }else if([vc isKindOfClass:[MY_TTLEditInfoViewController class]]){
//
//            [self.navigationController popToViewController:vc animated:YES];
//        }else if([vc isKindOfClass:[MY_GLEditMyInfoViewController class]]){
////            [self.navigationController popToViewController:vc animated:YES];
//            [vc dismissViewControllerAnimated:NO completion:^{
//                [[NSNotificationCenter defaultCenter]postNotificationName:@"KNoticaationRequestLocation" object:nil];
//                [[NSNotificationCenter defaultCenter]postNotificationName:KNoticationDaiyan object:nil];
//            }];
//        }else{
//            [vc dismissViewControllerAnimated:NO completion:^{
//                [[NSNotificationCenter defaultCenter]postNotificationName:@"KNoticaationRequestLocation" object:nil];
//                [[NSNotificationCenter defaultCenter]postNotificationName:KNoticationDaiyan object:nil];
//            }];
//        }
//    }
//
////    [[NSNotificationCenter defaultCenter] postNotificationName:@"gameover" object:nil];
//
//}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.navigationItem.title = @"标签";
    
    [self.navigationController.navigationBar setTitleTextAttributes:@{NSForegroundColorAttributeName:[UIColor whiteColor]}];
    
//    UserSetObject(@"2",@"isSetTag");
    [[NSUserDefaults standardUserDefaults] synchronize];
    
    [self postOfDataRequest];
    
    [self loadUI];
    [self addNavBtn:@"" isLeft:YES target:nil action:nil bgImageName:@""];
    [self.navigationController.navigationItem setHidesBackButton:YES];
}

- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    
    [UIApplication sharedApplication].statusBarStyle = UIStatusBarStyleLightContent;
    //    self.tabBarController.tabBar.hidden = NO;
    
    [self.navigationController.navigationBar setBackgroundImage:[[UIImage alloc]init] forBarMetrics:UIBarMetricsDefault];
    [self.navigationController.navigationBar setShadowImage:[[UIImage alloc]init]];
    self.navigationController.navigationBar.translucent = YES;
}


- (void)viewWillDisappear:(BOOL)animated{
    [super viewWillDisappear:animated];
    
    [UIApplication sharedApplication].statusBarStyle = UIStatusBarStyleDefault;
    
    [self.navigationController.navigationBar setBackgroundImage:nil forBarMetrics:UIBarMetricsDefault];
    [self.navigationController.navigationBar setShadowImage:nil];
    self.navigationController.navigationBar.translucent = NO;
    
}

-(void)viewDidAppear:(BOOL)animated{
    [super viewDidAppear:animated];
    
    [UIApplication sharedApplication].statusBarStyle = UIStatusBarStyleDefault;
    if ([self.navigationController respondsToSelector:@selector(interactivePopGestureRecognizer)]) {
        self.navigationController.interactivePopGestureRecognizer.enabled = NO;
    }
}

// UI 初始化
-(void)loadUI{
    self.automaticallyAdjustsScrollViewInsets = NO;
    self.view.backgroundColor = [UIColor blackColor];
    [self addNavBtn:nil isLeft:YES target:self action:@selector(backClicksss) bgImageName:@"editInfo_backButton"];

    
    
    
    //    Header View
   //    顶部label

    //      设item layout
    UICollectionViewFlowLayout *flowLayout = [[UICollectionViewFlowLayout alloc] init];
    flowLayout.itemSize = CGSizeMake(75, 30);//.....cell的大小
    flowLayout.minimumLineSpacing = 5.0; //.........每行 cell的上下间距
    flowLayout.minimumInteritemSpacing = 5.0;//.....每行 cell的左右间距

    flowLayout.sectionInset = UIEdgeInsetsMake(8.0, 26.0, 20.0, 26.0);// 每个section 的上左下右 间距
    flowLayout.scrollDirection = UICollectionViewScrollDirectionVertical;
    
    CGFloat height = SCREEN_HEIGHT - StatusNavigationHeight - TabbarHeight;
    self.collectionView =[[UICollectionView alloc]initWithFrame:CGRectMake(0,StatusNavigationHeight, SCREEN_WIDTH  , height)// 50-顶部label 60-底部按钮
                                              collectionViewLayout:flowLayout];
    //      cell
    [self.collectionView registerNib:[UINib nibWithNibName:NSStringFromClass([CounterMarkCollectionCell class]) bundle:nil] forCellWithReuseIdentifier:@"CounterMarkCollectionCell"];
    //      header
    [self.collectionView registerClass:[UICollectionReusableView class] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:collectionSectionIndentider];
    self.collectionView.backgroundColor = [UIColor blackColor];
    //      代理
    self.collectionView.delegate=self;
    self.collectionView.dataSource=self;
    
    //      指示条
    self.collectionView.showsVerticalScrollIndicator = NO;
    [self.view addSubview:self.collectionView];
    
    [self.view addSubview:[self bottomButtonView]];//底部Button
}

// 底部 按钮
-(UIView *)bottomButtonView{
    
//    UIView * bottomView = [[UIView alloc]initWithFrame:CGRectMake(0, SCREEN_HEIGHT - 60 - 64, SCREEN_WIDTH, 60)];
//    bottomView.backgroundColor = [UIColor blackColor];
    CGFloat width = SCREEN_WIDTH - (30 * 2);// 按钮宽
    CGFloat height = 46; // 按钮高
    CGFloat spaceX = 30; // 按钮距屏幕的距离
    NSArray * titleStr = @[@"确定"];
    UIButton * btn = [UIButton buttonWithType:UIButtonTypeCustom];
    [btn setFrame:CGRectMake(spaceX , SCREEN_HEIGHT - 22 - height, width, height)];
//        [btn setBackgroundColor:BLUECOLOR];
    [btn setTitleColor:[Utility colorWithHexString:@"ffffff" alpha:1.0] forState:(UIControlStateNormal)];
    [btn setTitle:titleStr[0] forState:(UIControlStateNormal)];
    [btn addTarget:self action:@selector(makeSureOrCancelClickMethod:) forControlEvents:(UIControlEventTouchUpInside)];
    btn.layer.cornerRadius = height * 0.5;
    [btn.layer setMasksToBounds:YES];
    btn.backgroundColor = GOLDCOLOR;
    [self.view addSubview:btn];
    
    return btn;
}

#pragma mark ## 确定或者取消方法
-(void)makeSureOrCancelClickMethod:(UIButton*)sender{
    
        [sender setEnabled:NO];

        NSMutableDictionary * parameter = [[NSMutableDictionary alloc]initWithCapacity:0];
//        确定
        
//        把已经选中的 取出加入数组中
//        NSMutableArray * editTagAry = [NSMutableArray arrayWithCapacity:0];// 此数组存储tag 为了编辑资料页显示
        NSString * allMark = @"";
//        遍历数组 取出section 和与之对应的subtitle
        for (SystemMarkModel* diction in self.selectedMarkAry) {
            
            NSString* markStr = @"";
            NSString* interest = @"";
            int m = 0;

//            遍历子标签 按照row 取出对应的String
            for (NSInteger j = 0; j < [[diction tagList] count]; j++) {
                    
                MarkModel * numModel = [[diction tagList] objectAtIndex:j];
                
                if ([numModel.status integerValue] == 1) {
                    markStr = numModel.name;
                    if ([diction.name isEqualToString:@"风格"]) {
                        
                        [parameter setObject:markStr forKey:@"style"];
                    }else if ([diction.name isEqualToString:@"职业"]) {
                        
                        [parameter setObject:markStr forKey:@"occupation"];
                    }else if ([diction.name isEqualToString:@"爱好"]) {
                        
                        if ([interest length]) {
                           
                            interest = markStr;
                            markStr = interest;
                            
                            
                            
                            
                            [parameter setObject:[NSString stringWithFormat:@"%@/%@",[parameter objectForKey:@"interest"],markStr] forKey:@"interest"];
                        }else{
                            interest = markStr;
                            markStr = interest;
                            [parameter setObject:markStr forKey:@"interest"];
                        }
                        
                    }else if ([diction.name isEqualToString:@"星座"]) {
                        
                        [parameter setObject:markStr forKey:@"constellation"];
                    }
                    
                    
                    
                    
                    
                    
                    
                    
                    
                    if ([allMark length]) {

                        allMark = [NSString stringWithFormat:@"%@/%@",allMark,markStr];
                    }else{
                        allMark = markStr;
                    }
                }
            }
        }
    
    
    
    
//        数据请求 修改标签
        [MBProgressHUD showHUDAddedTo:self.view animated:YES];
    
    
    
    
//
        [TLHTTPRequest MY_postWithBaseUrl:EditUserTagUrl parameters:parameter success:^(NSURLSessionDataTask * _Nonnull task, NSDictionary * _Nonnull data) {
            if (0 == [[data objectForKey:@"ret"] integerValue]) {
                
                [MBProgressHUD hideHUDForView:self.view animated:YES];

                [LQProgressHud showMessage:@"设置成功"];
                
//                [self assembleMarkToString:editTagAry];
//                [self assembleMarkToString:tagAry];
                
                
//                NSLog(@"%@",allMark);
                
                
                dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.4 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
                    
                    if (self.counterMarkBlock && [allMark length]) {
                        
                        self.counterMarkBlock(allMark);
                    }
                    
                    [sender setEnabled:YES];
                    
                    [self backClick];
                });
                
            }else{
                
                [MBProgressHUD hideHUDForView:self.view animated:YES];

                [LQProgressHud showMessage:[data objectForKey:@"msg"]];
                [sender setEnabled:YES];
            }

        } failure:^(NSURLSessionDataTask * _Nonnull task, NSError * _Nonnull error) {

            [MBProgressHUD hideHUDForView:self.view animated:YES];

            [LQProgressHud showMessage:@"加载失败"];
            [sender setEnabled:YES];

        }];
    
}
- (void)backClicksss{
    [self.navigationController popViewControllerAnimated:YES];
}
- (void)backClick{
    [self.navigationController popToRootViewControllerAnimated:YES];
}

//  数组/字典 转成josn 字符串
-(NSString*)ObjectTojsonString:(id)object
{
    NSString *jsonString = [[NSString alloc]init];
    
    NSError *error;
    
    NSData *jsonData = [NSJSONSerialization dataWithJSONObject:object
                        
                                                      options:NSJSONWritingPrettyPrinted
                        
                                                        error:&error];
    
    if (! jsonData) {
        
        NSLog(@"error: %@", error);
        
    } else {
        
        jsonString = [[NSString alloc] initWithData:jsonData encoding:NSUTF8StringEncoding];
        
    }
    
    NSMutableString *mutStr = [NSMutableString stringWithString:jsonString];
    
    NSRange range = {0,jsonString.length};
    
    [mutStr replaceOccurrencesOfString:@" "withString:@""options:NSLiteralSearch range:range];
    
    NSRange range2 = {0,mutStr.length};
    
    [mutStr replaceOccurrencesOfString:@"\n"withString:@""options:NSLiteralSearch range:range2];
    
    return mutStr;
    
}

// 将数组中的标签 拼接成字符串
-(void)assembleMarkToString:(NSArray *)arr{
    
    NSString * strMark = @"";
    
    for (NSDictionary* dictData in arr) {
        if ([dictData objectForKey:@"userTagList"]) {
        
            NSMutableArray* arrList = [dictData objectForKey:@"userTagList"];
            for (int i = 0; i < arrList.count; i ++) {
                NSString* strTag1 = arrList[i];
                if ([Utility isBlankString:strMark]) {
                    strMark = [NSString stringWithFormat:@"%@",strTag1];
                }
                else{
                    
                    strMark = [strMark stringByAppendingFormat:@"/%@",strTag1];
                }
            }
        }
    }
    
//    if (UserObject(@"userMark")) {
//        UserRemObject(@"userMark");
//    }
//    UserSetObject(strMark, @"userMark");
}

// Request 标签
-(void)postOfDataRequest{
    
    [TLHTTPRequest MY_postWithBaseUrl:GetTagUrl parameters:@{} success:^(NSURLSessionDataTask * _Nonnull task, NSDictionary * _Nonnull data) {
        
        if ([[data objectForKey:@"ret"] integerValue] == 0) {
            
            if ([[data objectForKey:@"info"] count]) {
                
                if ([self.dataAry count]) {
                    [self.dataAry removeAllObjects];
                }
                // 如果 status  0 则不选中,  1 选中
                [self.dataAry addObjectsFromArray: [data objectForKey:@"info"]];
//                [self.selectedMarkAry addObjectsFromArray: [data objectForKey:@"info"]];
                
                for (NSInteger a = 0; a < [data[@"info"] count]; a++) {
                    
                    NSDictionary * dic = [data[@"info"] objectAtIndex:a];
                    SystemMarkModel * sysM = [SystemMarkModel new];
                    [sysM setValuesForKeysWithDictionary:dic];
                    
                    NSMutableArray * bAry = [NSMutableArray arrayWithCapacity:0];
                    
                    BOOL isExistence = NO;
                    for (NSInteger b = 0; b < [dic[@"tagList"] count]; b++) {
                        
                        NSDictionary * bDic = [dic[@"tagList"] objectAtIndex:b];
                        MarkModel * markM = [MarkModel new];
                        [markM setValuesForKeysWithDictionary:bDic];
                        [bAry addObject:markM];
                        
                        
                        
                        if ([markM.status integerValue]) {
                            isExistence = YES;
                        }
                    }
                    
                    // 如果分区里面没有选中的 那么久默认第一个选中
                    if (!isExistence) {
                        
                        if (2 == a) {//默认选择两个
                            
                            MarkModel* reM = bAry[3];
                            reM.status = @1;
                            [bAry replaceObjectAtIndex:3 withObject:reM];
                            
                        }
                        
                        MarkModel* reM = bAry[0];
                        reM.status = @1;
                        [bAry replaceObjectAtIndex:0 withObject:reM];
                    }
                    
                    sysM.tagList = [NSMutableArray arrayWithCapacity:0];
                    [sysM.tagList addObjectsFromArray: bAry];

//                    sysM.tagList = bAry;
                    [self.selectedMarkAry addObject:sysM];
                }
                
            }
            [self.collectionView reloadData];
        }else{
            if ([data objectForKey:@"msg"]) {
                [LQProgressHud showMessage:[data objectForKey:@"msg"]];
            }
        }
    } failure:^(NSURLSessionDataTask * _Nonnull task, NSError * _Nonnull error) {
        [LQProgressHud showMessage:@"请求失败，请检查网络"];
    }];
}

//                for (NSInteger a = 0 ; a <[data[@"info"] count]; a++) {
////
//                    NSDictionary * markDic = [data[@"info"] objectAtIndex:a];
//
//                    BOOL isExistence = NO;
//
//                    for (NSInteger i = 0 ; i <[markDic[@"tagList"] count]; i++) {
//
//                        NSInteger status = [[markDic[@"tagList"] objectAtIndex:i][@"status"] integerValue];
//
//                        if (1 == status) {
//
//                            isExistence = YES;
//                        }
//                    }
//
//                    if (!isExistence) {
//
//                        [self.selectedMarkAry[a][@"tagList"][0] setObject:@(1) forKey:@"status"];
//                    }


//
////                        if (0 == i ) {
//
//                        NSDictionary * tagDic = [markDic[@"tagList"] objectAtIndex:i];
//                        NSNumber * rowNum = [tagDic objectForKey:@"status"];
//
//                        NSNumber * sectionNum = [NSNumber numberWithInteger:a];
//
////                            NSMutableArray * rowAry = [NSMutableArray arrayWithObject:rowNum];
////                            NSDictionary * selectDic = @{sectionNum:rowAry};
////                            [self.selectedMarkAry addObject:selectDic];
//
//
//                        //  遍历此风格中的子标签 存在 则加入 已选数组中
//                        BOOL isExistence = NO;
//                        for (NSDictionary* dic in self.selectedMarkAry) {
//                            //  存在 则加入
//                            if (dic[sectionNum]) {
//                                isExistence = YES;
//
//                                NSInteger maxNum = [[markDic objectForKey:@"maxNum"] integerValue];
//
//                                //  判断当前section  已选择 是否 > 最多可选择数  如果当前点击是数组中有的 则取消选择 ，此section又可以选
//                                if ([dic[sectionNum] count] < maxNum || 0 == maxNum) {
//                                    [dic[sectionNum] addObject:rowNum];
//                                }else if ([dic[sectionNum] count] >= maxNum )
//                                {
//                                    continue;
//                                }
//                            }
//                        }
//                        //  没有section 则加入一组
//                        if (!isExistence) {
//                            //            if 最大可选数量是0 则直接return
//                            //                                    if ([model.maxNum integerValue] <= 0) {
//                            //                                        continue;
//                            //                                    }
//
//                            NSMutableArray * rowAry = [NSMutableArray arrayWithObject:rowNum];
//                            NSDictionary * selectDic = @{sectionNum:rowAry};
//                            [self.selectedMarkAry addObject:selectDic];
//                        }
//
////                        }else if (2 == a && 3 == i){
//
////                            NSMutableArray * rowAry = [NSMutableArray arrayWithObjects:@(0),@(3),nil];
////                            NSDictionary * selectDic = @{@(2):rowAry};
////                            [self.selectedMarkAry replaceObjectAtIndex:2 withObject:selectDic];
////                        }
//                    }
//                }


#pragma mark ## collection Delegate/DataSource
#pragma mark - - 点击方块选择

-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    
    
//    取出当前section 最大可选择数
    SystemMarkModel * sysModel = [self.selectedMarkAry objectAtIndex:indexPath.section];
    MarkModel * markModel = [sysModel.tagList objectAtIndex:indexPath.row];

    CounterMarkCollectionCell * cell = ( CounterMarkCollectionCell *) [self.collectionView cellForItemAtIndexPath:indexPath];

// 找到你点击的方块 是不是多选 如果是多选 需要取消之前选的 如果是单选 选中点击的 取消上一个选择的

    NSInteger selectCount = 0;
    for (MarkModel*  mo in sysModel.tagList) {
        
        if ([mo.status integerValue]) {
            
            selectCount ++;
        }
    }
    
    if ([sysModel.maxNum integerValue] > 1 ) {// 如果是多选 判断点击的有没有被选中 没有选中 选中 如果选中 需要取消之前选的
        
        if (selectCount == [sysModel.maxNum integerValue]) { // 已经选择最大数目 多选
            
            //如果点击的是选择过的 取消选择
            if ([markModel.status integerValue]) {
                
                [cell selectedStatusOfCollectionCell:NO];
                markModel.status = @(0);
                
                [[self.selectedMarkAry[indexPath.section] tagList] replaceObjectAtIndex:indexPath.row withObject:markModel];
                return;

            }else{
                // 提示框
                [LQProgressHud showMessage:@"该分类选择已达上限"];
                return;
            }
            
        }else{
            
            // 直接选中
//            if ([markModel.status integerValue]) {
                [cell selectedStatusOfCollectionCell:![markModel.status boolValue]];
                markModel.status = [NSNumber numberWithInteger:![markModel.status integerValue]];
                [[self.selectedMarkAry[indexPath.section] tagList] replaceObjectAtIndex:indexPath.row withObject:markModel];

                return;
//            }
        }
    }else{
        
        // 单选 取消上一个选择 选择但当前点击的
        
        for (NSInteger last = 0; last < [sysModel.tagList count]; last ++ ) {
            
            CounterMarkCollectionCell * lastCell = ( CounterMarkCollectionCell *) [self.collectionView cellForItemAtIndexPath:[NSIndexPath indexPathForRow:last inSection:indexPath.section]];
            
            SystemMarkModel * sysModel0 = [self.selectedMarkAry objectAtIndex:indexPath.section];
            MarkModel * markModel0 = [sysModel0.tagList objectAtIndex:last];
            markModel0.status = @(0);

            [[self.selectedMarkAry[indexPath.section] tagList] replaceObjectAtIndex:last withObject:markModel0];
            
            [lastCell selectedStatusOfCollectionCell:0];
        }
        
        [cell selectedStatusOfCollectionCell:@(1)];
        markModel.status = @(1);

        [[self.selectedMarkAry[indexPath.section] tagList] replaceObjectAtIndex:indexPath.row withObject:markModel];
        
    }

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//    
////        已经选过了，
//    if (cell.isSelectedCell) {
//        
////        从选中的数组中移除
//        for (NSDictionary* dic in self.selectedMarkAry) {
//            
////                存在 则移除
//            if ([dic[sectionNum] containsObject:rowNum]) {
//                [dic[sectionNum] removeObject:rowNum];
//                if ([dic[sectionNum] count] < 1) {
//                    [self.selectedMarkAry removeObject:dic];
//                }
//                break;
//            }
//        }
//    }else{
////    没有选过 加入已选数组中
//        
//        BOOL isExistence = NO;
//        NSInteger maxNum = [[dic objectForKey:@"maxNum"] integerValue];
//
//        for (NSDictionary* dic in self.selectedMarkAry) {
//            //    存在 则加入
//            if (dic[sectionNum]) {
//                isExistence = YES;
//                
////              判断当前section  已选择 是否 > 最多可选择数  如果当前点击是数组中有的 则取消选择 ，此section又可以选
//                if(maxNum  == 0 || [dic[sectionNum] count] < maxNum){
//                    [dic[sectionNum] addObject:rowNum];
//                }else if ([dic[sectionNum] count] >= maxNum) {
//                    
//                    [LQProgressHud showMessage:@"该分类选择已达上限"];
//                    
//                    return;
//                }
//                break;
//            }
//        }
////        没有section 则加入一组
//        if (!isExistence) {
////            if 最大可选数量是0 无限制
//            if (maxNum == 0) {
//                return;
//            }
//            
//            NSMutableArray * rowAry = [NSMutableArray arrayWithObject:rowNum];
//            NSDictionary * selectDic = @{sectionNum:rowAry};
//            [self.selectedMarkAry addObject:selectDic];
//        }
//        
//    }
//    
////    反选
//    [cell selectedStatusOfCollectionCell:!cell.isSelectedCell];

}

-(NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView{
    
    return self.dataAry.count;
}

-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    
    NSDictionary * dic = self.dataAry[section];
    
    return [[dic objectForKey:@"tagList"] count];
}

// 设置section头视图的参考大小，与tableheaderview类似
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout
referenceSizeForHeaderInSection:(NSInteger)section {
    
    return CGSizeMake(SCREEN_WIDTH, 30);
}

// header
-(UICollectionReusableView *)collectionView:(UICollectionView *)collectionView
          viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath{
    
    
    UICollectionReusableView *reusableview = nil;
    
    if (kind == UICollectionElementKindSectionHeader){
        
        UICollectionReusableView *headerView =
        [collectionView dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionHeader
                                           withReuseIdentifier:collectionSectionIndentider
                                                  forIndexPath:indexPath];
        
//        防止重复
        for (UIView * view in headerView.subviews) {
            [view removeFromSuperview];
        }
        
        AttributeMarkLabel *ttLabel = [[AttributeMarkLabel alloc]initWithFrame:CGRectMake(14, 0, SCREEN_WIDTH - 14, 30)];
        UIFont * font = [UIFont boldSystemFontOfSize:15];
        UIColor * titleColor = [Utility colorWithHexString:@"fcfcfd" alpha:1.0];
        UIColor * subTitleColor = [Utility colorWithHexString:@"666666" alpha:1.0];
//
        SystemMarkModel* sectonM = self.selectedMarkAry[indexPath.section];
        
        NSString * subtitleString = [NSString stringWithFormat:@"(最多选%ld)",[sectonM.maxNum integerValue]];
        
        [ttLabel attributedTitle:sectonM.name
                    withFontSize:font
                   withfontColor:titleColor
                atDetialSubTitle:subtitleString
                 withSubFontSize:font
                withSubfontColor:subTitleColor];
//
        [headerView addSubview:ttLabel];
//
        reusableview = headerView;
    }
    return reusableview;
}

// cell
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *identify = @"CounterMarkCollectionCell";
    CounterMarkCollectionCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:identify forIndexPath:indexPath];
    
// !!!!   如果之前已经设置了，再次进来要显示上次设置的吗？
    
    SystemMarkModel* sectonM = self.selectedMarkAry[indexPath.section];
    MarkModel * rowM = [sectonM.tagList objectAtIndex:indexPath.row];
    
    cell.markLabel.text = rowM.name;
    
    NSInteger status = [rowM.status integerValue];
    
    [cell selectedStatusOfCollectionCell:status];

    return cell;
}


-(NSMutableArray*)dataAry{
    if (nil == _dataAry) {
        _dataAry = [NSMutableArray arrayWithCapacity:0];
    }
    return _dataAry;
}

-(NSMutableArray*)selectedMarkAry{
    if (nil == _selectedMarkAry) {
        _selectedMarkAry = [NSMutableArray arrayWithCapacity:0];
    }
    return _selectedMarkAry;
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
