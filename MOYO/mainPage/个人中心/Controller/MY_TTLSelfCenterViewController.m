//
//  MY_TTLSelfCenterViewController.m
//  VTIME
//
//  Created by MadridLee on 2017/9/7.
//  Copyright © 2017年 MadridLee. All rights reserved.
//

#import "MY_TTLSelfCenterViewController.h"
#import "MY_TTLReportViewController.h"//举报
#import "TZImagePickerController.h"// 选择图片
#import <AssetsLibrary/AssetsLibrary.h>
//  cell && view
#import "MY_GLPhotoLibraryCollectionCell.h"
#import "MY_GLPersonalIntroCollectioCell.h"
#import "MY_XTMyclubCollectionViewCell.h"
#import "MY_TTLMyClubDetailCollectionViewCell.h"
#import "MY_GLOwnInfoHeaderView.h"
#import "DYBaseView.h"//查看大图
#import "MY_GLSheetView.h"//上传相册
#import "MY_TTLShareView.h"//分享
#import "MY_LLCreateClubsViewController.h"
#import "MY_TTLClubDetailViewController.h"

#import "TZImageManager.h"

// model
#import "PhotoLibModel.h"

//tool
#import "SXPickPhoto.h"


#define MaxSelectCount 9

//  #import "MY_LLPersonInfoModel.h"

@interface MY_TTLSelfCenterViewController ()
<UICollectionViewDelegate,UICollectionViewDataSource,MY_LLPayViewControllerDelegate,MY_LLChatRedPacketSayHWViewDelegate,
UICollectionViewDelegateFlowLayout,
UINavigationControllerDelegate,
UIImagePickerControllerDelegate,
TZImagePickerControllerDelegate>
{
    NSArray * titleAry;
    NSInteger _page;
    MY_GLSheetView * sheetView;
    NSString * imgfid;
    NSArray * rectArray;//储存cell坐标
    
    //选择图片
    BOOL _isSelectOriginalPhoto;
    
    NSMutableArray *_selectedPhotos;
    NSMutableArray *_selectedAssets;
    NSInteger _videoDegress;    //视频旋转角度
    UIImage* _imageFirst;   //视频首帧图片用于展示
    NSURL* _videoURL;   //视频地址
    NSInteger _videoLength; //视频时间长度
    BOOL _isChooseVideo;    //默认NO，不选视频，选择后改为yes；

}
@property (nonatomic, strong)UICollectionView * collectionView;
@property (nonatomic, strong)NSMutableArray * dataArray;
@property (nonatomic, weak)MY_GLOwnInfoHeaderView * headerView;
@property (nonatomic, strong)MY_LYPersonInfoModel * infoModel;
@property (strong, nonatomic)SXPickPhoto* pickPhoto;//相册类
@property (nonatomic, strong)NSMutableArray * arrayPage;//要上传的图片
@property (strong,nonatomic)UIImagePickerController * imagePickerVc;
@property (nonatomic, strong)NSMutableArray *selectedAssets;//已经选择的图片

@end

@implementation MY_TTLSelfCenterViewController

-(BOOL)hidesBottomBarWhenPushed{
    return YES;
}

-(void)backClick{
    [self.navigationController popViewControllerAnimated:YES];
}

//  右上角分享按钮
- (void)shareBtnClick{
    
    if (!USERKEY) {
        
       // [self loginOut];
        return;
    }
    
    if (self.userID.integerValue == [USERID integerValue]) {
        /*
         MY_TTLShareOnlyView * alert = [[MY_TTLShareOnlyView alloc]initWithFrame:ShareFrame withArray:array image:nil];
         [UIView animateWithDuration:0.2 animations:^{
         [alert show];
         }];
         */
        //  拉黑自己
        [self addShareOneself];
        
    }else{
        //  拉黑他人
        [self addShareWithOthers];
    }
}

- (void)viewDidLoad {
    [super viewDidLoad];

    [self addNavBtn:nil isLeft:YES target:self action:@selector(backClick) bgImageName:@"editInfo_backButton"];
    if (self.userID.integerValue != [USERID integerValue]) {
        
        [self addNavBtn:nil isLeft:NO target:self action:@selector(shareBtnClick) bgImageName:@"whiteMore"];
        
    }
    self.selectedAssets = [[NSMutableArray alloc]initWithCapacity:0];
    titleAry = @[@"",@"",@"年龄",@"身高",@"风格",@"职业",@"爱好",@"星座"];
   
    [self setupUI];
    [self headerRefreshing];
  
}

-(void)setupUI{
    
    MY_GLOwnInfoHeaderView *headerV= [[MY_GLOwnInfoHeaderView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_WIDTH)];
//    self.automaticallyAdjustsScrollViewInsets = NO;

    UICollectionViewFlowLayout * flowLayout = [[UICollectionViewFlowLayout alloc]init];

    flowLayout.scrollDirection = UICollectionViewScrollDirectionVertical;
    self.collectionView  =[[UICollectionView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT) collectionViewLayout:flowLayout];
    
    NSString* phoneVersion = [[UIDevice currentDevice] systemVersion];
    if ([phoneVersion integerValue] >= 11) {
        self.collectionView.contentOffset = CGPointMake(0, 0);// -64
        self.collectionView.contentInset = UIEdgeInsetsMake(0, 0, 0, 0);//-64
    }
    else{
        self.collectionView.frame = CGRectMake(0, -64, SCREEN_WIDTH, SCREEN_HEIGHT + 64);
        self.collectionView.contentInset = UIEdgeInsetsMake(64, 0, 0, 0);
        self.collectionView.contentOffset = CGPointMake(0, -64);
    }
    
    //      cell
    [self.collectionView    registerNib:[UINib nibWithNibName:@"MY_GLPhotoLibraryCollectionCell" bundle:nil] forCellWithReuseIdentifier:@"MY_GLPhotoLibraryCollectionCell"];
    
    [self.collectionView    registerNib:[UINib nibWithNibName:@"MY_GLPersonalIntroCollectioCell" bundle:nil] forCellWithReuseIdentifier:@"MY_GLPersonalIntroCollectioCell"];
    
    [self.collectionView    registerNib:[UINib nibWithNibName:@"MY_XTMyclubCollectionViewCell" bundle:nil] forCellWithReuseIdentifier:@"MY_XTMyclubCollectionViewCell"];
    [self.collectionView    registerNib:[UINib nibWithNibName:@"MY_TTLMyClubDetailCollectionViewCell" bundle:nil] forCellWithReuseIdentifier:@"MY_TTLMyClubDetailCollectionViewCell"];
    
//    [self.collectionView registerClass:[MY_GLOwnInfoHeaderView class] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"MY_GLOwnInfoHeaderView"];
    
    //      代理
    self.collectionView.delegate=self;
    self.collectionView.dataSource=self;
    
    self.collectionView.alwaysBounceVertical = YES;
    self.collectionView.backgroundColor = [UIColor blackColor];
    
    [self.view addSubview:self.collectionView];
    self.collectionView.mj_footer = [MJRefreshBackGifFooter footerWithRefreshingTarget:self refreshingAction:@selector(footerRefreshing)];
    [self.collectionView addSubview:headerV];
    self.headerView = headerV;
//    NSString* phoneVersion = [[UIDevice currentDevice] systemVersion];
    if ([phoneVersion integerValue] >= 11) {
        
        self.collectionView.contentInsetAdjustmentBehavior = UIScrollViewContentInsetAdjustmentNever;
    }else{
        self.automaticallyAdjustsScrollViewInsets = NO;
    }
    
    __weak typeof(self) wSelf = self;

    self.headerView.privateChatBlock = ^(NSInteger index,MY_LYPersonInfoModel *model){
      
        //私聊
        if ( 0 == index) {
//            NSString *str = [NSString stringWithFormat:@"%ld",model.userId];
            //ChatStatusUrl 判断是否可以聊天
            if ([Utility isAuditEnvironment] == NO) {   //非审核创建按钮
                
                NSDictionary * chatDic = @{@"userId":@(model.userId)};
                
                [TLHTTPRequest MY_postWithBaseUrl:ChatStatusUrl parameters:chatDic success:^(NSURLSessionDataTask * _Nonnull task, NSDictionary * _Nonnull data) {
                    if ([[data objectForKey:@"ret"] integerValue] == 0) {
                        
                        if ([[data[@"info"] objectForKey:@"status"] integerValue]) {
                            // 1 可以聊天
                            
//                            MY_LLPersonInfoModel * chatMod = [[MY_LLPersonInfoModel alloc] init];
//                            chatMod.userId = model.userId;
//                            chatMod.nickName = model.nickName;
//                            chatMod.headIcon = model.headIcon;
//                            chatMod.isNoble  = model.isNoble;
                            NSString * usID = [NSString stringWithFormat:@"%ld",model.userId];
                            ChatViewController * chatController = [[ChatViewController alloc] initWithConversationChatter:usID conversationType:EMConversationTypeChat];
                            chatController.model = model;
                            chatController.isPayPush = YES;
//                            [chatController setHidesBottomBarWhenPushed:YES];
                            [wSelf.navigationController pushViewController:chatController animated:YES];
                            
                        }else{
                            // 0 不能聊天
                            
                            MY_LLChatRedPacketView * chatRedPacketView = [[MY_LLChatRedPacketView alloc] init];
                            chatRedPacketView.userId =  [NSString stringWithFormat:@"%td", wSelf.infoModel.userId];
                            chatRedPacketView.model = model;
                            chatRedPacketView.delegate = self;
                            chatRedPacketView.affirmBtnblock = ^(NSInteger price) {
                                MY_LLPayViewController * payVC = [[MY_LLPayViewController alloc] init];
                                payVC.userId = [NSString stringWithFormat:@"%td", wSelf.infoModel.userId];
                                payVC.price = [NSString stringWithFormat:@"%td", price];
                                payVC.payType = 1;
                                payVC.headIconStr = wSelf.infoModel.headIcon;
                                payVC.nickName = wSelf.infoModel.nickName;
                                payVC.redType = RedPacket_sayHolle;
                                payVC.delegate = self;
                                payVC.redSingleType = RedPacketSayHolle;
                                [wSelf.navigationController pushViewController:payVC animated:YES];
                            };
                            
                            chatRedPacketView.GetNobilityBlock = ^(NSInteger index) {
                                if (index == 1) {
                                    MY_TTLToBeNobilityViewController* noVc = [[MY_TTLToBeNobilityViewController alloc]init];
//                                    noVc.hidesBottomBarWhenPushed = YES;
                                    [wSelf.navigationController pushViewController:noVc animated:YES];
                                }
                            };
                            [chatRedPacketView show];
                        }
                    }else{
                        if ([data objectForKey:@"msg"]) {
                            [LQProgressHud showMessage:[data objectForKey:@"msg"]];
                        }
                    }
                } failure:^(NSURLSessionDataTask * _Nonnull task, NSError * _Nonnull error) {
                    
                    [LQProgressHud showMessage:@"没网怎能忍？"];
                }];
                
                //  审核服
            }else{
                
//                MY_LLPersonInfoModel * perModel = [[MY_LLPersonInfoModel alloc] init];
//                perModel.userId = model.userId;
//                perModel.nickName = model.nickName;
//                perModel.headIcon = model.headIcon;
//                perModel.isNoble  = model.isNoble;

                ChatViewController * chatController = [[ChatViewController alloc] initWithConversationChatter:[NSString stringWithFormat:@"%td", model.userId] conversationType:EMConversationTypeChat];
                chatController.model = model;
                chatController.isPayPush = YES;
//                [chatController setHidesBottomBarWhenPushed:YES];
                [wSelf.navigationController pushViewController:chatController animated:YES];
            }

        }else{
         
            //关注
            if (model) {
                
                wSelf.infoModel.isFollow = model.isFollow;
                if ([self.delegate respondsToSelector:@selector(GetifpayattentionWithStatus:)]) {
                    [self.delegate GetifpayattentionWithStatus:model.isFollow];
                }
            }
        }
    };
    
    _pickPhoto = [[SXPickPhoto alloc]init];

}
#pragma mark --MY_LLPayViewControllerDelegate
- (void)paySucessForViewController:(MY_LLPayViewController *)vc withPrice:(NSString *)price{
    MY_LYPersonInfoModel * model = [[MY_LYPersonInfoModel alloc] init];
    model.userId = [vc.userId integerValue];
    model.nickName = vc.nickName;
    model.headIcon = vc.headIconStr;
    //    model.isNoble  = [vc.nobleLevel integerValue];
    ChatViewController * chatController = [[ChatViewController alloc] initWithConversationChatter:vc.userId conversationType:EMConversationTypeChat];
    chatController.model = model;
//    [chatController setHidesBottomBarWhenPushed:YES];
    [self.navigationController pushViewController:chatController animated:YES];
}
- (void)paySucessForSayHellowRedPacketView:(MY_LLChatRedPacketView *)view withPrice:(NSString *)price{
//    MY_LLPersonInfoModel * model = [[MY_LLPersonInfoModel alloc] init];
//    model.userId = [vc.userId integerValue];
//    model.nickName = vc.nickName;
//    model.headIcon = vc.headIconStr;
    //    model.isNoble  = [vc.nobleLevel integerValue];
    ChatViewController * chatController = [[ChatViewController alloc] initWithConversationChatter:view.userId conversationType:EMConversationTypeChat];
    chatController.model = view.model;
    [chatController setHidesBottomBarWhenPushed:YES];
    [self.navigationController pushViewController:chatController animated:YES];
}
- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    
    if ([[[UIDevice currentDevice] systemVersion] floatValue] >= 7.0) {
        self.navigationController.interactivePopGestureRecognizer.enabled = NO;
        self.navigationController.interactivePopGestureRecognizer.delegate = (id<UIGestureRecognizerDelegate>)self;
    }
    
    
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
//    [self.headerView.playerView resetPlayer];
    [self.headerView.playerView pause];

}

- (void)viewDidDisappear:(BOOL)animated{
    [super viewDidDisappear:animated];
    [self.headerView.playerView resetPlayer];
    self.headerView.playerView = nil;
    self.headerView = nil;
}
#pragma mark ---刷新
// 刷新
- (void)headerRefreshing
{
    _page = 1;
    [self downLoadData:_page isReshing:YES];
}

- (void)footerRefreshing
{
    [self downLoadData:_page isReshing:NO];
}

#pragma mark - -  数据请求

- (void)downLoadData:(NSInteger)page isReshing:(BOOL)isReshing{
    [LQProgressHud showLoading:nil];
    NSDictionary * dic;
    if (self.userID) {
        
        dic = @{@"page":@(page),@"onUser":self.userID};
    }else{
        dic = @{@"page":@(page)};
    }
    __weak typeof(self)WeakSelf = self;
    [TLHTTPRequest MY_postWithBaseUrl:PersonalInfoUrl parameters:dic success:^(NSURLSessionDataTask * _Nonnull task, NSDictionary * _Nonnull data) {
        
        if ([[data objectForKey:@"ret"] integerValue] == 0) {
            [LQProgressHud hide];
            NSDictionary * dataDic = [data objectForKey:@"info"];
            if ( 1 == _page) {
                [WeakSelf.dataArray removeAllObjects];
            }
            if ([dataDic count] ) {
                
                if (!WeakSelf.infoModel) {
                    WeakSelf.infoModel = [[MY_LYPersonInfoModel alloc]init];
                }
                [WeakSelf.infoModel setValuesForKeysWithDictionary:dataDic];
                WeakSelf.headerView.model = WeakSelf.infoModel;
                
                
                for (NSDictionary* dic in [dataDic objectForKey:@"photoList"]) {//smallPhotoUrl  //photoUrl
                    
                    PhotoLibModel * phoModel = [[PhotoLibModel alloc]init];
                    [phoModel setValuesForKeysWithDictionary:dic];
                    
                    [WeakSelf.dataArray addObject:phoModel];
                }

                [WeakSelf.collectionView reloadData];
                
                _page ++;
//                [self.dataArray setObject:@(page) forKey:@"page"];
            }
            
        }else{
            if ([data objectForKey:@"msg"]) {
                [LQProgressHud showMessage:[data objectForKey:@"msg"]];
            }
        }
        
        if (!isReshing) {
            [LQProgressHud hide];
            [WeakSelf.collectionView.mj_footer endRefreshing];
        }
    } failure:^(NSURLSessionDataTask * _Nonnull task, NSError * _Nonnull error) {
        
        if (!isReshing) {
            [WeakSelf.collectionView.mj_footer endRefreshing];
        }
        [LQProgressHud showMessage:@"没网怎能忍？"];
    }];
}


#pragma mark +++++++ CollectionView 的dataSource  Delegate 方法 +++++++++++++++++++++++


-(NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView{
    
    return 2;
}

-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    
    if (0 == section) {
        
        return [titleAry count];
        
    }else{
        //  如果是自己则可编辑
        if ([self.userID isEqualToString:USERID]) {
            
            return [self.dataArray count] + 1;
            
        }else{
            //  只是查看相册
            return [self.dataArray count];
        }
    }
}

// 区间距
-(UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section{
    
    if (0 == section) {
        
        return UIEdgeInsetsMake(5.0, 0.0, 5.0, 0.0);
    }else{
        return UIEdgeInsetsMake(0.0, 2.0, 2.0, 2.0);
    }
    
}

//  每个cell的竖间距
-(CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout minimumInteritemSpacingForSectionAtIndex:(NSInteger)section{
    
    if (0 == section) {
        
        return 0.0;
        
    }else{
        return 2.0;
    }
}

//横间距
-(CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout minimumLineSpacingForSectionAtIndex:(NSInteger)section{
    if (0 == section) {
        return 0.1;
    }else{
        return 2.0;
    }
}


//  每个Cell 的 size
-(CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath{
    
    if (0 == indexPath.section) {
        if(indexPath.row == 0)
        {
            if (self.userID.integerValue == [USERID integerValue]) {
                return CGSizeMake( SCREEN_WIDTH  * 0.5, 46);//ceil
            }
            else
            {
                if([self.infoModel.club objectForKey:@"userNum"])
                {
                    return CGSizeMake( SCREEN_WIDTH  * 0.5, 46);//ceil
                }
                else
                {
                    return CGSizeMake( SCREEN_WIDTH  * 0.5, 0);//ceil
                }
            }
        }
        else if(indexPath.row == 1)
        {
            if (self.userID.integerValue == [USERID integerValue]) {
                return CGSizeMake( SCREEN_WIDTH  * 0.5, 46);//ceil
            }
            else
            {
                if([self.infoModel.club objectForKey:@"userNum"])
                {
                    return CGSizeMake( SCREEN_WIDTH  * 0.5, 46);//ceil
                }
                else
                {
                    return CGSizeMake( SCREEN_WIDTH  * 0.5, 0);//ceil
                }
            }
        }
        else{
            return CGSizeMake( SCREEN_WIDTH  * 0.5, 46);//ceil
        }
        
    }else{
        CGFloat width = ceil((SCREEN_WIDTH - 8) *0.33);
        return CGSizeMake( width, width);

    }
    
}

//区头高度
-(CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout referenceSizeForHeaderInSection:(NSInteger)section{
    if (0 == section) {
        return CGSizeMake(SCREEN_WIDTH, SCREEN_WIDTH);
    }else{
        return CGSizeZero;
    }
}

-(CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout referenceSizeForFooterInSection:(NSInteger)section{
    return CGSizeZero;
}

//  区头
//- (UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath{
//    
//    
//    UICollectionReusableView *reusableview = nil;
//
//    if (0 == indexPath.section) {
//        
//        if (kind == UICollectionElementKindSectionHeader){
//            
//            UICollectionReusableView *headerView = [collectionView dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"View" forIndexPath:indexPath];
//            
//            if (headerView) {
//                
//                for (UIView * view in [headerView subviews]) {
//                    
//                    [view removeFromSuperview];
//                }
//            }
//            reusableview = headerView;
//        }
//    }
//    
//    return reusableview;
//}


- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *IntroIdentify = @"MY_GLPersonalIntroCollectioCell";
    static NSString *PhotoIdentify = @"MY_GLPhotoLibraryCollectionCell";
    static NSString *Identify = @"MY_XTMyclubCollectionViewCell";
    static NSString *Identify2 = @"MY_TTLMyClubDetailCollectionViewCell";
    if (0 == indexPath.section) {
        
        if(indexPath.row == 0)
        {
            MY_XTMyclubCollectionViewCell *xtcell = [collectionView dequeueReusableCellWithReuseIdentifier:Identify forIndexPath:indexPath];
            
            
                    return  xtcell;
        }
        
       else if(indexPath.row == 1)
       {
           MY_TTLMyClubDetailCollectionViewCell *xtcell2 = [collectionView dequeueReusableCellWithReuseIdentifier:Identify2 forIndexPath:indexPath];
           
           if([self.infoModel.club objectForKey:@"userNum"])
           {
               xtcell2.ClubNameLabel.text = [NSString stringWithFormat:@"%@(%@/%@)",self.infoModel.club[@"roomName"],self.infoModel.club[@"userNum"],self.infoModel.club[@"limitNum"]];
           }
           else
           {
               xtcell2.ClubNameLabel.text = @"暂无俱乐部,点击创建";
           }
           
           
           return  xtcell2;
       }
        else
        {
            // 兴趣与爱好
            MY_GLPersonalIntroCollectioCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:IntroIdentify forIndexPath:indexPath];
            
            cell.titleLabel.text = [titleAry objectAtIndex:indexPath.row];
            
            switch (indexPath.row) {
                case 2:// 年龄
                {
                    if ( !self.infoModel.age || self.infoModel.age < 20 || self.infoModel.age > 60) {
                        
                        cell.subTitleLabel.text = @"20";
                    }else{
                        cell.subTitleLabel.text = [NSString stringWithFormat:@"%ld",self.infoModel.age];
                    }
                    
                    break;
                }case 3:// 身高
                {
                    if ( !self.infoModel.height || self.infoModel.height < 150 || self.infoModel.height > 200) {
                        
                        cell.subTitleLabel.text = @"170cm";
                        
                    }else{
                        cell.subTitleLabel.text = [NSString stringWithFormat:@"%ld",self.infoModel.height];
                        
                    }
                    
                    break;
                }case 4:// 风格
                {
                    if ([Utility isBlankString:self.infoModel.style]) {
                        
                        cell.subTitleLabel.text = @"女神";
                    }else{
                        cell.subTitleLabel.text = self.infoModel.style;
                    }
                    break;
                }case 5:// 职业
                {
                    if ([Utility isBlankString:self.infoModel.occupation]) {
                        
                        cell.subTitleLabel.text = @"";
                    }else{
                        cell.subTitleLabel.text = self.infoModel.occupation;
                    }
                    
                    break;
                }case 6:// 爱好
                {
                    if ([Utility isBlankString:self.infoModel.interest]) {
                        
                        cell.subTitleLabel.text = @"美食";
                    }else{
                        cell.subTitleLabel.text = self.infoModel.interest;
                    }
                    
                    break;
                }case 7:// 星座
                {
                    if ([Utility isBlankString:self.infoModel.constellation]) {
                        
                        cell.subTitleLabel.text = @"";
                    }else{
                        cell.subTitleLabel.text = self.infoModel.constellation;
                    }
                    
                    break;
                }
                default:
                    break;
            }
            
            return cell;
        }
        
    }else{
        //  相册
        MY_GLPhotoLibraryCollectionCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:PhotoIdentify forIndexPath:indexPath];

        //  如果是自己则可编辑
        if ([self.userID isEqualToString:USERID]) {
            if ( 0 == indexPath.row) {
                //第一个cell 则可以点击上传图片
                [cell.photoImageView setImage:[UIImage imageNamed:@"home_selectPhotoLibiary"]];
                
            }else{
                UILongPressGestureRecognizer * longPreaages = [[UILongPressGestureRecognizer alloc]initWithTarget:self action:@selector(removePhotoLibrary:)];
                [cell addGestureRecognizer:longPreaages];
                PhotoLibModel * phoModel = [self.dataArray objectAtIndex:indexPath.row - 1];
                NSURL * url = [NSURL URLWithString:phoModel.smallPhotoUrl];
                [cell.photoImageView sd_setImageWithURL:url placeholderImage:[UIImage imageNamed:@"00"]];
            }
        }else{
            
            //  只是查看相册
            PhotoLibModel * phoModel = [self.dataArray objectAtIndex:indexPath.row];
            NSURL * url = [NSURL URLWithString:phoModel.smallPhotoUrl];
            [cell.photoImageView sd_setImageWithURL:url placeholderImage:[UIImage imageNamed:@"00"]];
        }
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
    [self.headerView.playerView pause];
    if (1 == indexPath.section) {
        
        if ([self.userID isEqualToString:USERID]) { //  如果是自己则可编辑

            if (0 == indexPath.row) {
            
                // 点击 修改图片 调用手机相机和相册
        
                UIAlertAction * act1 = [UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {
                    //        _photos = 1;
                }];
//                  __weak typeof(self) weakSelf = self;
                //拍照：
                UIAlertAction * act2 = [UIAlertAction actionWithTitle:@"拍摄" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
                    [self takePhoto];
                }];
                //相册
                UIAlertAction * act3 = [UIAlertAction actionWithTitle:@"去相册选择" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
                    [self pushImagePickerController];
                }];
                
                UIAlertController * aleVC = [UIAlertController alertControllerWithTitle:@"提示" message:@"选择图片" preferredStyle:UIAlertControllerStyleActionSheet];
                [aleVC addAction:act1];
                [aleVC addAction:act2];
                [aleVC addAction:act3];
                [self presentViewController:aleVC animated:YES completion:nil];

                }else{
                //查看大图
                DYBaseView *baseView = [[DYBaseView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT)];
                baseView.iconArray =  self.dataArray;
                baseView.rectArray = rectArray;//@[NSStringFromCGRect(CGRectMake(0, 64, SCREEN_WIDTH, SCREEN_WIDTH))];
                baseView.index = indexPath.row - 1;
                [[UIApplication sharedApplication].keyWindow addSubview:baseView];
                baseView.backgroundColor = [UIColor blackColor];
            }
    }else{
        //如果是他人的 只能查看大图
        DYBaseView *baseView = [[DYBaseView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT)];
        baseView.iconArray =  self.dataArray;
        baseView.rectArray = rectArray;//@[NSStringFromCGRect(CGRectMake(0, 64, SCREEN_WIDTH, SCREEN_WIDTH))];
        baseView.index = indexPath.row;
        [[UIApplication sharedApplication].keyWindow addSubview:baseView];
        baseView.backgroundColor = [UIColor blackColor];
    }
    }
    else if(indexPath.section == 0 && indexPath.row == 1)
    {
        if([self.infoModel.club objectForKey:@"userNum"])
        {
            MY_TTLClubDetailViewController* clubVc = [[MY_TTLClubDetailViewController alloc]init];
            clubVc.ClubID = [self.infoModel.club[@"roomId"] intValue];
            [self.navigationController pushViewController:clubVc animated:YES];
        }
        else
        {
            if([self.userID isEqualToString:USERID])
            {
                MY_LLCreateClubsViewController* inviVc = [[MY_LLCreateClubsViewController alloc]init];
//                inviVc.hidesBottomBarWhenPushed = YES;
                [self.navigationController pushViewController:inviVc animated:YES];
            }else
            {
                
            }
        }
    }
}

-(void)removePhotoLibrary:(UILongPressGestureRecognizer*)gesture{
    
    UIView * touchV = gesture.view;
    MY_GLPhotoLibraryCollectionCell * collectionCell = (MY_GLPhotoLibraryCollectionCell*)touchV;
    NSIndexPath * indexPath = [self.collectionView indexPathForCell:collectionCell];
    
    if (0 == indexPath.row) {
        return;
    }
    
	UIAlertAction * canAction = [UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:nil];
    UIAlertController * alertCtr =  [UIAlertController alertControllerWithTitle:@"提示" message:@"您确定要删除此照片？" preferredStyle:UIAlertControllerStyleAlert];
    UIAlertAction * payAction = [UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        
        //  删除照片

        PhotoLibModel * libMod = [self.dataArray objectAtIndex:indexPath.row - 1];

        [TLHTTPRequest MY_postWithBaseUrl:deleteUserPhotos parameters:@{@"photoId":[libMod.photoId stringValue]} success:^(NSURLSessionDataTask * _Nonnull task, NSDictionary * _Nonnull data) {
           
            if ([[data objectForKey:@"ret"] integerValue] == 0) {
                
                NSInteger row = indexPath.row;
                
                [self.dataArray removeObjectAtIndex:row - 1];
                //    [self.pa removeObjectAtIndex:row + 1];
                
                [self.collectionView reloadData];
                
            }else{
                if ([data objectForKey:@"msg"]) {
                    [LQProgressHud showMessage:[data objectForKey:@"msg"]];
                }
            }
            
        } failure:^(NSURLSessionDataTask * _Nonnull task, NSError * _Nonnull error) {
            [LQProgressHud showMessage:@"没网怎能忍？"];
            
        }];
        
    }];
    
    [alertCtr addAction:canAction];
    [alertCtr addAction:payAction];
    [self presentViewController:alertCtr animated:YES completion:nil];
//}

}

#pragma mark - UIImagePickerController

- (void)takePhoto {
    AVAuthorizationStatus authStatus = [AVCaptureDevice authorizationStatusForMediaType:AVMediaTypeVideo];
    if ((authStatus == AVAuthorizationStatusRestricted || authStatus == AVAuthorizationStatusDenied) && iOS7Later) {
        // 无相机权限 做一个友好的提示
        [Utility alertViewWithTitle:@"请在iPhone的""设置-隐私-相机""中允许访问相机" withBlockCancle:^{
            
        } withBlockSure:^{
            if (iOS8Later) {
                [[UIApplication sharedApplication] openURL:[NSURL URLWithString:UIApplicationOpenSettingsURLString]];
            } else {
                NSURL *privacyUrl;
                privacyUrl = [NSURL URLWithString:@"prefs:root=Privacy&path=CAMERA"];
                if ([[UIApplication sharedApplication] canOpenURL:privacyUrl]) {
                    [[UIApplication sharedApplication] openURL:privacyUrl];
                } else {
                    [LQProgressHud showInfoMsg:@"无法跳转到隐私设置页面，请手动前往设置页面，谢谢"];
                }
            }
        } withBlock:^(UIAlertController *alertView) {
            [self presentViewController:alertView animated:YES completion:nil];
        }];
        // 拍照之前还需要检查相册权限
    } else if ([[TZImageManager manager] authorizationStatus] == 2) { // 已被拒绝，没有相册权限，将无法保存拍的照片
        [Utility alertViewWithTitle:@"请在iPhone的""设置-隐私-相册""中允许访问相册" withBlockCancle:^{
            
        } withBlockSure:^{
            if (iOS8Later) {
                [[UIApplication sharedApplication] openURL:[NSURL URLWithString:UIApplicationOpenSettingsURLString]];
            } else {
                NSURL *privacyUrl;
                privacyUrl = [NSURL URLWithString:@"prefs:root=Privacy&path=PHOTOS"];
                if ([[UIApplication sharedApplication] canOpenURL:privacyUrl]) {
                    [[UIApplication sharedApplication] openURL:privacyUrl];
                } else {
                    [LQProgressHud showInfoMsg:@"无法跳转到隐私设置页面，请手动前往设置页面，谢谢"];
                }
            }
        } withBlock:^(UIAlertController *alertView) {
            [self presentViewController:alertView animated:YES completion:nil];
        }];
    } else if ([[TZImageManager manager] authorizationStatus] == 0) { // 正在弹框询问用户是否允许访问相册，监听权限状态
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.1 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            return [self takePhoto];
        });
    } else { // 调用相机
        UIImagePickerControllerSourceType sourceType = UIImagePickerControllerSourceTypeCamera;
        if ([UIImagePickerController isSourceTypeAvailable: UIImagePickerControllerSourceTypeCamera]) {
            self.imagePickerVc.sourceType = sourceType;
            self.imagePickerVc.mediaTypes = @[(NSString *)kUTTypeImage,(NSString *)kUTTypeMovie];
            if(iOS8Later) {
                _imagePickerVc.modalPresentationStyle = UIModalPresentationOverCurrentContext;
            }
            [self presentViewController:_imagePickerVc animated:YES completion:nil];
        } else {
//            NSLog(@"模拟器中无法打开照相机,请在真机中使用");
        }
    }
}
#pragma mark - TZImagePickerController

- (void)pushImagePickerController {
    if (MaxSelectCount <= 0) {
        return;
    }
    TZImagePickerController *tzimagePickerVc = [[TZImagePickerController alloc] initWithMaxImagesCount:MaxSelectCount columnNumber:4 delegate:self pushPhotoPickerVc:YES];
    
#pragma mark - 四类个性化设置，这些参数都可以不传，此时会走默认设置
    tzimagePickerVc.isSelectOriginalPhoto = NO;
    
    if (MaxSelectCount > 1) {
        // 1.设置目前已经选中的图片数组
        tzimagePickerVc.selectedAssets = _selectedAssets; // 目前已经选中的图片数组
    }
    tzimagePickerVc.allowTakePicture = NO; // 在内部显示拍照按钮
    
    // 2. Set the appearance
    // 2. 在这里设置imagePickerVc的外观
    // imagePickerVc.navigationBar.barTintColor = [UIColor greenColor];
    // imagePickerVc.oKButtonTitleColorDisabled = [UIColor lightGrayColor];
    // imagePickerVc.oKButtonTitleColorNormal = [UIColor greenColor];
    
    // 3. Set allow picking video & photo & originalPhoto or not
    // 3. 设置是否可以选择视频/图片/原图
    tzimagePickerVc.allowPickingVideo = YES;
    tzimagePickerVc.allowPickingImage = YES;
    tzimagePickerVc.allowPickingOriginalPhoto = YES;
    
    // 4. 照片排列按修改时间升序
    tzimagePickerVc.sortAscendingByModificationDate = YES;
    
    // imagePickerVc.minImagesCount = 3;
    // imagePickerVc.alwaysEnableDoneBtn = YES;
    
    // imagePickerVc.minPhotoWidthSelectable = 3000;
    // imagePickerVc.minPhotoHeightSelectable = 2000;
    
    /// 5. Single selection mode, valid when maxImagesCount = 1
    /// 5. 单选模式,maxImagesCount为1时才生效
    tzimagePickerVc.showSelectBtn = YES;
    tzimagePickerVc.allowCrop = YES;
    tzimagePickerVc.needCircleCrop = NO;
    //    imagePickerVc.circleCropRadius = 100;
    /*
     [imagePickerVc setCropViewSettingBlock:^(UIView *cropView) {
     cropView.layer.borderColor = [UIColor redColor].CGColor;
     cropView.layer.borderWidth = 2.0;
     }];*/
#pragma mark - 到这里为止
    
    // You can get the photos by block, the same as by delegate.
    // 你可以通过block或者代理，来得到用户选择的照片.
//    [tzimagePickerVc setDidFinishPickingPhotosHandle:^(NSArray<UIImage *> *photos, NSArray *assets, BOOL isSelectOriginalPhoto) {
////        _isChooseVideo = NO;
//
//        [_selectedAssets addObjectsFromArray:photos];
////
//        if ([_selectedAssets count]) {
//
//            //  开始上传服务器
//            [self imageArray:_selectedAssets];
//        }
//
//    }];
//
    [self presentViewController:tzimagePickerVc animated:YES completion:nil];
}

#pragma mark - - 如果是自己 则上传相册

-(void)imageArray:(NSMutableArray *)array
{
    [MBProgressHUD showHUDAddedTo:self.view animated:YES];
    
    for (NSInteger i = 0; i<[array count]; i++) {
        
        UIImage * img = [array objectAtIndex:i];

        NSArray * ary = @[UIImageJPEGRepresentation((UIImage *)img,0.5)];
        NSData * da1 = UIImageJPEGRepresentation((UIImage *)img,1.0);
        NSData * da = (NSData *)ary.firstObject;
        NSLog(@"%ld",da.length);
        [TLHTTPRequest MY_postDataAndImageRequest:UploadFileURL parameters:nil imageDataArr:ary success:^(NSURLSessionDataTask * _Nonnull task, NSDictionary * _Nonnull data) {
            if ([[data objectForKey:@"ret"] boolValue] == 0) {
                if ([data objectForKey:@"info"]) {
                    NSString* str = [[data objectForKey:@"info"] objectForKey:@"furl"];
                    if (![Utility isBlankString:str]) {
                        
                        //                    UserSetObject(str, @"headIcon");
                        
                        NSString * fid = [[data objectForKey:@"info"] objectForKey:@"fid"];
                        if (imgfid || [imgfid length]) {
                            imgfid = [NSString stringWithFormat:@"%@,%@",imgfid,fid];
                        }else{
                            imgfid = fid;
                        }
                    }
                }
                if (i == [array count] - 1) {
                    
                    [self updatePhotoLibiary:imgfid];
                }
            }
            else{
                imgfid = nil;
                if ([data objectForKey:@"msg"]) {
                    [LQProgressHud showMessage:[data objectForKey:@"msg"]];
                }
            }
            
        } failure:^(NSURLSessionDataTask * _Nonnull task, NSError * _Nonnull error) {
             imgfid = nil;
            [LQProgressHud showMessage:@"上传图片失败"];
        }];
    }
    
}

// 上传相册
-(void)updatePhotoLibiary:(NSString*)fid{
     imgfid = nil;
    if (fid && [fid length]) {
        NSDictionary * dic = @{@"fids":fid};
        [TLHTTPRequest MY_postWithBaseUrl:UploadPhotoUrl parameters:dic success:^(NSURLSessionDataTask * _Nonnull task, NSDictionary * _Nonnull data) {
            
            if ([[data objectForKey:@"ret"] boolValue] == 0) {
              
                [MBProgressHUD hideHUDForView:self.view animated:YES];
                [LQProgressHud showMessage:@"上传成功"];
                
                [_selectedAssets removeAllObjects];
                
                [self headerRefreshing];

            }else if ([data objectForKey:@"msg"]) {
                [LQProgressHud showMessage:[data objectForKey:@"msg"]];
            }
        } failure:^(NSURLSessionDataTask * _Nonnull task, NSError * _Nonnull error) {
            [MBProgressHUD hideHUDForView:self.view animated:YES];

            [LQProgressHud showMessage:@"上传失败"];
        }];
    }
}

#pragma mark - - 查看大图

//- (void)scrollViewWillBeginDragging:(UIScrollView *)scrollView{
//    
//    if (scrollView == self.collectionView)
//    {
//        if (0 >= scrollView.contentOffset.y )
//        {
//            scrollView.contentOffset = CGPointMake(0, 0);
//        }
//    }
//}


// 计算滑动之时，cell的位置
- (void)scrollViewDidScroll:(UIScrollView *)scrollView {

    NSMutableArray<NSString *> *array = [NSMutableArray<NSString *> array];
    BOOL isMine = [self.userID isEqualToString:USERID];
    
    NSInteger count = [self.dataArray count];
    if (isMine) {
        
        count ++;
    }
    
    for (NSInteger index = 0; index < count; index++) {
        NSIndexPath *indexPath = [NSIndexPath indexPathForRow:index inSection:1];
        MY_GLPhotoLibraryCollectionCell *cell = (MY_GLPhotoLibraryCollectionCell *)[self.collectionView cellForItemAtIndexPath:indexPath];
        UIWindow* window = [UIApplication sharedApplication].keyWindow;
        CGRect rectInWindow = [cell convertRect:cell.photoImageView.frame toView:window];

        if (index == 0) {
            
            if (!isMine) {
                [array addObject:NSStringFromCGRect(rectInWindow)];
            }
        }else{
            [array addObject:NSStringFromCGRect(rectInWindow)];
        }
    }
    rectArray = array;
}
//
//// 此方法会在cell显示出来后再执行，所以这里可以计算滑动之前cell的位置
- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    NSMutableArray<NSString *> *array = [NSMutableArray<NSString *> array];
    
    BOOL isMine = [self.userID isEqualToString:USERID];
    
    NSInteger count = [self.dataArray count];
    if (isMine) {
        
        count ++;
    }
    
    for (NSInteger index = 0; index < count; index++) {
        NSIndexPath *indexPath = [NSIndexPath indexPathForRow:index inSection:1];
        MY_GLPhotoLibraryCollectionCell *cell = (MY_GLPhotoLibraryCollectionCell *)[self.collectionView cellForItemAtIndexPath:indexPath];
        UIWindow* window = [UIApplication sharedApplication].keyWindow;
        CGRect rectInWindow = [cell convertRect:cell.photoImageView.frame toView:window];

        if (index == 0) {
            
            if (!isMine) {
                [array addObject:NSStringFromCGRect(rectInWindow)];
            }
        }else{
            [array addObject:NSStringFromCGRect(rectInWindow)];
        }
    }
    rectArray = array;
}

#pragma mark - - 分享 
//  分享自己的内容
- (void)addShareOneself{
    
    //array0,标题 array1：详情 array2：url
//    SDWebImageManager *manager = [SDWebImageManager sharedManager];
//    
//    [manager downloadImageWithURL:[NSURL URLWithString:_model.headIcon] options:SDWebImageAllowInvalidSSLCertificates progress:^(NSInteger receivedSize, NSInteger expectedSize) {
//        
//    } completed:^(UIImage *image, NSError *error, SDImageCacheType cacheType, BOOL finished, NSURL *imageURL) {
//        
//        //array0,标题 array1：详情 array2：url
//        NSTimeInterval timeInterval = [[NSDate date] timeIntervalSince1970];
//        NSString * timeStr = [NSString stringWithFormat:@"%lf", (double)timeInterval];
//        
//        NSString *titleStr = [NSString stringWithFormat:@"我是达人%@,你主动我们才会有故事，我在Vshi'da等你。", _model.nickName];
//        
//        NSString *detailsStr = [NSString stringWithFormat:@""];
//        
//        NSString *urlStr = SharePersonal([_model.userId intValue], [USERID intValue], timeStr);
//        
//        NSArray* array = @[titleStr, detailsStr, urlStr];
//        
//        MY_TTLShareOnlyView* alert = [[MY_TTLShareOnlyView alloc] initWithFrame:ShareFrame withArray:array image:image type:0 typeId:nil];
//        [UIView animateWithDuration:0.2 animations:^{
//            [alert show];
//        }];
//    }];
}

//  分享他人，并且有删除
- (void)addShareWithOthers{
    
    __weak typeof(self) wSelf = self;
    //array0,标题 array1：详情 array2：url
//    SDWebImageManager *manager = [SDWebImageManager sharedManager];
//    
//    [manager downloadImageWithURL:[NSURL URLWithString:_model.headIcon] options:SDWebImageAllowInvalidSSLCertificates progress:^(NSInteger receivedSize, NSInteger expectedSize) {
//        
//    } completed:^(UIImage *image, NSError *error, SDImageCacheType cacheType, BOOL finished, NSURL *imageURL) {
    
        //array0,标题 array1：详情 array2：url
//        NSTimeInterval timeInterval = [[NSDate date] timeIntervalSince1970];
//        NSString * timeStr = [NSString stringWithFormat:@"%lf", (double)timeInterval];
//        
//        NSString *titleStr = [NSString stringWithFormat:@"我是达人%@,你主动我们才会有故事，我在V时代等你。", _model.nickName];
//        NSString *detailsStr = [NSString stringWithFormat:@""];
//        NSString *urlStr = SharePersonal([_model.userId intValue], [USERID intValue], timeStr);
        
//        NSArray* array = @[titleStr, detailsStr, urlStr];
        
        MY_TTLShareView* alert = [[MY_TTLShareView alloc]initWithFrame:ShareFrame withArray:@[] withSelfInfo:YES withDelete:NO image:nil type:0 typeId:nil];
        
        alert.callBackTitle = ^(NSInteger btnIndex){
            //  拉黑
            if (0 == btnIndex) {
                
                UIAlertView * alertView = [[UIAlertView alloc] initWithTitle:@"提示" message:@"拉黑后将不会收到对方消息，请在“我的-设置-黑名单”中解除，是否确定？" delegate:wSelf cancelButtonTitle:@"取消" otherButtonTitles:@"确定", nil];
                [alertView show];
                
                //  举报
            }else if (1 == btnIndex) {
                
                MY_TTLReportViewController* reVc = [[MY_TTLReportViewController alloc]init];
                reVc.repotrOfUserId = [wSelf.userID integerValue];
                reVc.reportOfPerson = wSelf.infoModel.nickName;
                [wSelf.navigationController pushViewController:reVc animated:YES];
            }
        };
        [UIView animateWithDuration:0.2 animations:^{
            [alert show];
        }];
//    }];
}

#pragma mark - UIAlertViewDelegate
- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex{
    
    if ([alertView.message isEqualToString:@"拉黑后将不会收到对方消息，请在“我的-设置-黑名单”中解除，是否确定？"]) {
        if (buttonIndex == 1) {
            [self addBlackListWihtOnUserId:self.userID];
        }
    }
}

//  拉黑
- (void)addBlackListWihtOnUserId:(NSString *)onUserId{
    
    NSDictionary * parameters = @{@"userId":onUserId,@"type":@"1"};
    
    [TLHTTPRequest MY_getWithBaseUrl:BlackUpdataUrl parameters:parameters success:^(NSURLSessionDataTask * _Nonnull task, NSDictionary * _Nonnull data) {
        
        if ([[data objectForKey:@"ret"] boolValue] == 0) {
            
            [LQProgressHud showMessage:@"拉黑成功"];
            
            EMError *error = [[EMClient sharedClient].contactManager addUserToBlackList:onUserId relationshipBoth:YES];
            if (!error) {
            }
        }else if ([data objectForKey:@"msg"]) {
            [LQProgressHud showMessage:[data objectForKey:@"msg"]];
        }
    } failure:^(NSURLSessionDataTask * _Nonnull task, NSError * _Nonnull error) {
        [LQProgressHud showMessage:@"没网怎能忍？"];

    }];
}


#pragma clang diagnostic ignored "-Wdeprecated-declarations"
- (UIImagePickerController *)imagePickerVc {
    if (_imagePickerVc == nil) {
        _imagePickerVc = [[UIImagePickerController alloc] init];
        _imagePickerVc.delegate = self;
        // set appearance / 改变相册选择页的导航栏外观
        _imagePickerVc.navigationBar.barTintColor = self.navigationController.navigationBar.barTintColor;
        _imagePickerVc.navigationBar.tintColor = self.navigationController.navigationBar.tintColor;
        UIBarButtonItem *tzBarItem, *BarItem;
        if (iOS9Later) {
            tzBarItem = [UIBarButtonItem appearanceWhenContainedInInstancesOfClasses:@[[TZImagePickerController class]]];
            BarItem = [UIBarButtonItem appearanceWhenContainedInInstancesOfClasses:@[[UIImagePickerController class]]];
        } else {
            tzBarItem = [UIBarButtonItem appearanceWhenContainedIn:[TZImagePickerController class], nil];
            BarItem = [UIBarButtonItem appearanceWhenContainedIn:[UIImagePickerController class], nil];
        }
        NSDictionary *titleTextAttributes = [tzBarItem titleTextAttributesForState:UIControlStateNormal];
        [BarItem setTitleTextAttributes:titleTextAttributes forState:UIControlStateNormal];
    }
    return _imagePickerVc;
}



-(NSMutableArray*)dataArray{
    if (!_dataArray) {
        _dataArray = [NSMutableArray arrayWithCapacity:0];
    }
    return _dataArray;
}

-(NSMutableArray*)arrayPage{
    if (!_arrayPage) {
        _arrayPage = [NSMutableArray arrayWithCapacity:0];
    }
    return _arrayPage;
}



- (void)imagePickerController:(UIImagePickerController*)picker didFinishPickingMediaWithInfo:(NSDictionary *)info {
    [picker dismissViewControllerAnimated:YES completion:nil];
    NSString *type = [info objectForKey:UIImagePickerControllerMediaType];
    if ([type isEqualToString:@"public.image"]) {
        _isChooseVideo = NO;
        [MBProgressHUD showHUDAddedTo:self.view animated:YES];
        TZImagePickerController *tzImagePickerVc = [[TZImagePickerController alloc] initWithMaxImagesCount:1 delegate:self];
        tzImagePickerVc.sortAscendingByModificationDate = YES;
        UIImage *image = [info objectForKey:UIImagePickerControllerOriginalImage];
        // save photo and get asset / 保存图片，获取到asset
        [[TZImageManager manager] savePhotoWithImage:image completion:^(NSError *error){
            if (error) {
                [MBProgressHUD hideHUDForView:self.view animated:YES];
            } else {
                [[TZImageManager manager] getCameraRollAlbum:NO allowPickingImage:YES completion:^(TZAlbumModel *model) {
                    [[TZImageManager manager] getAssetsFromFetchResult:model.result allowPickingVideo:NO allowPickingImage:YES completion:^(NSArray<TZAssetModel *> *models) {
                        [MBProgressHUD hideHUDForView:self.view animated:YES];
                        TZAssetModel *assetModel = [models firstObject];
                        if (tzImagePickerVc.sortAscendingByModificationDate) {
                            assetModel = [models lastObject];
                        }
                        //                        if (YES) { // 允许裁剪,去裁剪
                        TZImagePickerController *imagePicker = [[TZImagePickerController alloc] initCropTypeWithAsset:assetModel.asset photo:image completion:^(UIImage *cropImage, id asset) {
                            
                            if (cropImage) {
                                //  开始上传服务器
                                [self imageArray:@[cropImage]];
                            }
                        }];
                        imagePicker.needCircleCrop = NO;
                        //                            imagePicker.circleCropRadius = 100;
                        [self presentViewController:imagePicker animated:YES completion:nil];
                        //                        } else {
                        //                            [self refreshCollectionViewWithAddedAsset:assetModel.asset image:image];
                        //                        }
                    }];
                }];
   
              
            }
        }];
    }
    else{
        _isChooseVideo = YES;
        //        [MBProgressHUD hideHUDForView:self.view animated:YES];
        NSURL *sourceURL = [info objectForKey:UIImagePickerControllerMediaURL];
        NSURL *newVideoUrl ; //一般.mp4
        NSDateFormatter *formater = [[NSDateFormatter alloc] init];//用时间给文件全名，以免重复，在测试的时候其实可以判断文件是否存在若存在，则删除，重新生成文件即可
        [formater setDateFormat:@"yyyy-MM-dd-HH:mm:ss"];
        newVideoUrl = [NSURL fileURLWithPath:[NSHomeDirectory() stringByAppendingFormat:@"/Documents/output-%@.mp4", [formater stringFromDate:[NSDate date]]]] ;//这个是保存在app自己的沙盒路径里，后面可以选择是否在上传后删除掉。我建议删除掉，免得占空间。
        [picker dismissViewControllerAnimated:YES completion:nil];
        [self convertVideoQuailtyWithInputURL:sourceURL outputURL:newVideoUrl completeHandler:nil];
        [_selectedAssets removeAllObjects];
        [_selectedPhotos addObject:[Utility thumbnailImageForVideo:sourceURL atTime:0]];
    }
}
//获取视频时间
- (NSInteger) getVideoDuration:(NSURL*) URL
{
    NSDictionary *opts = [NSDictionary dictionaryWithObject:[NSNumber numberWithBool:NO]
                                                     forKey:AVURLAssetPreferPreciseDurationAndTimingKey];
    AVURLAsset *urlAsset = [AVURLAsset URLAssetWithURL:URL options:opts];
    NSInteger second = 0;
    second = urlAsset.duration.value/urlAsset.duration.timescale;
    return second;
}

- (void)refreshCollectionViewWithAddedAsset:(id)asset image:(UIImage *)image {
    [_selectedAssets addObject:asset];
    [_selectedPhotos addObject:image];
    [_collectionView reloadData];
}

- (void)imagePickerControllerDidCancel:(UIImagePickerController *)picker {
    if ([picker isKindOfClass:[UIImagePickerController class]]) {
        [picker dismissViewControllerAnimated:YES completion:nil];
    }
}



#pragma mark - TZImagePickerControllerDelegate

/// User click cancel button
/// 用户点击了取消
- (void)tz_imagePickerControllerDidCancel:(TZImagePickerController *)picker {
    // NSLog(@"cancel");
}

// The picker should dismiss itself; when it dismissed these handle will be called.
// If isOriginalPhoto is YES, user picked the original photo.
// You can get original photo with asset, by the method [[TZImageManager manager] getOriginalPhotoWithAsset:completion:].
// The UIImage Object in photos default width is 828px, you can set it by photoWidth property.
// 这个照片选择器会自己dismiss，当选择器dismiss的时候，会执行下面的代理方法
// 如果isSelectOriginalPhoto为YES，表明用户选择了原图
// 你可以通过一个asset获得原图，通过这个方法：[[TZImageManager manager] getOriginalPhotoWithAsset:completion:]
// photos数组里的UIImage对象，默认是828像素宽，你可以通过设置photoWidth属性的值来改变它
- (void)imagePickerController:(TZImagePickerController *)picker didFinishPickingPhotos:(NSArray *)photos sourceAssets:(NSArray *)assets isSelectOriginalPhoto:(BOOL)isSelectOriginalPhoto {
//    _selectedPhotos = [NSMutableArray arrayWithArray:photos];
//    _selectedAssets = [NSMutableArray arrayWithArray:assets];
//    _isSelectOriginalPhoto = isSelectOriginalPhoto;
//    [_collectionView reloadData];
    // _collectionView.contentSize = CGSizeMake(0, ((_selectedPhotos.count + 2) / 3 ) * (_margin + _itemWH));
    _isChooseVideo = NO;
    
    [_selectedAssets addObjectsFromArray:photos];
    //
    if ([_selectedAssets count]) {
        
        //  开始上传服务器
        [self imageArray:_selectedAssets];
    }
    
    // 1.打印图片名字
    [self printAssetsName:assets];
}

// If user picking a video, this callback will be called.
// If system version > iOS8,asset is kind of PHAsset class, else is ALAsset class.
// 如果用户选择了一个视频，下面的handle会被执行
// 如果系统版本大于iOS8，asset是PHAsset类的对象，否则是ALAsset类的对象
- (void)imagePickerController:(TZImagePickerController *)picker didFinishPickingVideo:(UIImage *)coverImage sourceAssets:(id)asset {
    [MBProgressHUD showHUDAddedTo:self.view animated:YES];
    _selectedPhotos = [NSMutableArray arrayWithArray:@[coverImage]];
    _selectedAssets = [NSMutableArray arrayWithArray:@[asset]];
    // open this code to send video / 打开这段代码发送视频
    __weak typeof (self) weakSelf = self;
    [[TZImageManager manager] getVideoOutputPathWithAsset:asset completion:^(NSString *outputPath) {
        NSLog(@"视频导出到本地完成,沙盒路径为:%@",outputPath);
        _isChooseVideo = YES;
        NSURL* url = [NSURL fileURLWithPath:outputPath];
        _videoLength = [self getVideoDuration:url];
        //上传视频
//        dispatch_async(dispatch_get_main_queue(), ^{
            [weakSelf alertUploadVideo:url];
//        });
//        [_collectionView reloadData];
        
    }];
}

#pragma mark - Click Event

- (void)deleteBtnClik:(UIButton *)sender {
    [_selectedPhotos removeObjectAtIndex:sender.tag];
    if (_selectedAssets.count > 0) {
        [_selectedAssets removeObjectAtIndex:sender.tag];
    }
    [_collectionView reloadData];
    //    [_collectionView performBatchUpdates:^{
    //        NSIndexPath *indexPath = [NSIndexPath indexPathForItem:sender.tag inSection:0];
    //        [_collectionView deleteItemsAtIndexPaths:@[indexPath]];
    //    } completion:^(BOOL finished) {
    //        [_collectionView reloadData];
    //    }];
}

#pragma mark - Private

/// 打印图片名字
- (void)printAssetsName:(NSArray *)assets {
    NSString *fileName;
    for (id asset in assets) {
        if ([asset isKindOfClass:[PHAsset class]]) {
            PHAsset *phAsset = (PHAsset *)asset;
            fileName = [phAsset valueForKey:@"filename"];
        } else if ([asset isKindOfClass:[ALAsset class]]) {
            ALAsset *alAsset = (ALAsset *)asset;
            fileName = alAsset.defaultRepresentation.filename;;
        }
        //NSLog(@"图片名字:%@",fileName);
    }
}

- (UIInterfaceOrientationMask)supportedInterfaceOrientations {
    return UIInterfaceOrientationMaskPortrait;
}
#pragma mark --拍摄视频
- (void) convertVideoQuailtyWithInputURL:(NSURL*)inputURL
                               outputURL:(NSURL*)outputURL
                         completeHandler:(void (^)(AVAssetExportSession*))handler
{
    AVURLAsset *avAsset = [AVURLAsset URLAssetWithURL:inputURL options:nil];
    
    AVAssetExportSession *exportSession = [[AVAssetExportSession alloc] initWithAsset:avAsset presetName:AVAssetExportPresetMediumQuality];
    //  NSLog(resultPath);
    exportSession.outputURL = outputURL;
    exportSession.outputFileType = AVFileTypeMPEG4;//AVFileTypeQuickTimeMovie
    exportSession.shouldOptimizeForNetworkUse= YES;
    if (exportSession == nil) {
        [LQProgressHud showMessage:@"视频格式不对,请重新选择"];
        [MBProgressHUD hideHUDForView:self.view animated:YES];
    }
    __weak typeof (self) weakSelf = self;
    [exportSession exportAsynchronouslyWithCompletionHandler:^(void)
     {
         switch (exportSession.status) {
             case AVAssetExportSessionStatusCancelled:
                 [MBProgressHUD hideHUDForView:self.view animated:YES];
//                 NSLog(@"AVAssetExportSessionStatusCancelled");
                 break;
             case AVAssetExportSessionStatusUnknown:
                 [MBProgressHUD hideHUDForView:self.view animated:YES];
//                 NSLog(@"AVAssetExportSessionStatusUnknown");
                 break;
             case AVAssetExportSessionStatusWaiting:
                 [MBProgressHUD hideHUDForView:self.view animated:YES];
//                 NSLog(@"AVAssetExportSessionStatusWaiting");
                 break;
             case AVAssetExportSessionStatusExporting:
                 [MBProgressHUD hideHUDForView:self.view animated:YES];
                 NSLog(@"AVAssetExportSessionStatusExporting");
                 break;
             case AVAssetExportSessionStatusCompleted:
             {
//                 NSLog(@"AVAssetExportSessionStatusCompleted");
                 
                 dispatch_async(dispatch_get_main_queue(), ^{
                     _videoLength = [self getVideoDuration:outputURL];
                     [weakSelf alertUploadVideo:outputURL];
                 });
             }
                 break;
             case AVAssetExportSessionStatusFailed:
                 [MBProgressHUD hideHUDForView:self.view animated:YES];
                 NSLog(@"AVAssetExportSessionStatusFailed");
                 break;
         }
         
     }];
    
}

-(void)alertUploadVideo:(NSURL*)URL{
    if (_videoLength > 10) {
        [MBProgressHUD hideHUDForView:self.view animated:YES];
        [LQProgressHud showMessage:@"视频最长只能10s"];
        [[NSNotificationCenter defaultCenter] postNotificationName:@"refreshwebpages" object:nil userInfo:nil];
        [[NSFileManager defaultManager] removeItemAtPath:[URL path] error:nil];//取消之后就删除，以免占用手机硬盘空间（沙盒）
        if (_selectedAssets.count > 0) {
            [_selectedAssets removeAllObjects];
        }
        if (_selectedPhotos.count > 0) {
            [_selectedPhotos removeAllObjects];
        }
        [_collectionView reloadData];
        return;
    }
    else
    {
        [self uploadVideo:URL];
    }
    
}

#pragma mark --上传视频
-(void)uploadVideo:(NSURL*)URL{
    
    [MBProgressHUD hideHUDForView:self.view animated:YES];
    _videoDegress = [self degressFromVideoFileWithURL:URL];
    _imageFirst = [self getVideoPreViewImage:URL];
    _videoURL = URL;
    if (_imageFirst != nil) {
//        [_collectionView reloadData];
        [self upVideo];
    }
}




// 获取视频第一帧
- (UIImage*) getVideoPreViewImage:(NSURL *)path
{
    AVURLAsset *asset = [[AVURLAsset alloc] initWithURL:path options:nil];
    AVAssetImageGenerator *assetGen = [[AVAssetImageGenerator alloc] initWithAsset:asset];
    
    assetGen.appliesPreferredTrackTransform = YES;
    CMTime time = CMTimeMakeWithSeconds(0.0, 600);
    NSError *error = nil;
    CMTime actualTime;
    CGImageRef image = [assetGen copyCGImageAtTime:time actualTime:&actualTime error:&error];
    UIImage *videoImage = [[UIImage alloc] initWithCGImage:image];
    CGImageRelease(image);
    return videoImage;
}

/// 获取视频角度
-(NSInteger)degressFromVideoFileWithURL:(NSURL *)url
{
    NSInteger degress = 0;
    AVAsset *asset = [AVAsset assetWithURL:url];
    NSArray *tracks = [asset tracksWithMediaType:AVMediaTypeVideo];
    if([tracks count] > 0) {
        AVAssetTrack *videoTrack = [tracks objectAtIndex:0];
        CGAffineTransform t = videoTrack.preferredTransform;
        
        if(t.a == 0 && t.b == 1.0 && t.c == -1.0 && t.d == 0){
            // Portrait
            degress = 90;
        }else if(t.a == 0 && t.b == -1.0 && t.c == 1.0 && t.d == 0){
            // PortraitUpsideDown
            degress = 270;
        }else if(t.a == 1.0 && t.b == 0 && t.c == 0 && t.d == 1.0){
            // LandscapeRight
            degress = 0;
        }else if(t.a == -1.0 && t.b == 0 && t.c == 0 && t.d == -1.0){
            // LandscapeLeft
            degress = 180;
        }
    }
    return degress;
}

- (void)upVideo{
    NSData *data = [NSData dataWithContentsOfURL:_videoURL];
    NSMutableDictionary* dictVideo = [[NSMutableDictionary alloc]init];
    [dictVideo setObject:@(_videoDegress) forKey:@"rotate"];   //视频旋转角度
    
    [TLHTTPRequest MY_postToUrlString:UploadFileURL parameters:dictVideo fileData:data name:@"video" fileName:@"123" mimeType:1 response:Data success:^(NSURLSessionDataTask * _Nonnull task, NSDictionary * _Nonnull data) {
        if ([[data objectForKey:@"ret"] integerValue] == 0) {
//            [self.dict setObject:[[data objectForKey:@"info"]objectForKey:@"fid"] forKey:@"fid"];
            NSString* str = [[data objectForKey:@"info"] objectForKey:@"furl"];
            if (![Utility isBlankString:str]) {
                NSString * fid = [[data objectForKey:@"info"] objectForKey:@"fid"];
                if (imgfid || [imgfid length]) {
                    
                    imgfid = [NSString stringWithFormat:@"%@,%@",imgfid,fid];
                }else{
                    imgfid = fid;
                }
            }
            [self updatePhotoLibiary:imgfid];
        
        
        }
        else{
            imgfid = nil;
            [MBProgressHUD hideHUDForView:self.view animated:YES];
            self.navigationItem.rightBarButtonItem.enabled=YES;
            if ([data objectForKey:@"msg"]) {
                [LQProgressHud showMessage:[data objectForKey:@"msg"]];
            }
        }
    } failure:^(NSURLSessionDataTask * _Nonnull task, NSError * _Nonnull error) {
        [MBProgressHUD hideHUDForView:self.view animated:YES];
        self.navigationItem.rightBarButtonItem.enabled=YES;
        imgfid = nil;
        [LQProgressHud showMessage:@"上传失败"];
    }];
}


- (void)dealloc{
    NSLog(@"MY_TTLSelfCenterViewController --dealloc");
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
