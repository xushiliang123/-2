//
//  MY_LLCreateClubsViewController.m
//  VTIME
//
//  Created by tingting on 2017/10/12.
//  Copyright © 2017年 MadridLee. All rights reserved.
//

#import "MY_LLCreateClubsViewController.h"
#import "CRWebViewController.h"

@interface MY_LLCreateClubsViewController ()<UITextViewDelegate>
{
    BOOL _isAllowAgreement;
}
@property (weak, nonatomic) IBOutlet UIButton *clubsImgV;
@property (weak, nonatomic) IBOutlet UITextField *clubsName;
@property (weak, nonatomic) IBOutlet UILabel *placeholderLabel;
@property (weak, nonatomic) IBOutlet UITextView *deatilTextView;
@property (weak, nonatomic) IBOutlet UIButton *submitBtn;
@property (weak, nonatomic) IBOutlet UIButton *selectBtn;
@property (weak, nonatomic) IBOutlet UIButton *agreementBtn;
@property (strong, nonatomic) NSMutableArray * imgArray;
@property (weak, nonatomic) IBOutlet UIView *lineView;

@property (strong, nonatomic) SXPickPhoto* pickPhoto;//相册类

@end

@implementation MY_LLCreateClubsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Do any additional setup after loading the view from its nib.
    self.title = @"创建俱乐部";
    _isAllowAgreement = YES;
//    [self.selectBtn setBackgroundImage:[UIImage imageNamed:@"creClubsArgN"] forState:UIControlStateNormal];
//    [self.selectBtn setBackgroundImage:[UIImage imageNamed:@"creClubsArgS"] forState:UIControlStateSelected];

    self.deatilTextView.layer.borderColor = GOLDCOLOR.CGColor;
    self.deatilTextView.layer.borderWidth = 1.0;
    self.deatilTextView.delegate = self;
    self.pickPhoto = [[SXPickPhoto alloc]init];
    [self.submitBtn setBackgroundColor:GOLDCOLOR];
    [self.submitBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [self.submitBtn setImage:nil forState:UIControlStateNormal];
    self.submitBtn.layer.cornerRadius = 23.5;
    self.submitBtn.layer.masksToBounds = YES;
    [self.submitBtn setTitle:@"提交" forState:UIControlStateNormal];
    [self.agreementBtn setTitleColor:GOLDCOLOR forState:UIControlStateNormal];
    self.lineView.backgroundColor = GOLDCOLOR;
    
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(hideImagePicker) name:@"hideImagePicker" object:nil];
}


//  当实时通话时，关闭UIImagePickerController
- (void)hideImagePicker
{
    if (_pickPhoto.picker && [EaseSDKHelper shareHelper].isShowingimagePicker) {
        [_pickPhoto.picker dismissViewControllerAnimated:NO completion:nil];
    }
}

#pragma mark - 选择头像 点击事件
- (IBAction)addClubsHeadImage:(UIButton *)sender {
    
    [self usePhonePhotoAndCamera];
}
//  协议
- (IBAction)agrementClick:(UIButton *)sender {
    CRWebViewController* inviVc = [[CRWebViewController alloc]init];
    inviVc.webURL =  [Utility getH5Url:CurrentDealUrl];
    inviVc.strTitle = @"服务协议";
    [self.navigationController pushViewController:inviVc animated:YES];
}

- (IBAction)selectedAgrementClick:(UIButton *)sender {
    
    sender.selected = !sender.selected;
    _isAllowAgreement = sender.selected;
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
            [self.clubsImgV setImage:(UIImage *)Data forState:(UIControlStateNormal)];
            
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
            [self.clubsImgV setImage:(UIImage *)Data forState:(UIControlStateNormal)];

        }];
    }];
    
    UIAlertController * aleVC = [UIAlertController alertControllerWithTitle:@"提示" message:@"选择图片" preferredStyle:UIAlertControllerStyleActionSheet];
    [aleVC addAction:act1];
    [aleVC addAction:act2];
    [aleVC addAction:act3];
    [self presentViewController:aleVC animated:YES completion:nil];
}

//  上传俱乐部头像
- (void)uploadingHeadIconWithArray:(NSArray *)array {

	[TLHTTPRequest MY_postDataAndImageRequest:UploadFileURL parameters:nil imageDataArr:array success:^(NSURLSessionDataTask * _Nonnull task, NSDictionary * _Nonnull data) {
            if ([[data objectForKey:@"ret"] integerValue] == 0) {
                NSMutableDictionary* dictFid = [[NSMutableDictionary alloc]init];
                [dictFid setObject:[[data objectForKey:@"info"]objectForKey:@"fid"] forKey:@"fid"];
                
                [TLHTTPRequest MY_postWithBaseUrl:EditInfoUrl parameters:dictFid success:^(NSURLSessionDataTask * _Nonnull task, NSDictionary * _Nonnull data) {
                    
                    if ([[data objectForKey:@"ret"] integerValue] == 0) {
                        [LQProgressHud showMessage:@"创建成功"];

                    } else{
                        if ([data objectForKey:@"msg"]) {
                            [LQProgressHud showMessage:[data objectForKey:@"msg"]];
                        }
                    }
                } failure:^(NSURLSessionDataTask * _Nonnull task, NSError * _Nonnull error) {
                    [LQProgressHud showMessage:@"创建失败"];
                }];
            }
            else{
                if ([data objectForKey:@"msg"]) {
                    [LQProgressHud showMessage:[data objectForKey:@"msg"]];
                }
            }
        } failure:^(NSURLSessionDataTask * _Nonnull task, NSError * _Nonnull error) {
            [LQProgressHud showMessage:@"创建失败"];
	}];
}

-(IBAction)selectSubmitBtn:(UIButton *)submitBtn{
    
/*
 clubName    必须    string    俱乐部名称
 fid    是    int    图片唯一标示
 key    是    String    用户唯一标识
 clubInfo    是    string    俱乐部介绍
 */
    NSMutableDictionary * dict = [NSMutableDictionary dictionaryWithCapacity:0];
    
    if (!self.imgArray.count) {
        
        [LQProgressHud showMessage:@"请选择一张图片作为头像"];
        return;
    }
//    clubsName
    NSCharacterSet *set2 = [NSCharacterSet whitespaceAndNewlineCharacterSet];
    NSString *trimmedString2 = [self.clubsName.text stringByTrimmingCharactersInSet:set2];
    if ([trimmedString2 isEqualToString:@""] || ![trimmedString2 length]) {
     
        [LQProgressHud showMessage:@"俱乐部名称2-8个字"];
        return;
    }else{
        [dict setObject:self.clubsName.text forKey:@"clubName"];
    }
    
    NSCharacterSet *setInfo = [NSCharacterSet whitespaceAndNewlineCharacterSet];
    NSString *trimmedString1 = [self.deatilTextView.text stringByTrimmingCharactersInSet:setInfo];
    if ([trimmedString1 isEqualToString:@""] || ![trimmedString1 length]) {
        
        [LQProgressHud showMessage:@"俱乐部描述1 - 50个字以内"];
        return;
    }else{
        [dict setObject:self.deatilTextView.text forKey:@"clubInfo"];
    }
    
    if (!_isAllowAgreement) {
        [LQProgressHud showMessage:@"请同意服务协议"];
        return;
    }
    
    [TLHTTPRequest MY_postDataAndImageRequest:UploadFileURL parameters:nil imageDataArr:self.imgArray success:^(NSURLSessionDataTask * _Nonnull task, NSDictionary * _Nonnull data) {
        
        if ([[data objectForKey:@"ret"] integerValue] == 0) {
            NSMutableDictionary* dictFid = [[NSMutableDictionary alloc]init];
            [dict setObject:[[data objectForKey:@"info"]objectForKey:@"fid"] forKey:@"fid"];
            
            [TLHTTPRequest MY_postWithBaseUrl:CreateClub parameters:dict success:^(NSURLSessionDataTask * _Nonnull task, NSDictionary * _Nonnull data) {
                
                if ([[data objectForKey:@"ret"] integerValue] == 0) {
                    
                    [LQProgressHud showMessage:@"创建成功 !"];
                    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{

                        [self.navigationController popViewControllerAnimated:YES];
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
        [LQProgressHud showMessage:@"创建失败"];
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            
            [self.navigationController popViewControllerAnimated:YES];
        });
	}];
}

#pragma textViewDelegate
-(void)textViewDidChange:(UITextView *)textView
{
    if (textView.text.length != 0) {
        self.placeholderLabel.text = @"";
        self.placeholderLabel.hidden = YES;
    }
    else{
        self.placeholderLabel.text = @"俱乐部说明";
        self.placeholderLabel.hidden = NO;
    }
}

- (BOOL)textView:(UITextView *)textView shouldChangeTextInRange:(NSRange)range
 replacementText:(NSString *)text
{
    if ([@"\n" isEqualToString:text] == YES)
    {
        [textView resignFirstResponder];
        if (textView.text.length == 0)
        {
            self.placeholderLabel.text = @"俱乐部说明";
            self.placeholderLabel.hidden = NO;
        }
//        else{
//            self.placeholderLabel.text = @"";
//            self.placeholderLabel.hidden = YES;
//        }
        return NO;
    }
    return YES;
}
//  输入结束
- (void)textViewDidEndEditing:(UITextView *)textView {

  
}

#pragma mark --数据源初始化
- (NSMutableArray *)imgArray{
    if (!_imgArray) {
        _imgArray = [[NSMutableArray alloc] init];
    }
    return _imgArray;
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
