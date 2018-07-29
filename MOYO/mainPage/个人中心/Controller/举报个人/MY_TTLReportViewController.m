//
//  MY_TTLReportViewController.m
//  TogetherLu
//
//  Created by MadridLee on 2016/12/30.
//  Copyright © 2016年 TogetherLu. All rights reserved.
//

#import "MY_TTLReportViewController.h"
#import "MY_TTLRepordTableViewCell.h"
//#import "MY_TTLReceiveGiftsViewController.h"
#import <MobileCoreServices/MobileCoreServices.h>



@interface MY_TTLReportViewController ()<UITextViewDelegate, UIImagePickerControllerDelegate, UINavigationControllerDelegate>
{
    UITableView * _tableView;
    NSIndexPath * _oldCellIndexPath;
    NSMutableDictionary * _parameters;
    UIImageView * _imgvAdd;                 //  补充图片-控件

    NSString * imgfid;
}

@property (nonatomic, strong)NSMutableArray * dataArray;
@property (nonatomic, strong)NSMutableArray * arrayPage;//要上传的图片

@end

@implementation MY_TTLReportViewController

-(BOOL)hidesBottomBarWhenPushed{
    return YES;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
//    self.view.backgroundColor= BgColor;
    
    self.title = @"举报";
    _parameters = [NSMutableDictionary dictionary];
    if (self.repotrOfUserId) {
        [_parameters setObject:@(self.repotrOfUserId) forKey:@"userId"];
    }

    
    [self downloadReportReason];
    [self uiConfig];
    [self createHeaderView];
    [self createFooterView];
}

#pragma mark - 数据相关
- (void)downloadReportReason{
    
    [TLHTTPRequest MY_getWithBaseUrl:ReportReasonUrl parameters:nil success:^(NSURLSessionDataTask * _Nonnull task, NSDictionary * _Nonnull dict) {
        
        if ([[dict objectForKey:@"ret"] boolValue] == 0) {
            
            if ([dict[@"info"] isKindOfClass:[NSArray class]]) {
                
                self.dataArray = [NSMutableArray arrayWithArray:dict[@"info"]];
                
                [_tableView reloadData];
            }
        }
    } failure:^(NSURLSessionDataTask * _Nonnull task, NSError * _Nonnull error) {
        
        //        [MMProgressHUD dismissWithError:@"请求失败"];
    }];
}


- (NSMutableArray *)dataArray{
    if (nil == _dataArray) {
        _dataArray = [[NSMutableArray alloc] init];
    }
    return _dataArray;
}


#pragma mark - UI相关
-(void)createHeaderView
{
    UIView* view = [[UIView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 39)];
    _tableView.tableHeaderView = view;
    view.backgroundColor = [Utility colorWithHexString:@"f8f8f8" alpha:1];
    
    NSString* str = self.reportOfPerson;
    
    if (!str) {
        str = @"无名氏";
    }
    
    UILabel* labelTitle = [[UILabel alloc]initWithFrame:CGRectMake(15, 10, SCREEN_WIDTH, 19)];
    if (_reportOfRoomId) {
        labelTitle.text = [NSString stringWithFormat:@"举报%@的聊天室的原因：",str];
    }
    else{
        labelTitle.text = [NSString stringWithFormat:@"举报%@的原因：",str];
    }
    [view addSubview:labelTitle];
    labelTitle.font = [UIFont systemFontOfSize:13];
    labelTitle.textColor = [Utility colorWithHexString:@"999999" alpha:1];
    NSMutableAttributedString *attri = [[NSMutableAttributedString alloc] initWithString:labelTitle.text];
    [attri addAttribute:NSForegroundColorAttributeName value:[Utility colorWithHexString:@"333333" alpha:1] range:NSMakeRange(2, str.length)];
    [attri addAttribute:NSFontAttributeName value:[UIFont systemFontOfSize:14] range:NSMakeRange(2, str.length)];
    labelTitle.attributedText = attri;
}

-(void)createFooterView
{
    UIView* view = [[UIView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 230)];
    _tableView.tableFooterView = view;
    
    UIView* viewText = [[UIView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 110)];
    [view addSubview:viewText];
    
    UILabel* labelText = [[UILabel alloc]initWithFrame:CGRectMake(15, 20, SCREEN_WIDTH - 30, 16)];
    labelText.font = [UIFont systemFontOfSize:15];
    labelText.textColor = [Utility colorWithHexString:@"999999" alpha:1];
    [viewText addSubview:labelText];
    labelText.text = @"补充原因";
    
    UITextView* textView = [[UITextView alloc]initWithFrame:CGRectMake(10, 40, SCREEN_WIDTH - 30, 70)];
    textView.delegate = self;
    textView.font = [UIFont systemFontOfSize:15];
    textView.returnKeyType = UIReturnKeyDone;
    [viewText addSubview:textView];
    
    
    UIView* viewImg = [[UIView alloc]initWithFrame:CGRectMake(0, 110, SCREEN_WIDTH, 120)];
    [view addSubview:viewImg];
    
    //    UIView* lineView1 = [[UIView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 10)];
    //    lineView1.backgroundColor = [Utility colorWithHexString:@"f8f8f8" alpha:1];
    //    [viewImg addSubview:lineView1];
    
    UILabel* labeImg = [[UILabel alloc]initWithFrame:CGRectMake(15, 10, SCREEN_WIDTH - 30, 16)];
    labeImg.font = [UIFont systemFontOfSize:15];
    labeImg.textColor = [Utility colorWithHexString:@"999999" alpha:1];
    [viewImg addSubview:labeImg];
    labeImg.text = @"补充图片";
    
    _imgvAdd = [[UIImageView alloc]initWithFrame:CGRectMake(15, 35, 70, 70)];
    _imgvAdd.userInteractionEnabled = YES;
    _imgvAdd.contentMode = UIViewContentModeScaleAspectFill;
    _imgvAdd.layer.masksToBounds = YES;
    [viewImg addSubview:_imgvAdd];
    _imgvAdd.image = [UIImage imageNamed:@"fankui"];
    
    //    UIView* lineView = [[UIView alloc]initWithFrame:CGRectMake(0, 140, SCREEN_WIDTH, 10)];
    //    lineView.backgroundColor = [Utility colorWithHexString:@"f8f8f8" alpha:1];
    //    [viewImg addSubview:lineView];
    
    UITapGestureRecognizer * tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(imgvAddSelectedImage)];
    [_imgvAdd addGestureRecognizer:tap];
}


-(void)uiConfig
{
    _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT - 64 - 75) style:UITableViewStylePlain];
    _tableView.delegate = self;
    _tableView.dataSource = self;
    _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    [self.view addSubview:_tableView];
    [_tableView setSeparatorColor:[Utility colorWithHexString:@"efefef" alpha:1]];
    
    
    UIView * bgView = [[UIView alloc]initWithFrame:CGRectMake(0, SCREEN_HEIGHT - 64 - 75, SCREEN_WIDTH, 75)];
    bgView.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:bgView];
    
    UIButton* btnDra = [UIButton buttonWithType:UIButtonTypeCustom];
    btnDra.frame = CGRectMake(10, 10, SCREEN_WIDTH - 20, 55);
    [btnDra setTitle:@"提交" forState:UIControlStateNormal];
    btnDra.layer.cornerRadius = 55 * 0.15;
    btnDra.clipsToBounds = YES;
    btnDra.backgroundColor = GOLDCOLOR;
    btnDra.titleLabel.font = [UIFont systemFontOfSize:18];
    [btnDra addTarget:self action:@selector(withdraClick) forControlEvents:UIControlEventTouchUpInside];
    [bgView addSubview:btnDra];
}

#pragma mark - 事件相关
-(void)withdraClick {
    
    if ([_parameters[@"rcId"] integerValue] <= 0) {
        [LQProgressHud showMessage:@"请选择原因"];
        return;
    }
    
    //    if ([_parameters[@"img"] integerValue] <= 0) {
    //
    //        [self addPromptAlertViewWithMessage:@"请上传补充图片"];
    ////        [MMProgressHUD dismissAfterDelay:1.0];
    ////        [MMProgressHUD dismissWithError:@"请上传补充图片"];
    //        return;
    //    }
    if ([_parameters[@"supplementCause"] length] > 50) {
        [LQProgressHud showMessage:@"补充原因不能超过50个字"];
        return;
    }
    
    if (![self.arrayPage count] || !imgfid || [imgfid length] == 0) {
        
        [LQProgressHud showMessage:@"请上传补充图片"];
        return;
    }
    
    if (_reportOfRoomId) {
        ALERT_SHOW(@"提示",@"确定举报该聊天室？",self,@"取消",@"确定");
    }else{
        ALERT_SHOW(@"提示",@"确定举报该用户？",self,@"取消",@"确定");
    }
    
    
}


//  打开系统相册
- (void)imgvAddSelectedImage {
    
    UIImagePickerController* imagePicker = [[UIImagePickerController alloc] init];
    imagePicker.delegate = self;
    imagePicker.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
    imagePicker.mediaTypes = @[(NSString *)kUTTypeImage];
    
    //  修改UIImagePickerController的navigationBar颜色
    [imagePicker.navigationBar setBarTintColor:[UIColor whiteColor]];
    [imagePicker.navigationBar setTranslucent:NO];
    [self presentViewController:imagePicker animated:YES completion:NULL];
}

#pragma mark - tableView 代理
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 1;
}
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return self.dataArray.count;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 45;
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    return section == (self.dataArray.count - 1) ? 10 : 1;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *cellId = @"MY_TTLRepordTableViewCell";
    //公用的cell，位置-->>infomation->view->pageviewcontroller
    MY_TTLRepordTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellId];
    if (cell == nil) {
        cell = [[[NSBundle mainBundle]loadNibNamed:@"MY_TTLRepordTableViewCell" owner:self options:nil] lastObject];
    }
    cell.labelTitle.font = [UIFont systemFontOfSize:15];
    cell.labelTitle.textColor = [Utility colorWithHexString:@"666666" alpha:1];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    cell.labelTitle.text = self.dataArray[indexPath.section][@"cause"];
    if (indexPath.section == 0 && _oldCellIndexPath.section == 0) {
        cell.imgvIcon.hidden = NO;
        NSInteger rcId = [self.dataArray[indexPath.section][@"rcId"] integerValue];
        [_parameters setObject:@(rcId) forKey:@"rcId"];
        _oldCellIndexPath = indexPath;
    }
    return cell;
}


-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    //    MY_TTLReceiveGiftsViewController* reVc = [[MY_TTLReceiveGiftsViewController alloc]init];
    //    [self.navigationController pushViewController:reVc animated:YES];
    
    MY_TTLRepordTableViewCell * oldCell = [tableView cellForRowAtIndexPath:_oldCellIndexPath];
    
    oldCell.imgvIcon.hidden = YES;
    
    MY_TTLRepordTableViewCell * cell = [tableView cellForRowAtIndexPath:indexPath];
    
    cell.imgvIcon.hidden = NO;
    
    _oldCellIndexPath = indexPath;
    
    NSInteger rcId = [self.dataArray[indexPath.section][@"rcId"] integerValue];
    
    [_parameters setObject:@(rcId) forKey:@"rcId"];
}


#pragma mark - UITextViewDelegate
- (void)textViewDidEndEditing:(UITextView *)textView{
    
    NSLog(@"%@", textView.text);
    if (textView.text.length > 0) {
        
        [textView endEditing:YES];
        [_parameters setObject:textView.text forKey:@"supplementCause"];
        
    }else{
        
        [LQProgressHud showMessage:@"补充原因不能为空"];
    }
}

- (BOOL)textView:(UITextView *)textView shouldChangeTextInRange:(NSRange)range
 replacementText:(NSString *)text
{
    if ([@"\n" isEqualToString:text] == YES)
    {
        [textView resignFirstResponder];
        //        if (textView.text.length == 0)
        //        {
        //            self.placeHLabel.text = self.placeString;
        //            self.placeHLabel.hidden = NO;
        //        }
        return NO;
    }
    
    return YES;
    
}

#pragma mark - UIImagePickerControllerDelegate
- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info {
    
    NSString * mediaType = info[UIImagePickerControllerMediaType];
    
    if ([mediaType isEqualToString:(NSString *)kUTTypeImage]) {
        
        UIImage * orgImage = info[UIImagePickerControllerOriginalImage];
        
        [picker dismissViewControllerAnimated:YES completion:nil];
        
        if (self.arrayPage.count != 0) {
            [self.arrayPage removeAllObjects];
        }
        
        [self.arrayPage addObject:UIImageJPEGRepresentation(orgImage, 0.5)];
        
        _imgvAdd.image = orgImage;
        
        // 上传图片
        [self imageArray:self.arrayPage];
        
    }
}

#pragma mark - - 如果是自己 则上传相册

-(void)imageArray:(NSMutableArray *)array
{
    [TLHTTPRequest MY_postDataAndImageRequest:UploadFileURL parameters:nil imageDataArr:self.arrayPage success:^(NSURLSessionDataTask * _Nonnull task, NSDictionary * _Nonnull data) {
        
        if ([[data objectForKey:@"ret"] boolValue] == 0) {
            if ([data objectForKey:@"info"]) {
                NSString* str = [[data objectForKey:@"info"] objectForKey:@"furl"];
                if (![Utility isBlankString:str]) {
                    
                    //                    UserSetObject(str, @"headIcon");
                    
                    imgfid = [[data objectForKey:@"info"] objectForKey:@"fid" ];
                    
                    [_parameters setObject:imgfid forKey:@"fid"];
                    
                    //    [self updateUserHeaderMethod:str];
                }
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



- (void)imagePickerControllerDidCancel:(UIImagePickerController *)picker {
    [picker dismissViewControllerAnimated:YES completion:nil];
}


#pragma mark - UIAlertViewDelegate
- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex{
    //        0 取消  1 确定
    if (buttonIndex == 0 ) return;
    
        [TLHTTPRequest MY_postWithBaseUrl:ReportUrl parameters:_parameters success:^(NSURLSessionDataTask * _Nonnull task, NSDictionary * _Nonnull data) {
        
        if ([[data objectForKey:@"ret"] boolValue] == 0) {
            
            [LQProgressHud showMessage:@"举报成功！"];
            
            dispatch_after(dispatch_time(DISPATCH_TIME_NOW, NSEC_PER_SEC), dispatch_get_main_queue(), ^{
                
                [self.navigationController popViewControllerAnimated:YES];
                
            });
            
        }
        
    } failure:^(NSURLSessionDataTask * _Nonnull task, NSError * _Nonnull error) {
        
        [LQProgressHud showMessage:[NSString stringWithFormat:@"%@", error]];
    }];
}

-(NSMutableArray*)arrayPage{
    if (!_arrayPage) {
        _arrayPage = [NSMutableArray arrayWithCapacity:0];
    }
    return _arrayPage;
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
