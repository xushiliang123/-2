//
//  MyViewController.m
//  TogetherLu
//
//  Created by Louie on 16/12/15.
//  Copyright © 2016年 TogetherLu. All rights reserved.
//

#import "MY_TTLEditInfoViewController.h"
#import "MY_TTLEditMateritalTableViewCell.h"
#import "SXPickPhoto.h"
#import "MY_TTLHeadIconTableViewCell.h"
static CGFloat kHEIGHT  = 298.0;
#import "CounterMarkViewController.h"
#import "MY_LYPersonInfoModel.h"
#import "MY_LLDBManager.h"
#import "MY_LYMessageInfoModel.h"
#import "MY_GLSheetView.h"

@interface MY_TTLEditInfoViewController ()<UITableViewDelegate,UITableViewDataSource,UITextFieldDelegate>
{
    //picker所需
    NSArray * _dates;
    NSIndexPath* _selectCell;
    NSString* _strAge, * _strName, *_strHeight;//年龄和姓名,身高
    
    NSString* _strTag;      //获取的标签字符串
    NSString* _strMark;     //选择的标签字符串
    CGFloat   _markHeight;  //标签的行高
    MY_GLSheetView * sheetView;
}
@property (nonatomic, strong) UIImageView * topImageView;
@property (nonatomic, strong) UITableView *myTableView;
@property (nonatomic, strong) UIImageView *imgProfile;//图

@property (strong, nonatomic) NSArray* arrayDetail;
@property (strong, nonatomic) NSArray* arrayTitle;
@property (strong, nonatomic) NSMutableArray*      stateArray;//存放状态图标的下标（标记显示第几个图标）

@property (strong, nonatomic) NSMutableDictionary* dictData;
@property (strong, nonatomic) SXPickPhoto* pickPhoto;//相册类
@property (strong, nonatomic) NSMutableArray* arrayPage;//图片数组
@end

@implementation MY_TTLEditInfoViewController

- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    
    
//    if (![Utility isBlankString:UserObject(@"userMark")]) {
//        _strMark = UserObject(@"userMark");
//        _markHeight = [Utility textHeightFromTextString:_strMark width:243 fontSize:15];
//        if (_markHeight < 26) {
//            _markHeight = 26;
//        }
//        [self.myTableView reloadData];
//    }
//    else{
//        if (![Utility isBlankString:str]) {
//            NSData *data  = [str dataUsingEncoding:NSUTF8StringEncoding];
//            NSArray * arr = [NSJSONSerialization JSONObjectWithData:data options:NSUTF8StringEncoding error:nil];
//            for (NSDictionary* dictData in arr) {
//                if ([dictData objectForKey:@"userTagList"]) {
//                    NSMutableArray* arrList = [dictData objectForKey:@"userTagList"];
//                    for (int i = 0; i < arrList.count; i ++) {
//                        NSString* strTag1 = arrList[i];
//                        if ([Utility isBlankString:_strTag]) {
//                            _strTag = [NSString stringWithFormat:@"%@",strTag1];
//                        }
//                        else{
//                            _strTag = [_strTag stringByAppendingFormat:@"/%@",strTag1];
//                        }
//                    }
//                }
//            }
//            _markHeight = [Utility textHeightFromTextString:_strTag width:243 fontSize:15];
//            if (_markHeight < 26) {
//                _markHeight = 26;
//            }
//        }
//    }
}
-(void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    
    NSLog(@"%@",self.model);
    
    
    self.myTableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT) style:UITableViewStylePlain];
    if (SCREEN_WIDTH == 320) {
        self.myTableView.frame = CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT);
    }
    //        [self.myTableView registerClass:[MyCenterTableViewCell class] forCellReuseIdentifier:@"MyCenterTableViewCell"];
    self.myTableView.delegate = self;
    self.myTableView.dataSource = self;
    self.myTableView.tableFooterView = [UIView new];
    self.myTableView.scrollEnabled = YES;
    [self.myTableView setSeparatorColor:[Utility colorWithHexString:@"efefef" alpha:1]];
    //        self.myTableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    [self.view addSubview:self.myTableView];
    self.myTableView.backgroundColor = [Utility colorWithHexString:@"f8f8f8" alpha:1];
    //        [self.myTableView addSubview:self.imgProfile];
    //        [self imageUIConfig];
    self.myTableView.tableFooterView = [UIView new];
    
    
    UIView* view = [[UIView alloc]initWithFrame:CGRectMake(0, 0, 0, 0)];
    self.title = @"编辑资料";
    [self.view addSubview:view];
    //    self.navigationController.navigationBarHidden = NO;
    _pickPhoto = [[SXPickPhoto alloc]init];
    //  设置UI
    [self createUI];
    _markHeight = 26;
    
    self.arrayTitle = @[@[@"头像"],@[@"昵称",@"年龄",@"身高"],@[@"标签"]];
    self.arrayDetail = @[@[@""],@[@"请输入姓名",@"请输入年龄",@"请输入身高，单位厘米"],@[@"请选择标签"]];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(hideImagePicker) name:@"hideImagePicker" object:nil];
    
    [self.dictData setObject:self.model.nickName forKey:@"nickName"];
    [self.dictData setObject:self.model.age forKey:@"age"];
    [self.dictData setObject:self.model.height forKey:@"height"];
    [self.dictData setObject:self.model.userTag forKey:@"userTag"];
    
}

//  当实时通话时，关闭UIImagePickerController
- (void)hideImagePicker
{
    if (_pickPhoto.picker && [EaseSDKHelper shareHelper].isShowingimagePicker) {
        [_pickPhoto.picker dismissViewControllerAnimated:NO completion:nil];
    }
}

- (void)dealloc {
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}
- (instancetype)init{
    
    if (self == [super init]) {
        
        
//        if ([self.myTableView respondsToSelector:@selector(setSeparatorInset:)]) {
//            [self.myTableView setSeparatorInset:UIEdgeInsetsMake(0,0,0,0)];
//        }
//        
//        if ([self.myTableView respondsToSelector:@selector(setLayoutMargins:)]) {
//            [self.myTableView setLayoutMargins:UIEdgeInsetsMake(0,0,0,0)];
//        }
        
    }
    
    return self;
}

#pragma mark - 调用手机相机和相册
- (void)usePhonePhotoAndCamera {

    if (!sheetView) {
        CGRect rect = self.view.bounds;
        rect.origin.y = SCREEN_HEIGHT;
        __weak typeof(self) weakSelf = self;
        sheetView = [[MY_GLSheetView alloc]initWithFrame:rect];
        sheetView.ShowPhotoLibraryBlock = ^(NSInteger index) {
            //  1 拍照 2 相册
            if (1 == index) {
                //打开相机
                _pickPhoto.picker.allowsEditing = YES;
                [_pickPhoto ShowTakePhotoWithController:self withIsEdit:1 andWithBlock:^(NSObject *Data) {
                    if (_arrayPage.count != 0) {
                        [_arrayPage removeAllObjects];
                    }
                    _arrayPage = [NSMutableArray arrayWithObject:UIImageJPEGRepresentation((UIImage *)Data, 0.7)];
                    //            [_btnImage setBackgroundImage:[UIImage imageWithData:_arrayPage[0]] forState:UIControlStateNormal];
                    
                    //            [self imageArray:_arrayPage withIsViedo:0];
                    [self imageArray:_arrayPage];
                    NSIndexPath *indexPath=[NSIndexPath indexPathForRow:0 inSection:0];
                    [self.myTableView reloadRowsAtIndexPaths:[NSArray arrayWithObjects:indexPath,nil] withRowAnimation:UITableViewRowAnimationNone];
                }];
                
            }else if (2 == index){
                //打开相册
                [weakSelf pushImagePickerController];
            }
        };
        
        UIWindow * window = [UIApplication sharedApplication].keyWindow;
        [window addSubview:sheetView];
    }
    
    if (![sheetView superview]) {
        
        CGRect rect = self.view.bounds;
        rect.origin.y = SCREEN_HEIGHT;
        sheetView.frame = rect;
        UIWindow * window = [UIApplication sharedApplication].keyWindow;
        [window addSubview:sheetView];
    }
    
    if (sheetView.frame.origin.y == SCREEN_HEIGHT) {
        
        CGRect rect = sheetView.frame;
        rect.origin.y = 0;
        
        [UIView animateWithDuration:0.25 animations:^{
            
            sheetView.frame = rect;
            
        } completion:^(BOOL finished) {
            
        }];
    }
    
}
#pragma mark - TZImagePickerController

- (void)pushImagePickerController {
    _pickPhoto.picker.allowsEditing = YES;
    [_pickPhoto SHowLocalPhotoWithController:self withIsEdit:1 andWithBlock:^(NSObject *Data) {
        if (_arrayPage.count != 0) {
            [_arrayPage removeAllObjects];
        }
        _arrayPage = [NSMutableArray arrayWithObject:UIImageJPEGRepresentation((UIImage *)Data, 0.7)];
        //            [_btnImage setBackgroundImage:[UIImage imageWithData:_arrayPage[0]] forState:UIControlStateNormal];
        
        //            [self imageArray:_arrayPage withIsViedo:0];
        [self imageArray:_arrayPage];
        
        
        NSIndexPath *indexPath=[NSIndexPath indexPathForRow:0 inSection:0];
        [self.myTableView reloadRowsAtIndexPaths:[NSArray arrayWithObjects:indexPath,nil] withRowAnimation:UITableViewRowAnimationNone];
    }];
}

-(void)imageArray:(NSMutableArray *)array
{
  
    
    [TLHTTPRequest MY_postDataAndImageRequest:UploadFileURL parameters:nil imageDataArr:array success:^(NSURLSessionDataTask * _Nonnull task, NSDictionary * _Nonnull data) {
        if ([[data objectForKey:@"ret"] integerValue] == 0) {
            NSMutableDictionary* dictFid = [[NSMutableDictionary alloc]init];
            [dictFid setObject:[[data objectForKey:@"info"]objectForKey:@"fid"] forKey:@"fid"];
            
//            NSString * where = [NSString stringWithFormat:@"userId = %@", USERID];
//            [[MY_LLDBManager sharedManager] selectClass:[MY_LLPersonInfoModel class] withWhere:where responseBlock:^(NSArray *dataArray) {
//                if ([dataArray.firstObject isKindOfClass:[MY_LLPersonInfoModel class]]) {
//                    MY_LLPersonInfoModel * model = dataArray.firstObject;
//                    model.headIcon = [[data objectForKey:@"info"]objectForKey:@"fid"];
//                    [[MY_LLDBManager sharedManager] updateModel:model withWhere:where];
//                }
//            }];
            NSString * where = [NSString stringWithFormat:@"userId = %td",[USERID integerValue]];
            NSArray *arry = [[MY_LLDBManager sharedManager] selectClass:[MY_LYPersonInfoModel class] withWhere:where];
            MY_LYPersonInfoModel *uModel = arry.firstObject;
            
//            MY_LLPersonInfoModel * uModel = [[MessageInfoModel sharedManager] loadPersonModelWithID: [USERID integerValue]];
            uModel.headIcon = [[data objectForKey:@"info"]objectForKey:@"fid"];
//            [[MessageInfoModel sharedManager] insertModelWith:uModel];
            [[MY_LLDBManager sharedManager] updateModel:uModel withWhere:where];
            [TLHTTPRequest MY_postWithBaseUrl:EditInfoUrl parameters:dictFid success:^(NSURLSessionDataTask * _Nonnull task, NSDictionary * _Nonnull data) {
                
                if ([data objectForKey:@"msg"]) {
                    
                    [LQProgressHud showMessage:[data objectForKey:@"msg"]];
                }
                
            } failure:^(NSURLSessionDataTask * _Nonnull task, NSError * _Nonnull error) {
                [LQProgressHud showMessage:@"发布失败"];
            }];
        }
        else{
            if ([data objectForKey:@"msg"]) {
                [LQProgressHud showMessage:[data objectForKey:@"msg"]];
            }
        }
    } failure:^(NSURLSessionDataTask * _Nonnull task, NSError * _Nonnull error) {
        [LQProgressHud showMessage:@"发布失败"];
    }];
}


#pragma mark - UI相关
- (void)createUI{
    
    [self addNavBtn:@"保存" isLeft:NO target:self action:@selector(rightBarButtonTarget) bgImageName:nil];
    //    [self addNavBtn:nil isLeft:YES target:self action:@selector(leftBarButtonTarget) bgImageName:@"backWhite"];
    self.navigationItem.leftBarButtonItem.tintColor = [Utility colorWithHexString:@"333333" alpha:1];
    
}


- (void)rightBarButtonTarget{
    [self.view endEditing:YES];
    //    [self.dictData setObject:USERKEY forKey:@"key"];
    
    if (![Utility isBlankString:_strAge]) {
        if (![Utility isPureNumandCharacters:_strAge]) {
            [LQProgressHud showMessage:@"请填写纯数字"];
            return;
        }
        if ([_strAge integerValue] < 20 || [_strAge integerValue] > 60) {
            [LQProgressHud showMessage:@"年龄范围为20~60"];
            return;
        }
        [self.dictData setObject:_strAge forKey:@"age"];
    }
    if (_strName.length > 8) {
        [LQProgressHud showMessage:@"昵称不得超过8个字"];
        return;
    }
    else{
        if (![Utility isBlankString:_strName]) {
            NSRange _range = [_strName rangeOfString:@" "];
            if (_range.location != NSNotFound) {
                //有空格
                [LQProgressHud showMessage:@"昵称不能有空格"];
                return;
            }else {
                //没有空格
                [self.dictData setObject:_strName forKey:@"nickName"];
            }
        }
        else{
            if (_strName != nil) {
                NSRange _range = [_strName rangeOfString:@" "];
                if (_range.location != NSNotFound) {
                    //有空格
                    [LQProgressHud showMessage:@"昵称不能有空格"];
                    return;
                }
            }
        }
    }
    if (![Utility isBlankString:_strHeight]) {
        if (![Utility isPureNumandCharacters:_strHeight]) {
            [LQProgressHud showMessage:@"请填写纯数字"];
            return;
        }
        if ([_strHeight integerValue] < 150 || [_strHeight integerValue] > 200) {
            [LQProgressHud showMessage:@"身高范围为150cm~200cm"];
            return;
        }
        [self.dictData setObject:_strHeight forKey:@"height"];
    }
    [LQProgressHud showLoading:nil];
    __weak typeof(self)WeakSelf = self;
    if (self.dictData.count > 0) {
        [TLHTTPRequest MY_postWithBaseUrl:EditInfoUrl parameters:self.dictData success:^(NSURLSessionDataTask * _Nonnull task, NSDictionary * _Nonnull data) {
            if ([[data objectForKey:@"ret"] boolValue] == 0) {
                if (WeakSelf.dictData[@"nickName"]) {
                    
                     [[EMClient sharedClient] setApnsNickname:WeakSelf.dictData[@"nickName"]];
                }
                [self updateUserInfoMethod:self.dictData];
                [LQProgressHud hide];
                [self.navigationController popViewControllerAnimated:YES];
            }
            else
            {
                if ([data objectForKey:@"msg"]) {
                    [LQProgressHud showMessage:[data objectForKey:@"msg"]];
                }
            }
            
        } failure:^(NSURLSessionDataTask * _Nonnull task, NSError * _Nonnull error) {
            [LQProgressHud showMessage:@"上传失败"];
        }];
    }
    else{
        [self.navigationController popViewControllerAnimated:YES];
    }
    
}
-(void)updateUserInfoMethod:(NSDictionary *)dataDict{
    NSString * where = [NSString stringWithFormat:@"userId = %td",[USERID integerValue]];
    NSArray *arry = [[MY_LLDBManager sharedManager] selectClass:[MY_LYPersonInfoModel class] withWhere:where];
    MY_LYPersonInfoModel *uModel = arry.firstObject;
//    MY_LLPersonInfoModel * uModel = [[MessageInfoModel sharedManager] loadPersonModelWithID: [USERID integerValue]];
    if (dataDict[@"nickName"]) {
        uModel.nickName = dataDict[@"nickName"];
    }
    NSString *hstr = dataDict[@"height"];
    if (hstr) {
        uModel.height = hstr.integerValue;
    }
    if (dataDict[@"age"]) {
        uModel.age = [dataDict[@"age"] integerValue];
    }
//    [[MessageInfoModel sharedManager] insertModelWith:uModel];
    [[MY_LLDBManager sharedManager] updateModel:uModel withWhere:where];
    
//    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
//
//        NSString * where = [NSString stringWithFormat:@"userId = %@", USERID];
//
//        [[MY_LLDBManager sharedManager] selectClass:[MY_LLPersonInfoModel class] withWhere:where responseBlock:^(NSArray *dataArray) {
//
//            if ([dataArray.firstObject isKindOfClass:[MY_LLPersonInfoModel class]]) {
//                MY_LLPersonInfoModel * model = dataArray.firstObject;
//                if (dataDict[@"nickName"]) {
//                     model.nickName = dataDict[@"nickName"];
//                }
//                NSString *hstr = dataDict[@"height"];
//                if (hstr) {
//                     model.height = hstr.integerValue;
//                }
//                if (dataDict[@"age"]) {
//                     model.age = [dataDict[@"age"] integerValue];
//                }
//                [[MY_LLDBManager sharedManager] updateModel:model withWhere:where];
//            }
//        }];
//    });
    
    
}
//#pragma mark - Table View Delegate
//- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
//    //    [self updateImg];
//    CGPoint point = scrollView.contentOffset;
//    if (point.y < -kHEIGHT) {
//        CGRect rect = [self.myTableView viewWithTag:1011].frame;
//        rect.origin.y = point.y;
//        rect.size.height = -point.y;
//        [self.myTableView viewWithTag:1011].frame = rect;
//    }
//}

#pragma mark - 代理相关
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 3;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return indexPath.section == 0 ? 60 : (indexPath.section == 2 ? 22 + _markHeight : 49);
}

-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 15;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    //    return section == 1 ? 6 : 1;
    return section == 1 ? 3 : 1;
}


//
//-(void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath
//{
//    if ([cell respondsToSelector:@selector(setSeparatorInset:)]) {
//        [cell setSeparatorInset:UIEdgeInsetsZero];
//    }
//    
//    if ([cell respondsToSelector:@selector(setLayoutMargins:)]) {
//        [cell setLayoutMargins:UIEdgeInsetsZero];
//    }
//}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section == 0) {
        static NSString *CellID = @"MY_TTLHeadIconTableViewCell";
        MY_TTLHeadIconTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellID];
        if (cell == nil) {
            cell = [[[NSBundle mainBundle]loadNibNamed:@"MY_TTLHeadIconTableViewCell" owner:self options:nil] lastObject];
        }
        cell.titleLabel.text = self.arrayTitle[indexPath.section][indexPath.row];
        cell.titleLabel.font = [UIFont systemFontOfSize:14];
        cell.titleLabel.textColor = [Utility colorWithHexString:@"333333" alpha:1];
        
        if (_arrayPage == nil) {
            [cell.iconImage sd_setImageWithURL:[NSURL URLWithString:_model.headIcon] placeholderImage:[UIImage imageNamed:@"占位图"] options:SDWebImageAllowInvalidSSLCertificates];
        }
        else{
            cell.iconImage.image = [UIImage imageWithData:_arrayPage[0]];
        }
        return cell;
    }
    else{
        static NSString *CellID = @"MY_TTLEditMateritalTableViewCell";
        MY_TTLEditMateritalTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellID];
        if (cell == nil) {
            cell = [[[NSBundle mainBundle]loadNibNamed:@"MY_TTLEditMateritalTableViewCell" owner:self options:nil] lastObject];
        }
        cell.titleLabel.text = self.arrayTitle[indexPath.section][indexPath.row];
        cell.titleLabel.font = [UIFont systemFontOfSize:14];
        cell.titleLabel.textColor = [Utility colorWithHexString:@"333333" alpha:1];
        cell.textField.textColor = [Utility colorWithHexString:@"333333" alpha:1];
        if (indexPath.row == 3) {
            cell.textField.hidden = YES;
            cell.detailLabel.hidden  = NO;
            cell.textField.delegate = nil;
            cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
        }
        else{
            cell.textField.hidden = NO;
            if (indexPath.section == 1) {
                cell.textField.tag = 1001 + indexPath.row;
            }
            else{
                cell.textField.tag = 2001;
            }
            cell.textField.delegate = self;
            cell.detailLabel.hidden  = YES;
        }
        cell.textField.textAlignment = NSTextAlignmentRight;
        NSMutableAttributedString *placeholder = [[NSMutableAttributedString alloc]initWithString:self.arrayDetail[indexPath.section][indexPath.row]];
        [placeholder addAttribute:NSForegroundColorAttributeName value:[Utility colorWithHexString:@"999999" alpha:1] range:NSMakeRange(0, [self.arrayDetail[indexPath.section][indexPath.row] length])];
        [placeholder addAttribute:NSFontAttributeName value:[UIFont systemFontOfSize:14] range:NSMakeRange(0, [self.arrayDetail[indexPath.section][indexPath.row] length])];
        cell.detailLabel.text = self.arrayDetail[indexPath.section][indexPath.row];
        cell.detailLabel.textAlignment = NSTextAlignmentRight;
        cell.detailLabel.textColor = [Utility colorWithHexString:@"999999" alpha:1];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        
        if (indexPath.section == 1) {
            cell.textField.userInteractionEnabled = YES;
            switch (indexPath.row) {
                case 0:
                {
                    //姓名
                    if (![Utility isBlankString:_strName]) {
                        cell.textField.text = _strName;
                        cell.textField.textColor = [Utility colorWithHexString:@"333333" alpha:1];
                    } else{
                        if (![Utility isBlankString:_model.nickName]) {
                            NSMutableAttributedString *placeholder1 = [[NSMutableAttributedString alloc]initWithString:_model.nickName];
                            [placeholder1 addAttribute:NSForegroundColorAttributeName value:[Utility colorWithHexString:@"999999" alpha:1] range:NSMakeRange(0, _model.nickName.length)];
                            [placeholder1 addAttribute:NSFontAttributeName value:[UIFont systemFontOfSize:14] range:NSMakeRange(0, _model.nickName.length)];
                            cell.textField.attributedPlaceholder = placeholder1;
                        }
                        else{
                            cell.textField.attributedPlaceholder = placeholder;
                        }
                    }
                    break;
                }
                case 1:
                {
                    //年龄
                    if (![Utility isBlankString:_strAge]) {
                        cell.textField.text = _strAge;
                        cell.textField.textColor = [Utility colorWithHexString:@"333333" alpha:1];
                    }
                    else{
                        if (_model.age != nil) {
                            NSMutableAttributedString *placeholder1 = [[NSMutableAttributedString alloc]initWithString:[NSString stringWithFormat:@"%@",_model.age]];
                            [placeholder1 addAttribute:NSForegroundColorAttributeName value:[Utility colorWithHexString:@"999999" alpha:1] range:NSMakeRange(0, [NSString stringWithFormat:@"%@",_model.age].length)];
                            [placeholder1 addAttribute:NSFontAttributeName value:[UIFont systemFontOfSize:14] range:NSMakeRange(0, [NSString stringWithFormat:@"%@",_model.age].length)];
                            cell.textField.attributedPlaceholder = placeholder1;
                        }
                        else{
                            cell.textField.attributedPlaceholder = placeholder;
                        }
                    }
                    cell.textField.keyboardType = UIKeyboardTypeNumberPad;
                    
                    break;
                }
                case 2:
                {
                    //身高
                    if (![Utility isBlankString:_strHeight]) {
                        cell.textField.text = _strHeight;
                        cell.textField.textColor = [Utility colorWithHexString:@"333333" alpha:1];
                    }
                    else{
                        if (_model.height != nil) {
                            NSMutableAttributedString *placeholder1 = [[NSMutableAttributedString alloc]initWithString:[NSString stringWithFormat:@"%@",_model.height]];
                            [placeholder1 addAttribute:NSForegroundColorAttributeName value:[Utility colorWithHexString:@"999999" alpha:1] range:NSMakeRange(0, [NSString stringWithFormat:@"%@",_model.height].length)];
                            [placeholder1 addAttribute:NSFontAttributeName value:[UIFont systemFontOfSize:14] range:NSMakeRange(0, [NSString stringWithFormat:@"%@",_model.height].length)];
                            cell.textField.attributedPlaceholder = placeholder1;
                        }
                        else{
                            cell.textField.attributedPlaceholder = placeholder;
                        }
                    }
                    cell.textField.keyboardType = UIKeyboardTypeNumberPad;
                    
                    break;
                }
                
                default:
                    break;
            }
        }
        else{
            cell.textField.hidden = YES;
            cell.detailLabel.hidden = NO;
            
            //            NSString* strInter = [self.dictData objectForKey:@"interest"];
            if (![Utility isBlankString:_strMark]) {
                cell.detailLabel.text = _strMark;
                cell.detailLabel.textColor = [Utility colorWithHexString:@"333333" alpha:1];
            }
            else{
                
                //标签
                if (![Utility isBlankString:_strTag]) {
                    
                    cell.detailLabel.text = _strTag;
                }
                else{
                    if (![Utility isBlankString:_model.userTag]) {
                        cell.detailLabel.text = _model.userTag;
                    }
                    else{
                        cell.detailLabel.textColor = [Utility colorWithHexString:@"999999" alpha:1];
                        cell.detailLabel.text = self.arrayDetail[indexPath.section][indexPath.row];
                    }
                }
                
            }
            cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
            cell.textField.userInteractionEnabled = NO;
        }
        return cell;
    }
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section == 0) {
        [self usePhonePhotoAndCamera];
        [tableView deselectRowAtIndexPath:indexPath animated:YES];
    }
    else if (indexPath.section == 1){
    }
    else{
        CounterMarkViewController * controller = [[CounterMarkViewController alloc]init];
        __weak typeof (self) weakSelf = self;
        controller.counterMarkBlock = ^(NSString *str){
            _strTag = str;
            NSIndexSet *indexSet=[[NSIndexSet alloc]initWithIndex:2];
            [weakSelf.myTableView reloadSections:indexSet withRowAnimation:UITableViewRowAnimationAutomatic];
        };
        [self.navigationController pushViewController:controller animated:YES];
    }
    
}


- (void)textFieldDidEndEditing:(UITextField *)textField
{
    NSInteger indexTag = textField.tag - 1001;
    //返回一个BOOL值，指定是否循序文本字段开始编辑
    switch (indexTag) {
        case 0:
        {
            _strName = textField.text;
            break;
        }
        case 1:
        {
            _strAge = textField.text;
            break;
        }
        case 2:
        {
            _strHeight = textField.text;
            break;
        }
    
        default:
            break;
    }
}

-(BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string
{
    //    NSLog(@"%@",textField.text);
    return YES;
}


-(NSMutableArray *)stateArray
{
    if (!_stateArray) {
        _stateArray = [[NSMutableArray alloc]init];
    }
    return _stateArray;
}
-(NSMutableArray* )arrayPage
{
    if (!_arrayPage) {
        _arrayPage = [[NSMutableArray alloc]init];
        
    }
    return _arrayPage;
}
-(NSMutableDictionary *)dictData
{
    if (!_dictData) {
        _dictData = [[NSMutableDictionary alloc]init];
    }
    return _dictData;
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
