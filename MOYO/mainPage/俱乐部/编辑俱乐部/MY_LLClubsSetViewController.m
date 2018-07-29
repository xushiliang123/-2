//
//  MY_LLClubsSetViewController.m
//  VTIME
//
//  Created by tingting on 2017/10/13.
//  Copyright © 2017年 MadridLee. All rights reserved.
//

#import "MY_LLClubsSetViewController.h"
#import "MY_LLClubsSetCell.h"
#import "MY_LLClubsSetDeatilCell.h"
#import "MY_LYLocationViewController.h"

@interface MY_LLClubsSetViewController ()<UITextViewDelegate,UITextFieldDelegate>

@property (nonatomic, strong) NSMutableArray * dataArray;
@property (nonatomic, strong) UIImageView * imgProfile;
@property (nonatomic, strong) NSString * clubname;
@property (nonatomic, strong) NSString * clublocation;
@property (nonatomic, strong) NSString * clubinfo;
@property (strong, nonatomic) SXPickPhoto* pickPhoto;//相册类
@property (strong, nonatomic) NSMutableArray * imgArray;


@end

@implementation MY_LLClubsSetViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.pickPhoto = [[SXPickPhoto alloc]init];
    
    [self createTableView];
    
    [self imageUICreate];
}

-(void)imageUICreate
{
    self.imgProfile = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_WIDTH)];
    self.imgProfile.userInteractionEnabled = YES;
    self.imgProfile.contentMode = UIViewContentModeScaleAspectFill;
    self.imgProfile.layer.masksToBounds = YES;
    self.imgProfile.tag = 1011;
    self.tableView.tableHeaderView = self.imgProfile;
    UITapGestureRecognizer *singleTap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(imgvPress:)];
    [self.imgProfile addGestureRecognizer:singleTap];
    
    [self.imgProfile sd_setImageWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"%@",[self.clubInfoDic objectForKey:@"roomIcon"]]] placeholderImage:[UIImage imageNamed:@"占位图"]];
    
    NSMutableArray * arrayPage = [[NSMutableArray alloc] init];
    [arrayPage addObject:UIImageJPEGRepresentation(self.imgProfile.image, 0.5)];
    if (self.imgArray.count) {
        [self.imgArray removeAllObjects];
    }
    [self.imgArray addObjectsFromArray:arrayPage];
    
    
    UILabel * getLabel = [[UILabel alloc] init];
    getLabel.text = @"点击更换俱乐部头像";
    getLabel.textAlignment = NSTextAlignmentCenter;
    getLabel.font = [UIFont systemFontOfSize:16];
    getLabel.textColor = [Utility colorWithHexString:@"fffdfd" alpha:1.0];
    [self.imgProfile addSubview:getLabel];
    
    [getLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.edges.equalTo(self.imgProfile).with.insets(UIEdgeInsetsMake(0, 0, 0, 0));
    }];
}

#pragma mark - 界面
- (void)createTableView{
    [self addNavBtn:@"提交" isLeft:NO target:self action:@selector(rightBarAction:) bgImageName:nil];
    
    //  关闭自动布局
    self.automaticallyAdjustsScrollViewInsets = NO;
    self.tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT-64) style:UITableViewStyleGrouped];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    self.tableView.sectionFooterHeight = 0.5;
    self.tableView.sectionHeaderHeight = 0.01;
    self.tableView.tableFooterView = [UIView new];
    [self.view addSubview:self.tableView];
    
    //  注册Xib的Cell
    [self.tableView registerNib:[UINib nibWithNibName:@"MY_LLClubsSetCell" bundle:nil] forCellReuseIdentifier:@"MY_LLClubsSetCell"];
    [self.tableView registerNib:[UINib nibWithNibName:@"MY_LLClubsSetDeatilCell" bundle:nil] forCellReuseIdentifier:@"MY_LLClubsSetDeatilCell"];
}

- (void)rightBarAction:(UIButton *)btn {
    
    NSMutableDictionary * dict = [NSMutableDictionary dictionaryWithCapacity:0];
    
    [dict setObject:[self.clubInfoDic objectForKey:@"roomId"] forKey:@"clubId"];
    
    NSCharacterSet *set2 = [NSCharacterSet whitespaceAndNewlineCharacterSet];
    NSString *trimmedString2 = [self.clubname stringByTrimmingCharactersInSet:set2];
    if ([trimmedString2 isEqualToString:@""] || ![trimmedString2 length]) {
        
        [LQProgressHud showMessage:@"俱乐部名称2-8个字"];
        return;
    }else{
        [dict setObject:self.clubname forKey:@"clubName"];
    }
    
    NSCharacterSet *setInfo = [NSCharacterSet whitespaceAndNewlineCharacterSet];
    NSString *trimmedString1 = [self.clubinfo stringByTrimmingCharactersInSet:setInfo];
    if ([trimmedString1 isEqualToString:@""] || ![trimmedString1 length]) {
        
        [LQProgressHud showMessage:@"俱乐部描述1 - 50个字以内"];
        return;
    }else{
        [dict setObject:self.clubinfo forKey:@"info"];
    }
    
//    if (self.imgArray.count>0 && self.imgArray) {
        [self upLoadImageAndNameWith:dict];
//    }else{
//        [self upLoadNameWith:dict];
//    }
   
    
}
- (void)upLoadNameWith:(NSMutableDictionary*)dict{
    [TLHTTPRequest MY_postWithBaseUrl:UpdateClubUrl parameters:dict success:^(NSURLSessionDataTask * _Nonnull task, NSDictionary * _Nonnull data) {
        
        if ([[data objectForKey:@"ret"] integerValue] == 0) {
            
            [LQProgressHud showMessage:@"修改成功 !"];
            dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
                
                [[NSNotificationCenter defaultCenter] postNotificationName:@"updateClubDetailUI" object:nil];
                [[NSNotificationCenter defaultCenter] postNotificationName:@"KNoticationUpdateClubModel" object:dict];
                NSUInteger index=[[self.navigationController viewControllers]indexOfObject:self];
                [self.navigationController popToViewController:[self.navigationController.viewControllers objectAtIndex:index-2]animated:YES];
            });
        }else{
            if ([data objectForKey:@"msg"]) {
                [LQProgressHud showMessage:[data objectForKey:@"msg"]];
                dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
                    
                    [self.navigationController popViewControllerAnimated:YES];
                });
            }
        }
    } failure:^(NSURLSessionDataTask * _Nonnull task, NSError * _Nonnull error) {
        [LQProgressHud showMessage:@"没网怎能忍？"];
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            
            [self.navigationController popViewControllerAnimated:YES];
        });
    }];
}
- (void)upLoadImageAndNameWith:(NSMutableDictionary*)dict{
    [TLHTTPRequest MY_postDataAndImageRequest:UploadFileURL parameters:nil imageDataArr:self.imgArray success:^(NSURLSessionDataTask * _Nonnull task, NSDictionary * _Nonnull data) {
        
        if ([[data objectForKey:@"ret"] integerValue] == 0) {
            NSMutableDictionary* dictFid = [[NSMutableDictionary alloc]init];
            [dict setObject:[[data objectForKey:@"info"]objectForKey:@"fid"] forKey:@"fid"];
            [dict setObject:[[data objectForKey:@"info"]objectForKey:@"furl"] forKey:@"furl"];
            [TLHTTPRequest MY_postWithBaseUrl:UpdateClubUrl parameters:dict success:^(NSURLSessionDataTask * _Nonnull task, NSDictionary * _Nonnull data) {
                
                if ([[data objectForKey:@"ret"] integerValue] == 0) {
                    
                    [LQProgressHud showMessage:@"修改成功 !"];
                    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
                        
                        [[NSNotificationCenter defaultCenter] postNotificationName:@"updateClubDetailUI" object:nil];
                        [[NSNotificationCenter defaultCenter] postNotificationName:@"KNoticationUpdateClubModel" object:dict];
                        NSUInteger index=[[self.navigationController viewControllers]indexOfObject:self];
                        [self.navigationController popToViewController:[self.navigationController.viewControllers objectAtIndex:index-2]animated:YES];
                    });
                }else{
                    if ([data objectForKey:@"msg"]) {
                        [LQProgressHud showMessage:[data objectForKey:@"msg"]];
                        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
                            
                            [self.navigationController popViewControllerAnimated:YES];
                        });
                    }
                }
            } failure:^(NSURLSessionDataTask * _Nonnull task, NSError * _Nonnull error) {
                [LQProgressHud showMessage:@"没网怎能忍？"];
                dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
                    
                    [self.navigationController popViewControllerAnimated:YES];
                });
            }];
        }
    } failure:^(NSURLSessionDataTask * _Nonnull task, NSError * _Nonnull error) {
        [LQProgressHud showMessage:@"修改失败"];
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            
            [self.navigationController popViewControllerAnimated:YES];
        });
    }];
}
- (void)imgvPress:(UITapGestureRecognizer *)tap {
    
    [self usePhonePhotoAndCamera];
}

#pragma mark - tableView代理方法
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 3;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 1;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.section == 2) {
        return 100;
    }
    else {
        return 50;
    }
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString * cellId1 = @"MY_LLClubsSetCell";
    static NSString * cellId2 = @"MY_LLClubsSetDeatilCell";
    
    if (indexPath.section == 2) {
        MY_LLClubsSetDeatilCell * cell = [tableView dequeueReusableCellWithIdentifier:cellId2 forIndexPath:indexPath];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        cell.accessoryType = UITableViewCellAccessoryNone;
        cell.deatilTextView.text = [self.clubInfoDic objectForKey:@"roomInfo"];
        cell.deatilTextView.tag = indexPath.section;
        cell.deatilTextView.delegate = self;
        self.clubinfo = cell.deatilTextView.text;
        return cell;
    }
    else {
        MY_LLClubsSetCell * cell = [tableView dequeueReusableCellWithIdentifier:cellId1 forIndexPath:indexPath];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        if (indexPath.section == 1) {
            cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
            cell.leftLabel.text = @"俱乐部地点";
            cell.rightText.enabled = NO;
            cell.rightText.tag = indexPath.section;
            cell.rightText.delegate = self;
            cell.rightText.textColor = [Utility colorWithHexString:@"#3c3c3c" alpha:1.0f];
            cell.rightText.text = [self.clubInfoDic objectForKey:@"location"];
            self.clublocation = cell.rightText.text;
        }
        else {
            cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
            cell.leftLabel.text = @"俱乐部名称";
            cell.rightText.tag = indexPath.section;
            cell.rightText.delegate = self;
            cell.rightText.textColor = [Utility colorWithHexString:@"#3c3c3c" alpha:1.0f];
            cell.rightText.text = [self.clubInfoDic objectForKey:@"roomName"];
            self.clubname = cell.rightText.text;
        }
        return cell;
    }
}

//- (void)tex:(UITextField *)textField;{
//    if(textField.tag == 0)
//    {
//        self.clubname = textField.text;
//    }else
//    {
//        self.clublocation = textField.text;
//    }
//}

- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string{
    
    if(textField.tag == 0)
    {
        self.clubname = [textField.text stringByReplacingCharactersInRange:range withString:string];
    }else
    {
        self.clublocation = [textField.text stringByReplacingCharactersInRange:range withString:string];
    }
    return YES;
}


-(void)textViewDidChange:(UITextView *)textView
{
    self.clubinfo=textView.text;
}


-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if(indexPath.section == 1)
    {
        
        MY_LLClubsSetCell *cell = [tableView cellForRowAtIndexPath:[NSIndexPath indexPathForRow:indexPath.row inSection:indexPath.section]];
        
        MY_LYLocationViewController * locationVC = [[MY_LYLocationViewController alloc] init];
        locationVC.vcTitle = @"城市";
        locationVC.isHomePage = YES;
        
        __weak typeof(self) wSelf = self;
        
        locationVC.changeLocationBlock = ^(NSString * cityName){
            
            //        CGSize navBtnSize = [Utility stringSizeWithString:cityName textSize:14 width:0 height:18];
            //
            //        CGFloat width = navBtnSize.width;
            //
            //        if (width > 75) {
            //
            //            width = 75;
            //        }
            //        CGRect rect = wSelf.navLeftBtn.frame;
            //
            //        rect.size.width = width + 4;
            //11
            //        wSelf.navLeftBtn.frame = rect;
            
            
            cell.rightText.text = cityName;
            wSelf.clublocation = cityName;
#warning 刷新列表
            //                    [wSelf.tableView.mj_header beginRefreshing];
            
        };
        
        [self.navigationController pushViewController:locationVC animated:YES];
    }
}

#pragma mark - 调用手机相机和相册
- (void)usePhonePhotoAndCamera {
    
    NSMutableArray * arrayPage = [[NSMutableArray alloc] init];
    
    UIAlertAction * act1 = [UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {
    }];
    
    //拍照：
    UIAlertAction * act2 = [UIAlertAction actionWithTitle:@"拍照" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        //打开相机
        _pickPhoto.picker.allowsEditing = YES;
        [_pickPhoto ShowTakePhotoWithController:self withIsEdit:1 andWithBlock:^(NSObject *Data) {
            
            [arrayPage addObject:UIImageJPEGRepresentation((UIImage *)Data, 0.7)];
            
            if (self.imgArray.count) {
                [self.imgArray removeAllObjects];
            }
            [self.imgArray addObjectsFromArray:arrayPage];
            [self.imgProfile setImage:(UIImage *)Data];
        }];
    }];
    //相册
    UIAlertAction * act3 = [UIAlertAction actionWithTitle:@"相册" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        //打开相册
        _pickPhoto.picker.allowsEditing = YES;
        
        [_pickPhoto SHowLocalPhotoWithController:self withIsEdit:1 andWithBlock:^(NSObject *Data) {
            
            [arrayPage addObject:UIImageJPEGRepresentation((UIImage *)Data, 0.7)];
            
            if (self.imgArray.count) {
                [self.imgArray removeAllObjects];
            }
            [self.imgArray addObjectsFromArray:arrayPage];
            [self.imgProfile setImage:(UIImage *)Data];
        }];
    }];
    
    UIAlertController * aleVC = [UIAlertController alertControllerWithTitle:@"提示" message:@"选择图片" preferredStyle:UIAlertControllerStyleActionSheet];
    [aleVC addAction:act1];
    [aleVC addAction:act2];
    [aleVC addAction:act3];
    [self presentViewController:aleVC animated:YES completion:nil];
}


//  上传俱乐部头像
- (void)uploadingHeadIconWithArray:(NSArray *)headArr {
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark --数据源初始化
- (NSMutableArray *)imgArray{
    if (!_imgArray) {
        _imgArray = [[NSMutableArray alloc] init];
    }
    return _imgArray;
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

