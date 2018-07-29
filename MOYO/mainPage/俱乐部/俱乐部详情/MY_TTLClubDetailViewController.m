//
//  MY_TTLClubDetailViewController.m
//  VTIME
//
//  Created by MadridLee on 2017/10/12.
//  Copyright © 2017年 MadridLee. All rights reserved.
//

#import "MY_TTLClubDetailViewController.h"
#import "MY_TTLClubDetHeaderCollectionViewCell.h"
#import "MY_TTLClubDetailMemberCollectionViewCell.h"
#import "MY_LLClubsReportViewController.h"
#import "MY_LLClubsManagerViewController.h"
#import "MY_LLAddNewViewController.h"
#import "MY_TTLSelfCenterViewController.h"

#import "MY_GLClubUserModel.h"

@interface MY_TTLClubDetailViewController ()<UICollectionViewDelegate,UICollectionViewDataSource,
UICollectionViewDelegateFlowLayout,UINavigationControllerDelegate>
{
    NSInteger _page;
    NSInteger _isJoin;
    NSInteger _isManager;
}

@property (nonatomic, strong)UICollectionView * collectionView;
@property (nonatomic, strong)NSMutableArray * dataArray;
@property (nonatomic, strong)NSMutableDictionary * ClubInfoDic;
@end

@implementation MY_TTLClubDetailViewController

-(BOOL)hidesBottomBarWhenPushed
{
    return YES;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(UpdateUI) name:@"updateClubDetailUI" object:nil];
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    self.automaticallyAdjustsScrollViewInsets = NO;
    
    [self addNavBtn:nil isLeft:NO target:self action:@selector(setBtnClick) bgImageName:@"举报"];
    
    
    [self uiConfig];
    
    
}

-(void)UpdateUI
{
    [self.dataArray removeAllObjects];
    _page = 1;
    [self downLoadData:_page isReshing:YES];
}

-(void)joinCreate
{
    UIButton* cancle=[UIButton buttonWithType:UIButtonTypeCustom];
    [cancle setTitle:@"申请加入" forState:UIControlStateNormal];
    [cancle setTitleColor:[Utility colorWithHexString:@"333333" alpha:1] forState:UIControlStateNormal];
    cancle.titleLabel.font = [UIFont systemFontOfSize:16];
    cancle.frame=CGRectMake(30, self.view.frame.size.height - 60, SCREEN_WIDTH - 30, 50);
    cancle.backgroundColor = GOLDCOLOR;
    [cancle addTarget:self action:@selector(joinClick) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:cancle];
    self.collectionView.frame = CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT - 60);
}

-(void)joinClick
{
    //    [LQProgressHud showMessage:@"哈哈"];
    
    NSDictionary * dic;
    
    dic = @{@"clubId":@(self.ClubID)};
    [TLHTTPRequest MY_postWithBaseUrl:ClubApplyUrl parameters:dic success:^(NSURLSessionDataTask * _Nonnull task, NSDictionary * _Nonnull data) {
        
        if ([[data objectForKey:@"ret"] integerValue] == 0) {
            
            [LQProgressHud showMessage:@"申请成功，等待管理员审核中"];
            
        }else{
            if ([data objectForKey:@"msg"]) {
                [LQProgressHud showMessage:[data objectForKey:@"msg"]];
            }
        }
        
    } failure:^(NSURLSessionDataTask * _Nonnull task, NSError * _Nonnull error) {
        [LQProgressHud showMessage:@"没网怎能忍？"];
    }];
}


- (void)setBtnClick {
    
    __weak typeof(self) wSelf = self;
    
    UIAlertAction * act1 = [UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {
    }];
    
    UIAlertAction * act2 = [UIAlertAction actionWithTitle:@"举报该俱乐部" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        
        MY_LLClubsReportViewController * repVC = [[MY_LLClubsReportViewController alloc] init];
        repVC.ClubID = self.ClubID;
        repVC.reportOfImageUrl = [self.ClubInfoDic objectForKey:@"roomIcon"];
        repVC.repotrOfUserId = [[self.ClubInfoDic objectForKey:@"userId"] integerValue];
        [wSelf.navigationController pushViewController:repVC animated:YES];
    }];
    
    UIAlertAction * act3 = [UIAlertAction actionWithTitle:@"退出该俱乐部" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        
        
        ALERT_SHOW(@"提示",@"确定退出该俱乐部？",self,@"取消",@"确定");
        
        
        
        
        
    }];
    
    //  所有者和管理可以看到
    UIAlertAction * act4 = [UIAlertAction actionWithTitle:@"管理俱乐部" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        
        MY_LLClubsManagerViewController * manVC = [[MY_LLClubsManagerViewController alloc] init];
        manVC.ClubID = self.ClubID;
        manVC.clubInfoDic = self.ClubInfoDic;
        if(_isManager == 1)
        {
            manVC.isManager = YES;
        }
        [wSelf.navigationController pushViewController:manVC animated:YES];
    }];
    
    UIAlertController * aleVC = [UIAlertController alertControllerWithTitle:@"提示" message:nil preferredStyle:UIAlertControllerStyleActionSheet];
    
    
    MY_GLClubUserModel * model = [self.dataArray objectAtIndex:0];
    
    [aleVC addAction:act1];
    
    if([USERID isEqualToString:[NSString stringWithFormat:@"%@",model.userId]])
    {
        [aleVC addAction:act4];
    }
    else
    {
        if(_isManager == 1)
        {
            [aleVC addAction:act4];
        }
        
        [aleVC addAction:act2];
        if (1 == _isJoin)
        {
            [aleVC addAction:act3];
        }
    }
    
    
    [self presentViewController:aleVC animated:YES completion:nil];
}


-(void)uiConfig
{
    UICollectionViewFlowLayout * flowLayout = [[UICollectionViewFlowLayout alloc]init];
    
    flowLayout.scrollDirection = UICollectionViewScrollDirectionVertical;
    self.collectionView  =[[UICollectionView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT-64) collectionViewLayout:flowLayout];
    
    
    self.collectionView.backgroundColor = [UIColor whiteColor];
    NSString* phoneVersion = [[UIDevice currentDevice] systemVersion];
    if ([phoneVersion integerValue] >= 11) {
        self.collectionView.contentOffset = CGPointMake(0, 0);// -64
        self.collectionView.contentInset = UIEdgeInsetsMake(0, 0, 0, 0);//-64
    }
    
    //      cell
    [self.collectionView    registerNib:[UINib nibWithNibName:@"MY_TTLClubDetHeaderCollectionViewCell" bundle:nil] forCellWithReuseIdentifier:@"MY_TTLClubDetHeaderCollectionViewCell"];
    
    [self.collectionView    registerNib:[UINib nibWithNibName:@"MY_TTLClubDetailMemberCollectionViewCell" bundle:nil] forCellWithReuseIdentifier:@"MY_TTLClubDetailMemberCollectionViewCell"];
    
    //    [self.collectionView registerClass:[MY_GLOwnInfoHeaderView class] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"MY_GLOwnInfoHeaderView"];
    
    //      代理
    self.collectionView.delegate=self;
    self.collectionView.dataSource=self;
    
    self.collectionView.alwaysBounceVertical = YES;
//    self.collectionView.backgroundColor = [UIColor whiteColor];
    
    [self.view addSubview:self.collectionView];
    //    self.collectionView.mj_footer = [MJRefreshBackGifFooter footerWithRefreshingTarget:self refreshingAction:@selector(footerRefreshing)];
    
    _page = 1;
    [self downLoadData:_page isReshing:YES];
    
}

#pragma mark ---刷新
// 刷新
//- (void)headerRefreshing
//{
//    _page = 1;
//    [self downLoadData:_page isReshing:YES];
//}
//
//- (void)footerRefreshing
//{
//    [self downLoadData:_page isReshing:NO];
//}

#pragma mark - -  数据请求

- (void)downLoadData:(NSInteger)page isReshing:(BOOL)isReshing{
    NSDictionary * dic;
    
    dic = @{@"clubId":@(self.ClubID)};
    [TLHTTPRequest MY_getWithBaseUrl:ClubDetailUrl parameters:dic success:^(NSURLSessionDataTask * _Nonnull task, NSDictionary * _Nonnull data) {
        
        if ([[data objectForKey:@"ret"] integerValue] == 0) {
            
            NSDictionary * dataDic = [data objectForKey:@"info"];
            
            if ([dataDic count] ) {
                
                //                if ( 1 == _page) {
                //                    [self.dataArray removeAllObjects];
                //                }
                
                NSDictionary *d = [dataDic objectForKey:@"clubInfo"];
                
                _ClubInfoDic = [NSMutableDictionary dictionaryWithDictionary:d];
                
                _isJoin = [[dataDic objectForKey:@"isAddClub"] integerValue];
                _isManager = [[dataDic objectForKey:@"isManager"] integerValue];
                
                if (0 == _isJoin) {    //是否是该群组的成员。。需要判断
                    //        [self joinCreate];
                    UIButton* cancle=[UIButton buttonWithType:UIButtonTypeCustom];
                    [cancle setTitle:@"申请加入" forState:UIControlStateNormal];
                    [cancle setTitleColor:[Utility colorWithHexString:@"333333" alpha:1] forState:UIControlStateNormal];
                    cancle.titleLabel.font = [UIFont systemFontOfSize:16];
                    cancle.frame=CGRectMake(30, SCREEN_HEIGHT - 130, SCREEN_WIDTH - 60, 50);
                    cancle.backgroundColor = GOLDCOLOR;
                    [cancle addTarget:self action:@selector(joinClick) forControlEvents:UIControlEventTouchUpInside];
                    cancle.layer.masksToBounds = YES;
                    cancle.layer.cornerRadius = 25;
                    [self.view addSubview:cancle];
                    self.collectionView.frame = CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT - 140);
                }
                
                for (NSDictionary* dic in [dataDic objectForKey:@"clubUserInfoList"]) {//smallPhotoUrl  //photoUrl
                    //
                    MY_GLClubUserModel * userModel = [[MY_GLClubUserModel alloc]init];
                    [userModel setValuesForKeysWithDictionary:dic];
                    
                    [self.dataArray addObject:userModel];
                }
                
                [self.collectionView reloadData];
                
                //                _page ++;
                //                [self.dataArray setObject:@(page) forKey:@"page"];
            }
            
        }else{
            if ([data objectForKey:@"msg"]) {
                [LQProgressHud showMessage:[data objectForKey:@"msg"]];
            }
        }
        
        //        if (!isReshing) {
        //            [self.collectionView.mj_footer endRefreshing];
        //        }
    } failure:^(NSURLSessionDataTask * _Nonnull task, NSError * _Nonnull error) {
        
        //        if (!isReshing) {
        //            [self.collectionView.mj_footer endRefreshing];
        //        }
        [LQProgressHud showMessage:@"没网怎能忍？"];
    }];
    
}


#pragma mark +++++++ CollectionView 的dataSource  Delegate 方法 +++++++++++++++++++++++

-(NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView{
    
    return 2;
}

-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    
    if (0 == section) {
        
        return 1;
        
    }else{
        
        if(1 == _isJoin)
        {
            return [self.dataArray count]+1;
        }
        
        return [self.dataArray count];    }
}

// 区间距
-(UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section{
    
    if (0 == section) {
        
        return UIEdgeInsetsMake(0.0, 0.0, 0.0, 0.0);
    }else{
        return UIEdgeInsetsMake(0.0, 0.0, 0.0, 0.0);
    }
    
}

//  每个cell的竖间距
-(CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout minimumInteritemSpacingForSectionAtIndex:(NSInteger)section{
    
    if (0 == section) {
        
        return 0.0;
        
    }else{
        return 0.0;
    }
}

//横间距
-(CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout minimumLineSpacingForSectionAtIndex:(NSInteger)section{
    if (0 == section) {
        return 0.0;
    }else{
        return 0.0;
    }
}


//  每个Cell 的 size
-(CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath{
    
    if (0 == indexPath.section) {
        
        return CGSizeMake( SCREEN_WIDTH, SCREEN_WIDTH + 55);//ceil
        
    }else{
        return CGSizeMake( SCREEN_WIDTH/4, SCREEN_WIDTH/4);
        
    }
    
}

//区头高度
-(CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout referenceSizeForHeaderInSection:(NSInteger)section{
    if (0 == section) {
        return CGSizeZero;
    }else{
        return CGSizeZero;
    }
}

-(CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout referenceSizeForFooterInSection:(NSInteger)section{
    return CGSizeZero;
}


- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *IntroIdentify = @"MY_TTLClubDetHeaderCollectionViewCell";
    static NSString *PhotoIdentify = @"MY_TTLClubDetailMemberCollectionViewCell";
    
    if (0 == indexPath.section) {
        
        // 兴趣与爱好
        MY_TTLClubDetHeaderCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:IntroIdentify forIndexPath:indexPath];
        
        [cell.iconImgv sd_setImageWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"%@",[self.ClubInfoDic objectForKey:@"roomIcon"]]] placeholderImage:[UIImage imageNamed:@"BackgroundV"]];
        cell.nameLabel.text = [NSString stringWithFormat:@"%@",[self.ClubInfoDic objectForKey:@"roomName"]];
        cell.areaLabel.text = [NSString stringWithFormat:@"%@市",[self.ClubInfoDic objectForKey:@"location"]];
        cell.contLabel.text = [NSString stringWithFormat:@"%@",[self.ClubInfoDic objectForKey:@"roomInfo"]];
        cell.priceLabel.text = [NSString stringWithFormat:@"已累计消费￥%@",[self.ClubInfoDic objectForKey:@"income"]];
        cell.levelLabel.text = [NSString stringWithFormat:@"%@",[self.ClubInfoDic objectForKey:@"levelString"]];
        
        
        return cell;
        
    }else{
        
        if(indexPath.row+1 > self.dataArray.count)
        {
            MY_TTLClubDetailMemberCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:PhotoIdentify forIndexPath:indexPath];
            cell.iconImgv.image = [UIImage imageNamed:@"addClubsHead"] ;
            cell.nameLabel.text = @"邀请";
            cell.nameLabel.textColor = GOLDCOLOR;
            return cell;
        }
        
        // 兴趣与爱好
        MY_TTLClubDetailMemberCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:PhotoIdentify forIndexPath:indexPath];
        MY_GLClubUserModel * model = [self.dataArray objectAtIndex:indexPath.row];
        [cell.iconImgv sd_setImageWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"%@",model.headIcon]] placeholderImage:[UIImage imageNamed:@"占位图"]];
        cell.nameLabel.text = model.nickName;
        cell.nameLabel.textColor = [UIColor darkGrayColor];
        return cell;
    }
}
//  用户列表number
//- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
//{
//    return [self.dataNewArray count];
//}
//  点击列表 某个用户 跳转播放视频页
-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(nonnull NSIndexPath *)indexPath
{

    if(indexPath.section == 1)
    {
        
//        if(_isJoin == 1)
//        {
        
            if(self.dataArray.count == indexPath.row)
            {
                
                MY_LLAddNewViewController *addnew = [[MY_LLAddNewViewController alloc]init];
                addnew.clubId = @(self.ClubID);
                [self.navigationController pushViewController:addnew animated:YES];
            }
            else
            {
                
                MY_GLClubUserModel * model = [self.dataArray objectAtIndex:indexPath.row];
                
                MY_TTLSelfCenterViewController* selfVc = [[MY_TTLSelfCenterViewController alloc]init];
                
                selfVc.userID = [NSString stringWithFormat:@"%@", model.userId];
                
                [self.navigationController pushViewController:selfVc animated:YES];
            }
            
//        }
    }
    
    
}

#pragma mark - UIAlertViewDelegate
- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex{
    
#pragma mark ## UIAlertViewDelegate
    //        0 取消  1 确定
    if (buttonIndex == 0 ) return;
    
    __weak typeof(self) wSelf = self;
    
    NSDictionary * dic;
    
    dic = @{@"clubId":@(self.ClubID)};
    
    [TLHTTPRequest MY_postWithBaseUrl:QuitClubUrl parameters:dic success:^(NSURLSessionDataTask * _Nonnull task, NSDictionary * _Nonnull data) {
        
        if ([[data objectForKey:@"ret"] boolValue] == 0) {
            
            [[NSNotificationCenter defaultCenter] postNotificationName:@"updateClubDetailUI" object:nil];
            
            [LQProgressHud showMessage:@"退出成功！"];
            
            [self.navigationController popViewControllerAnimated:YES];
            
        }
        else {
            [LQProgressHud showMessage:data[@"msg"]];
        }
        
    } failure:^(NSURLSessionDataTask * _Nonnull task, NSError * _Nonnull error) {
        [LQProgressHud showMessage:@"网络连接失败"];
    }];
}


-(NSMutableArray*)dataArray{
    if (!_dataArray) {
        _dataArray = [NSMutableArray arrayWithCapacity:0];
    }
    return _dataArray;
}

-(NSMutableDictionary*)ClubInfoDic{
    if (!_ClubInfoDic) {
        _ClubInfoDic = [[NSMutableDictionary alloc]initWithCapacity:0];
    }
    return _ClubInfoDic;
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

