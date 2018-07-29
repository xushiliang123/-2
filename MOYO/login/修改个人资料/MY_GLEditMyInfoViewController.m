//
//  MY_GLEditMyInfoViewController.m
//  VTIME
//
//  Created by gll on 2017/9/9.
//  Copyright © 2017年 MadridLee. All rights reserved.
//

#import "MY_GLEditMyInfoViewController.h"
#import "MY_GLSheetView.h"
#import "SXPickPhoto.h"
#import "CounterMarkViewController.h"
#import "MY_LYMessageInfoModel.h"
//  登录
#import "MY_LYLoginViewController.h"

//  引导页
#import "MY_XTGuideViewController.h"

@interface MY_GLEditMyInfoViewController ()
<UITextFieldDelegate,UIPickerViewDelegate,
UIPickerViewDataSource>
{
    NSString* strAge, * _strName,*_hightV;//年龄和姓名
    NSInteger _lastSex;
    UIAlertController * alertController;
    
    NSMutableArray * _ageArray;
    NSMutableArray * _statureArray;
    
    MY_GLSheetView * sheetView;
    
    NSString * imgfid;
    NSString * headIcon;
    
    
}
@property (strong, nonatomic) SXPickPhoto* pickPhoto;//相册类
@property (weak, nonatomic) IBOutlet UIButton *manBtn;


@end

@implementation MY_GLEditMyInfoViewController

-(BOOL)hidesBottomBarWhenPushed{
    return YES;
}

-(void)back
{
    for (UIViewController * vc in self.navigationController.viewControllers) {
        //                    去首页
        if ([vc isKindOfClass:[MY_XTGuideViewController class]]) {
            MY_LYLoginViewController *loginControl = [[MY_LYLoginViewController alloc]init];
            [self.navigationController pushViewController:loginControl animated:YES];
            return;
        }
    }
    
    
    [self.navigationController popViewControllerAnimated:YES];
}

-(void)backClick{
    
    //    tabbar present 过来
    
    //  返回跳转登录
    //    for (UIViewController * vc in self.navigationController.viewControllers) {
    //        //                    去首页
    //        if ([vc isKindOfClass:[MY_TTLLoginViewController class]]) {
    //
    //            [self.navigationController popToViewController:vc animated:YES];
    //            return;
    //        }
    //    }
    
    //    if (!self.navigationController) {
    //
    for (UIViewController * vc in self.navigationController.viewControllers) {
        //                    去首页
        if ([vc isKindOfClass:[MY_XTGuideViewController class]] || [vc isKindOfClass:[MY_LYLoginViewController class]]) {
            
            [self dismissViewControllerAnimated:NO completion:^{
                 [[NSNotificationCenter defaultCenter]postNotificationName:@"KNoticaationRequestLocation" object:nil];
                [[NSNotificationCenter defaultCenter]postNotificationName:KNoticationDaiyan object:nil];
            }];
            return;
        }
    }
    
    
    //    }
    
    
    //    else if([vc isKindOfClass:[MY_GLEditMyInfoViewController class]]){
    
    //    MY_TTLLoginViewController *loginControl = [[MY_TTLLoginViewController alloc]init];
    //    [self.navigationController pushViewController:loginControl animated:YES];
    
}


- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor blackColor];
    
    [self addNavBtn:nil isLeft:YES target:self action:@selector(back) bgImageName:@"editInfo_backButton"];
    
    _ageArray = [NSMutableArray arrayWithCapacity:0];
    _statureArray = [NSMutableArray arrayWithCapacity:0];
    self.dictData = [NSMutableDictionary dictionaryWithCapacity:0];
    
    self.nickNametextfield.delegate = self;
    
    self.manBtn.selected = YES;
    _lastSex = 1;
    
    self.agePickerView.delegate = self;
    self.agePickerView.dataSource = self;
    
    self.staturePickerView.dataSource = self;
    self.staturePickerView.delegate = self;
    
    
    for (NSInteger i = 20; i < 61; i++) {
        
        [_ageArray addObject:[NSString stringWithFormat:@"%ld",(long)i]];
        
    }
    
    for (NSInteger t = 150; t < 201; t++) {
        
        [_statureArray addObject:[NSString stringWithFormat:@"%ld",(long)t]];
        
    }
    
    self.agePickerView.showsSelectionIndicator = NO;
    self.staturePickerView.showsSelectionIndicator = NO;
    
    [self.agePickerView selectRow:0 inComponent:0 animated:NO];
    [self.staturePickerView selectRow:20 inComponent:0 animated:NO];
    
    [self.agePickerView reloadAllComponents];
    [self.staturePickerView reloadAllComponents];
    
    self.headImgButton.showsTouchWhenHighlighted = YES;
    
    _pickPhoto = [[SXPickPhoto alloc]init];
    [self addNavBtn:@"" isLeft:YES target:nil action:nil bgImageName:@""];
    [self.navigationController.navigationItem setHidesBackButton:YES];
}

- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    
    [UIApplication sharedApplication].statusBarStyle = UIStatusBarStyleLightContent;
    
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
- (void)viewDidAppear:(BOOL)animated{
    [super viewDidAppear:animated];
    // 禁用返回手势
    if ([self.navigationController respondsToSelector:@selector(interactivePopGestureRecognizer)]) {
        self.navigationController.interactivePopGestureRecognizer.enabled = NO;
    }
}
#pragma mark -- 点击头像 修改图片 调用手机相机和相册

- (IBAction)selectHearderPicker:(UIButton *)sender {
    
    [self.view endEditing:YES];
    if (!sheetView) {
        CGRect rect = self.view.bounds;
        rect.origin.y = SCREEN_HEIGHT;
        __weak typeof(self) weakSelf = self;
        sheetView = [[MY_GLSheetView alloc]initWithFrame:rect];
        sheetView.ShowPhotoLibraryBlock = ^(NSInteger index) {
            //  1 拍照 2 相册
            if (1 == index) {
                
                //打开相机
                weakSelf.pickPhoto.picker.allowsEditing = YES;
                [weakSelf.pickPhoto ShowTakePhotoWithController:weakSelf withIsEdit:1 andWithBlock:^(NSObject *Data) {
                    if (weakSelf.arrayPage.count != 0) {
                        [weakSelf.arrayPage removeAllObjects];
                    }
                    _arrayPage = [NSMutableArray arrayWithObject:UIImageJPEGRepresentation((UIImage *)Data, 0.5)];
                    //            [_btnImage setBackgroundImage:[UIImage imageWithData:_arrayPage[0]] forState:UIControlStateNormal];
                    
                    [weakSelf.headImgButton setImage:(UIImage *)Data forState:(UIControlStateNormal)];
                    
                    [weakSelf imageArray:weakSelf.arrayPage];
                }];
                
            }else if (2 == index){
                
                //打开相册
                weakSelf.pickPhoto.picker.allowsEditing = YES;
                [weakSelf.pickPhoto SHowLocalPhotoWithController:weakSelf withIsEdit:1 andWithBlock:^(NSObject *Data) {
                    if (weakSelf.arrayPage.count != 0) {
                        [weakSelf.arrayPage removeAllObjects];
                    }
                    _arrayPage = [NSMutableArray arrayWithObject:UIImageJPEGRepresentation((UIImage *)Data, 0.5)];
                    //            [_btnImage setBackgroundImage:[UIImage imageWithData:_arrayPage[0]] forState:UIControlStateNormal];
                    
                    //            [self imageArray:_arrayPage withIsViedo:0];
                    [weakSelf imageArray:weakSelf.arrayPage];
                    
                    //            UIImage * img = [UIImage imageWithData:(NSData*)Data];
                    
                    [weakSelf.headImgButton setImage:(UIImage *)Data forState:(UIControlStateNormal)];
                }];
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


#pragma mark -   下一步
- (IBAction)commitBtnClickMethod:(UIButton *)sender {
    
//    [self backClick];
        [self editInfoButtonTarget];
}

#pragma mark -   选择性别
- (IBAction)selectSexMethod:(UIButton *)sender {
    //    0 女 1男
    
    if(sender.tag - 200 == _lastSex){
        return;
    }
    UIButton * btn = [self.view viewWithTag:_lastSex+200];
    btn.selected = NO;
    
    
    UIButton * selectBtn = [self.view viewWithTag:sender.tag];
    selectBtn.selected = YES;
    
    _lastSex = sender.tag - 200;
    
}

- (void)editInfoButtonTarget{
    [self.view endEditing:YES];
    
    _strName = self.nickNametextfield.text;
    
    
    //    if 输入框不是空 长度不为0 则发送
    NSCharacterSet *set2 = [NSCharacterSet whitespaceAndNewlineCharacterSet];
    NSString *trimmedString2 = [_strName stringByTrimmingCharactersInSet:set2];
    
    if ([trimmedString2 isEqualToString:@""] || !_strName) {
        
        //  记住账号
        if (USERID) {
            
            //            MY_LLPersonInfoModel *userModel = [[MessageInfoModel sharedManager] loadPersonModelWithID:[USERID integerValue]];
            //            NSString * phoneNum = [NSString stringWithFormat:@"%ld",userModel.mobileNum];
            
            //            phoneNum = [phoneNum substringFromIndex:7];
            //            _strName = [NSString stringWithFormat:@"用户%@",phoneNum];
            
            
            //            NSString *where = [NSString stringWithFormat:@"userId = %td", [USERID integerValue]];
            //            [[MY_LLDBManager sharedManager] selectClass:[MY_LLPersonInfoModel class] withWhere:where responseBlock:^(NSArray *dataArray) {
            //
            //                for (BaseModel * model in dataArray) {
            //                    if ([model isKindOfClass:[MY_LLPersonInfoModel class]]) {
            //                        MY_LLPersonInfoModel * userModel = (MY_LLPersonInfoModel *)model;
            //                        if (userModel.userId == [USERID integerValue]) {
            //
            //                            NSString * phoneNum = [NSString stringWithFormat:@"%ld",userModel.mobileNum];
            //                            phoneNum = [phoneNum substringFromIndex:7];
            //                            _strName = [NSString stringWithFormat:@"用户%@",phoneNum];
            //                        }
            //                    }
            //                }
            //            }];
        }
    }else if(_strName.length > 10){
        [LQProgressHud showMessage:@"昵称不能超过10个字"];
        return;
    }
    
    if ([Utility isBlankString:_strName]) {
        [LQProgressHud showMessage:@"昵称不能为空"];
        return;
    }
    
    if (![Utility isBlankString:_strName]) {
        
        [self.dictData setObject:_strName forKey:@"nickName"];
    }
    
    if (_arrayPage.count == 0) {
        [LQProgressHud showMessage:@"请选择图片作为您头像"];
        return;
    }
    
    
    if ([Utility isBlankString:strAge]) {
        
        strAge = @"20";
    }
    
    if ([Utility isBlankString:_hightV]) {
        _hightV = @"170";
    }
    
    [self.dictData setObject:@(_lastSex) forKey:@"sex"];
    [self.dictData setObject:strAge forKey:@"age"];
    
    if (!imgfid) {
        [LQProgressHud showMessage:@"您上传的头像未成功"];
        return;
    }
    
    [self.dictData setObject:imgfid forKey:@"fid"];
    [self.dictData setObject:_hightV forKey:@"height"];
    [LQProgressHud showLoading:nil];
    [TLHTTPRequest MY_postWithBaseUrl:EditInfoUrl parameters:self.dictData success:^(NSURLSessionDataTask * _Nonnull task, NSDictionary * _Nonnull data) {
        
        if ([[data objectForKey:@"ret"] integerValue] == 0) {
            [LQProgressHud hide];
            [LQProgressHud showMessage:@"设置成功"];
            
//            [self updateUserHeaderMethod:headIcon];
            
            NSString * where = [NSString stringWithFormat:@"userId = %td",[USERID integerValue]];
            NSArray *arry = [[MY_LLDBManager sharedManager] selectClass:[MY_LYPersonInfoModel class] withWhere:where];
            MY_LYPersonInfoModel *model = arry.firstObject;
            
//            MY_LLPersonInfoModel * model = [[MessageInfoModel sharedManager]loadPersonModelWithID:[USERID integerValue]];
            model.nickName = _strName;
            model.headIcon = headIcon;
            model.age = strAge.integerValue;
            model.sex = _lastSex;
            
//            [[MessageInfoModel sharedManager]insertModelWith:model];
            [[MY_LLDBManager sharedManager] updateModel:model withWhere:where];
            
            if (3 == self.isEditInfo) {
                dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
                    CounterMarkViewController * vc = [CounterMarkViewController new];
                    [self.navigationController pushViewController:vc animated:YES];
                });
            }else{
                
                [self backClick];
            }
            //
            //#warning 此处需跳转标签 或者直接回首页
            //                self.tabBarController.selectedIndex = 2;
            
        }else{
            if ([data objectForKey:@"msg"]) {
                [LQProgressHud showMessage:[data objectForKey:@"msg"]];
            }
        }
        
    } failure:^(NSURLSessionDataTask * _Nonnull task, NSError * _Nonnull error) {
        [LQProgressHud showMessage:@"请求失败，请检查网络"];
    }];
    
}


-(void)imageArray:(NSMutableArray *)array
{
    [LQProgressHud showLoading:nil];
    [TLHTTPRequest MY_postDataAndImageRequest:UploadFileURL parameters:nil imageDataArr:self.arrayPage success:^(NSURLSessionDataTask * _Nonnull task, NSDictionary * _Nonnull data) {
        
        if ([[data objectForKey:@"ret"] boolValue] == 0) {
            [LQProgressHud hide];
            if ([data objectForKey:@"info"]) {
                NSString* str = [[data objectForKey:@"info"] objectForKey:@"furl"];
                if (![Utility isBlankString:str]) {
                    
                    //                    UserSetObject(str, @"headIcon");
                    headIcon = [[data objectForKey:@"info"] objectForKey:@"furl"];
                }
                
                [LQProgressHud showMessage:@"上传成功"];
                imgfid = [[data objectForKey:@"info"] objectForKey:@"fid" ];
                
            }
        }
        else{
            if ([data objectForKey:@"msg"]) {
                [LQProgressHud showMessage:[data objectForKey:@"msg"]];
            }
        }
        
    } failure:^(NSURLSessionDataTask * _Nonnull task, NSError * _Nonnull error) {
        [LQProgressHud showMessage:@"上传图片失败"];
    }];
}


//-(void)updateUserHeaderMethod:(NSString *)imgUrl{
//    MY_LLPersonInfoModel * uModel = [[MessageInfoModel sharedManager] loadPersonModelWithID: [USERID integerValue]];
//    uModel.headIcon = imgUrl;
//    [[MessageInfoModel sharedManager] insertModelWith:uModel];

    //    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
    //
    //        NSString * where = [NSString stringWithFormat:@"userId = %@", USERID];
    //
    //        [[MY_LLDBManager sharedManager] selectClass:[MY_LLPersonInfoModel class] withWhere:where responseBlock:^(NSArray *dataArray) {
    //
    //            if ([dataArray.firstObject isKindOfClass:[MY_LLPersonInfoModel class]]) {
    //
    //                MY_LLPersonInfoModel * model = dataArray.firstObject;
    //                model.headIcon = imgUrl;
    
    //                [[MY_LLDBManager sharedManager] updateModel:model withWhere:where];
    
    //                [[MY_LLDBManager sharedManager] selectClass:[MY_LLPersonInfoModel class] withWhere:where responseBlock:^(NSArray *dataArray) {
    //
    //                    if ([dataArray.firstObject isKindOfClass:[MY_LLPersonInfoModel class]]) {
    //
    //                        MY_LLPersonInfoModel * model = dataArray.firstObject;
    //
    //                        NSLog(@"%@",model);
    //
    //                    }
    //                }];
    //            }
    //        }];
    //    });
    
    
//}




-(BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [textField resignFirstResponder];
    
    return YES;
}

-(void)textFieldDidBeginEditing:(UITextField *)textField
{
    if (textField.text)
    {
        
    }else{
        textField.text=@"";
    }
}
#pragma mark - - pickView

- (UIView *)pickerView:(UIPickerView *)pickerView viewForRow:(NSInteger)row forComponent:(NSInteger)component reusingView:(nullable UIView *)view {
    
    UILabel * componentlabel = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, 90, 22)];
    CGRect rect = componentlabel.frame;
    componentlabel.textColor = [Utility colorWithHexString:@"706E70" alpha:1.0];
    componentlabel.font = [UIFont systemFontOfSize:15];
    [componentlabel setTextAlignment:(NSTextAlignmentCenter)];
    
    if (100 == pickerView.tag) {
        
        componentlabel.text = [_ageArray objectAtIndex:row];
        
    }else{
        
        rect.size.width = 80;
        componentlabel.frame = rect;
        componentlabel.text = [_statureArray objectAtIndex:row];
        
    }
    return componentlabel;
    
}



#pragma mark - - UIPickerViewDataSource、Delegate
- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView{
    
    return 1;
    
}

- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component{
    if (100 == pickerView.tag) {//age
        return [_ageArray count];
    }else{// stature
        return [_statureArray count];
    }
}

// 返回pickerView的高度
- (CGFloat)pickerView:(UIPickerView *)pickerView rowHeightForComponent:(NSInteger)component{
    return 22;
}


//// 返回每行的标题
//-(NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component
//{
//
//    if (100 == pickerView.tag) {//age
//        return [_ageArray objectAtIndex:row];
//    }else{// stature
//        return [_statureArray objectAtIndex:row];
//    }
//}

// 选中行显示在label上
-(void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component
{
    
    if (100 == pickerView.tag) {//age
        strAge = _ageArray[row];
    }else{
        _hightV = _statureArray[row];
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
