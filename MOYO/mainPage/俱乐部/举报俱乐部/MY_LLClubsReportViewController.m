//
//  MY_LLClubsReportViewController.m
//  VTIME
//
//  Created by tingting on 2017/10/12.
//  Copyright © 2017年 MadridLee. All rights reserved.
//

#import "MY_LLClubsReportViewController.h"
#import "MY_TTLRepordTableViewCell.h"


@interface MY_LLClubsReportViewController ()
<UITextViewDelegate, UIImagePickerControllerDelegate,
UINavigationControllerDelegate,UIAlertViewDelegate>
{
    UITableView * _tableView;
    NSIndexPath * _oldCellIndexPath;
    NSMutableDictionary * _parameters;
    UIImageView * _imgvAdd;                 //  补充图片-控件
    NSData * _imageData;                    //  补充图片NSData
    UIImageView * _imgvadd;
    NSString * imgfid;
}

@property (nonatomic, strong)NSMutableArray * dataArray;
@property (nonatomic, strong)NSMutableArray * arrayPage;//要上传的图片

@end

@implementation MY_LLClubsReportViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"举报";
    self.view.backgroundColor = [UIColor whiteColor];
    
    _parameters = [NSMutableDictionary dictionary];
    [_parameters setObject:@(self.ClubID) forKey:@"clubId"];
    [_parameters setObject:@"" forKey:@"userId"];
    [_parameters setObject:@"" forKey:@"supplementCause"];
    
    
    [self uiConfig];
    [self createHeaderView];
    [self createFooterView];
    
    [self downloadReportReason];
}

#pragma mark - 数据相关
- (void)downloadReportReason{
    
    NSDictionary * dic;
    
    dic = @{@"type":@1};
    
    [TLHTTPRequest MY_getWithBaseUrl:ReportReasonUrl parameters:dic success:^(NSURLSessionDataTask * _Nonnull task, NSDictionary * _Nonnull dict) {
        
        if ([[dict objectForKey:@"ret"] boolValue] == 0) {
            
            if ([dict[@"info"] isKindOfClass:[NSArray class]]) {
                
                self.dataArray = [NSMutableArray arrayWithArray:dict[@"info"]];
                
                [_tableView reloadData];
            }
        }
    } failure:^(NSURLSessionDataTask * _Nonnull task, NSError * _Nonnull error) {
        
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
    UIView* view = [[UIView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 39 + 84 + 55)];
    _tableView.tableHeaderView = view;
    view.backgroundColor = [Utility colorWithHexString:@"f8f8f8" alpha:1];
    
    NSString* str = self.reportOfPerson;
    
    if (!str) {
        str = @"无名氏";
    }
    
    UILabel* labelTitle = [[UILabel alloc]initWithFrame:CGRectMake(15, 10, SCREEN_WIDTH, 19)];
    labelTitle.text = [NSString stringWithFormat:@"举报该俱乐部"];
    [view addSubview:labelTitle];
    labelTitle.font = [UIFont systemFontOfSize:13];
    labelTitle.textColor = [Utility colorWithHexString:@"999999" alpha:1];
//    NSMutableAttributedString *attri = [[NSMutableAttributedString alloc] initWithString:labelTitle.text];
//    [attri addAttribute:NSForegroundColorAttributeName value:[Utility colorWithHexString:@"333333" alpha:1] range:NSMakeRange(2, str.length)];
//    [attri addAttribute:NSFontAttributeName value:[UIFont systemFontOfSize:13] range:NSMakeRange(2, str.length)];
//    labelTitle.attributedText = attri;
    
    _imgvAdd = [[UIImageView alloc]initWithFrame:CGRectMake(15, CGRectGetMaxY(labelTitle.frame) + 14,84, 84)];
    _imgvAdd.userInteractionEnabled = YES;
    _imgvAdd.contentMode = UIViewContentModeScaleAspectFill;
    _imgvAdd.layer.masksToBounds = YES;
    _imgvAdd.layer.cornerRadius = 84 /2;
    [view addSubview:_imgvAdd];
    _imgvAdd.image = [UIImage imageNamed:@"fankui"];
    
    NSURL*headImageUrl= [NSURL URLWithString:[self.reportOfImageUrl
                                              stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding]];
    [_imgvAdd sd_setImageWithURL:headImageUrl placeholderImage:[UIImage imageNamed:@"占位图"] options:SDWebImageAllowInvalidSSLCertificates];
    
    UILabel* labeImg = [[UILabel alloc]initWithFrame:CGRectMake(15, CGRectGetMaxY(_imgvAdd.frame) + 15, SCREEN_WIDTH - 40, 20)];
    labeImg.font = [UIFont systemFontOfSize:13];
    labeImg.textColor = [Utility colorWithHexString:@"999999" alpha:1];
    labeImg.text = @"举报原因:";
    [view addSubview:labeImg];
    
}

-(void)createFooterView
{
    UIView* view = [[UIView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 230)];
    _tableView.tableFooterView = view;
    
    UIView* viewText = [[UIView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 120)];
    [view addSubview:viewText];
    
    UILabel* labelText = [[UILabel alloc]initWithFrame:CGRectMake(15, 20, SCREEN_WIDTH - 40, 20)];
    labelText.font = [UIFont systemFontOfSize:14];
    labelText.textColor = [Utility colorWithHexString:@"c9c9c9" alpha:1];
    [viewText addSubview:labelText];
    labelText.text = @"补充原因";
    
    UITextView* textView = [[UITextView alloc]initWithFrame:CGRectMake(10, 40, SCREEN_WIDTH - 30, 80)];
    textView.delegate = self;
    textView.font = [UIFont systemFontOfSize:14];
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
    
    _imgvadd = [[UIImageView alloc]initWithFrame:CGRectMake(15, 35, 70, 70)];
    _imgvadd.userInteractionEnabled = YES;
    _imgvadd.contentMode = UIViewContentModeScaleAspectFill;
    _imgvadd.layer.masksToBounds = YES;
    [viewImg addSubview:_imgvadd];
    _imgvadd.image = [UIImage imageNamed:@"fankui"];
    
    //    UIView* lineView = [[UIView alloc]initWithFrame:CGRectMake(0, 140, SCREEN_WIDTH, 10)];
    //    lineView.backgroundColor = [Utility colorWithHexString:@"f8f8f8" alpha:1];
    //    [viewImg addSubview:lineView];
    
    UITapGestureRecognizer * tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(imgvAddSelectedImage)];
    [_imgvadd addGestureRecognizer:tap];
    
}

-(void)uiConfig
{
    _tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT - 64 - 76) style:UITableViewStylePlain];
    _tableView.delegate = self;
    _tableView.dataSource = self;
    _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    [_tableView setSeparatorColor:[Utility colorWithHexString:@"efefef" alpha:1]];
    [self.view addSubview:_tableView];
    
    UIButton* btnDra = [UIButton buttonWithType:UIButtonTypeCustom];
    btnDra.frame = CGRectMake(10, SCREEN_HEIGHT  - 64 - 55 - 10, SCREEN_WIDTH - 20, 55);
    [btnDra setTitle:@"提交" forState:UIControlStateNormal];
    [self.view addSubview:btnDra];
    btnDra.layer.cornerRadius = 55 * 0.15;
    btnDra.clipsToBounds = YES;
    btnDra.backgroundColor = GOLDCOLOR;
    btnDra.titleLabel.font = [UIFont systemFontOfSize:18];
    [btnDra addTarget:self action:@selector(withdraClick) forControlEvents:UIControlEventTouchUpInside];
    
    UIView* viewImg = [[UIView alloc]initWithFrame:CGRectMake(0, SCREEN_HEIGHT - 64 -  75, SCREEN_WIDTH, 1)];
    viewImg.backgroundColor = [Utility colorWithHexString:@"f8f8f8" alpha:1];
    [self.view addSubview:viewImg];
}

#pragma mark - 事件相关
-(void)withdraClick {
    
    if ([_parameters[@"rcId"] integerValue] <= 0) {
        [LQProgressHud showMessage:@"请选择原因"];
        return;
    }
    
    if (![_parameters objectForKey:@"supplementCause"]) {
        [_parameters setObject:@"" forKey:@"supplementCause"];
    }
    if (![self.arrayPage count] || !imgfid || [imgfid length] == 0) {
        
        [LQProgressHud showMessage:@"请上传补充图片"];
        return;
    }
    ALERT_SHOW(@"提示",@"确定举报该俱乐部？",self,@"取消",@"确定");
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
    return 44;
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
    
//    NSLog(@"%@", textView.text);
    if (textView.text.length > 0) {
        
        [textView endEditing:YES];
        [_parameters setObject:textView.text forKey:@"supplementCause"];
        
    }else{
        
        [LQProgressHud showMessage:@"补充原因不能为空"];
    }
}

// 给textView的return 按钮加响应方法
- (BOOL) textView: (UITextView *) textView  shouldChangeTextInRange: (NSRange) range replacementText: (NSString *)text {
    if( [ @"\n" isEqualToString: text]){
        //你的响应方法
        
        [self.view endEditing:YES];
        
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
        
        _imgvadd.image = orgImage;
        
        // 上传图片
        [self imageArray:self.arrayPage];
    }
}

- (void)imagePickerControllerDidCancel:(UIImagePickerController *)picker {
    [picker dismissViewControllerAnimated:YES completion:nil];
}

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

#pragma mark - UIAlertViewDelegate
- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex{
    
    
    
#pragma mark ## UIAlertViewDelegate
    //        0 取消  1 确定
    if (buttonIndex == 0 ) return;
    
    __weak typeof(self) wSelf = self;
    
    [TLHTTPRequest MY_postWithBaseUrl:ReportDynamicURL parameters:_parameters success:^(NSURLSessionDataTask * _Nonnull task, NSDictionary * _Nonnull data) {
        
        if ([[data objectForKey:@"ret"] boolValue] == 0) {
            
            [LQProgressHud showMessage:@"举报成功！"];
            
            [self.navigationController popViewControllerAnimated:YES];
            
        }
        else {
            [LQProgressHud showMessage:data[@"msg"]];
        }
        
    } failure:^(NSURLSessionDataTask * _Nonnull task, NSError * _Nonnull error) {
        [LQProgressHud showMessage:@"网络连接失败"];
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

