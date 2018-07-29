//
//  MY_TTLProductPreViewViewController.m
//  TogetherLu
//
//  Created by MadridLee on 2017/3/24.
//  Copyright © 2017年 TogetherLu. All rights reserved.
//

#import "MY_TTLProductPreViewViewController.h"
#import "SXPickPhoto.h"
@interface MY_TTLProductPreViewViewController ()<UITextViewDelegate>
{
    UITextView* _textView;
    UILabel* _placeholder_label;
    UIButton* _btnImage;
}
@property (nonatomic, strong)  SXPickPhoto * pickPhoto;//相册类
@property (strong, nonatomic) NSMutableArray*      pageArray;//t图片

@end

@implementation MY_TTLProductPreViewViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"产品反馈";
    self.view.backgroundColor = [Utility colorWithHexString:@"f8f8f8" alpha:1];
    // Do any additional setup after loading the view.
    _pickPhoto = [[SXPickPhoto alloc]init];
    [self createTextView];
    
    [self createPhotoView];
    
    [self createBtn];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(hideImagePicker) name:@"hideImagePicker" object:nil];
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
-(void)createTextView
{
    UIView* view = [[UIView alloc]initWithFrame:CGRectMake(0, 10, SCREEN_WIDTH, 175)];
    [self.view addSubview:view];
    view.backgroundColor = [UIColor whiteColor];
    
    _textView = [[UITextView alloc]initWithFrame:CGRectMake(10, 10, SCREEN_WIDTH - 20, 175)];
    //    textView.text = @"";
    [self.view addSubview:_textView];
    _textView.delegate = self;
    
    _placeholder_label = [[UILabel alloc] initWithFrame:CGRectMake(5, 3, 200, 30)];
    _placeholder_label.text = @"请输入产品反馈意见";
    _placeholder_label.font =  [UIFont systemFontOfSize:13];
    _placeholder_label.textColor = [Utility colorWithHexString:@"c9c9c9" alpha:1];
    [_textView addSubview:_placeholder_label];
}

#pragma textViewDelegate
-(void)textViewDidChange:(UITextView *)textView
{
    
    if (_textView.text.length != 0) {
        _placeholder_label.text = @"";
        _placeholder_label.hidden = YES;
    }
    else{
        _placeholder_label.text = @"请输入产品反馈意见";
        _placeholder_label.hidden = NO;
    }

    
}
- (BOOL)textView:(UITextView *)textView shouldChangeTextInRange:(NSRange)range
 replacementText:(NSString *)text
{

    if ([@"\n" isEqualToString:text] == YES)
    {
        [textView resignFirstResponder];
        if (_textView.text.length == 0)
        {
            _placeholder_label.text = @"请输入产品反馈意见";
            _placeholder_label.hidden = NO;
        }
        return NO;
    }
    return YES;
}


-(void)createPhotoView
{
    UIView* view = [[UIView alloc]initWithFrame:CGRectMake(0, 205, SCREEN_WIDTH, 123)];
    [self.view addSubview:view];
    view.backgroundColor = [UIColor whiteColor];
    
    _btnImage = [UIButton buttonWithType:UIButtonTypeCustom];
    _btnImage.frame = CGRectMake(15, 15, 73, 73);
    [_btnImage setBackgroundImage:[UIImage imageNamed:@"fankui"] forState:UIControlStateNormal];
    [view addSubview:_btnImage];
//    _btnImage.layer.masksToBounds = YES;
//    _btnImage.layer.cornerRadius
    [_btnImage addTarget:self action:@selector(addImage:) forControlEvents:UIControlEventTouchUpInside];
    
    UILabel* label = [[UILabel alloc]initWithFrame:CGRectMake(15, 103, 200, 15)];
    label.textColor = [Utility colorWithHexString:@"999999" alpha:1];
    label.font = [UIFont systemFontOfSize:12];
    label.text = @"点击可更换图片";
    [view addSubview:label];
    
}

#pragma mark --添加图片
-(void)addImage:(UIButton *)btn
{
    //    _photos = 10;
    UIAlertAction * act1 = [UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {
        //        _photos = 1;
    }];
    
    //拍照：
    UIAlertAction * act2 = [UIAlertAction actionWithTitle:@"拍照" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        //打开相机
        _pickPhoto.picker.allowsEditing = YES;
        __weak typeof (self) weakSelf = self;
        [_pickPhoto ShowTakePhotoWithController:self withIsEdit:1 andWithBlock:^(NSObject *Data) {
            if (weakSelf.pageArray.count != 0) {
                [weakSelf.pageArray removeAllObjects];
            }
            self.pageArray = [NSMutableArray arrayWithObject:UIImageJPEGRepresentation((UIImage *)Data, 0.7)];
            [_btnImage setBackgroundImage:[UIImage imageWithData:weakSelf.pageArray[0]] forState:UIControlStateNormal];
        }];
    }];
    //相册
    UIAlertAction * act3 = [UIAlertAction actionWithTitle:@"相册" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        //打开相册
        _pickPhoto.picker.allowsEditing = YES;
        __weak typeof (self) weakSelf = self;
        [_pickPhoto SHowLocalPhotoWithController:self withIsEdit:1 andWithBlock:^(NSObject *Data) {
            if (weakSelf.pageArray.count != 0) {
                [weakSelf.pageArray removeAllObjects];
            }
            weakSelf.pageArray = [NSMutableArray arrayWithObject:UIImageJPEGRepresentation((UIImage *)Data, 0.7)];
            [_btnImage setBackgroundImage:[UIImage imageWithData:weakSelf.pageArray[0]] forState:UIControlStateNormal];
        }];
        
    }];
    
    UIAlertController * aleVC = [UIAlertController alertControllerWithTitle:@"提示" message:@"选择图片" preferredStyle:UIAlertControllerStyleActionSheet];
    [aleVC addAction:act1];
    [aleVC addAction:act2];
    [aleVC addAction:act3];
    [self presentViewController:aleVC animated:YES completion:nil];
}

-(void)createBtn
{
    UIButton* btnFinish = [UIButton buttonWithType:UIButtonTypeCustom];
    btnFinish.frame = CGRectMake(10, 428, SCREEN_WIDTH - 20, 55);
    btnFinish.backgroundColor = GOLDCOLOR;
    [btnFinish setTitle:@"提交" forState:UIControlStateNormal];
    btnFinish.titleLabel.textColor = [UIColor whiteColor];
    btnFinish.layer.masksToBounds = YES;
    btnFinish.layer.cornerRadius  = 5;
    [self.view addSubview:btnFinish];
    [btnFinish addTarget:self action:@selector(updataClick) forControlEvents:UIControlEventTouchUpInside];
}
#pragma mark - 事件相关
-(void)updataClick {
    [self.view endEditing:YES];
    if ([Utility isBlankString:_textView.text]) {
//        [MMProgressHUD showWithStatus:@"请输入反馈意见"];
//        
//        [MMProgressHUD dismissAfterDelay:1];
        
        [LQProgressHud showMessage:@"请输入反馈意见"];
        return;
    }
    
    if (![_pageArray count]) {
        
        [LQProgressHud showMessage:@"请添加反馈图片"];
        
        return;
    }

    [TLHTTPRequest MY_postDataAndImageRequest:UploadFileURL parameters:nil imageDataArr:_pageArray success:^(NSURLSessionDataTask * _Nonnull task, NSDictionary * _Nonnull data) {
        
        if ([[data objectForKey:@"ret"] boolValue] == 0) {
            NSMutableDictionary* dict = [[NSMutableDictionary alloc]init];
            [dict setObject:_textView.text forKey:@"content"];
            NSString* str = [[data objectForKey:@"info"] objectForKey:@"fid"];
            [dict setObject:str forKey:@"fids"];
            [TLHTTPRequest MY_postWithBaseUrl:UserInfoAppFedd parameters:dict success:^(NSURLSessionDataTask * _Nonnull task, NSDictionary * _Nonnull data1) {
                if ([[data1 objectForKey:@"ret"] boolValue] == 0) {
                    //  反馈提交成功
                    [LQProgressHud showMessage:@"反馈提交成功"];

//                    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
                    
                        [self.navigationController popViewControllerAnimated:YES];

//                    });
                    
                }
                else{
                    if ([data1 objectForKey:@"msg"]) {
                        [LQProgressHud showMessage:[data1 objectForKey:@"msg"]];
                    }
                }
            } failure:^(NSURLSessionDataTask * _Nonnull task, NSError * _Nonnull error) {
                [MBProgressHUD hideHUDForView:self.view animated:YES];
                [LQProgressHud showMessage:@"请求失败，请检查网络"];
            }];
        }
        else{
            [MBProgressHUD hideHUDForView:self.view animated:YES];
            if ([data objectForKey:@"msg"]) {
                [LQProgressHud showMessage:[data objectForKey:@"msg"]];
            }
        }
        
    } failure:^(NSURLSessionDataTask * _Nonnull task, NSError * _Nonnull error) {
        [MBProgressHUD hideHUDForView:self.view animated:YES];
        [LQProgressHud showMessage:@"请求失败，请检查网络"];
    }];
    
    
    
}

-(NSMutableArray *)pageArray
{
    if (!_pageArray) {
        _pageArray = [[NSMutableArray alloc]init];
    }
    return _pageArray;
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
