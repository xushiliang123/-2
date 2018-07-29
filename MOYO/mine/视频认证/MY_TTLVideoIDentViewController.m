//
//  MyViewController.m
//  TogetherLu
//
//  Created by Louie on 16/12/15.
//  Copyright © 2016年 TogetherLu. All rights reserved.
//

#import "MY_TTLVideoIDentViewController.h"
#import "MY_TTLFacePhotoTableViewCell.h"
@interface MY_TTLVideoIDentViewController ()<UITableViewDelegate,UITableViewDataSource,UIImagePickerControllerDelegate,UINavigationControllerDelegate>
{
    NSString* _strVideoUrl;     //视频截图地址
    NSInteger _videoLength;
    
    NSInteger _videoDegress;    //视频旋转角度
    UIImage* _imageFirst;   //视频首帧图片用于展示
    NSURL* _videoURL;   //视频地址
}
@property (strong, nonatomic) UITableView* myTableView;

@end

@implementation MY_TTLVideoIDentViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"视频认证";
    [TLHTTPRequest MY_getWithBaseUrl:GetVideoVarifyUrl parameters:nil success:^(NSURLSessionDataTask * _Nonnull task, NSDictionary * _Nonnull data) {
        if ([data objectForKey:@"info"]) {
            NSDictionary* dict = [data objectForKey:@"info"];
            if ([[dict objectForKey:@"verifyStatus"] integerValue] == 0) {//0:待审核  1:审核通过   2:审核未通过
                [self createWaitingAudit];
            }
            else if ([[dict objectForKey:@"verifyStatus"] integerValue] == 1){
                [self createUI];
            }
            else{
                [self createUI];
            }
        }
        else{
            [self createUI];
        }
    } failure:^(NSURLSessionDataTask * _Nonnull task, NSError * _Nonnull error) {
        
    }];
    
}



#pragma mark --创建审核中界面
-(void)createWaitingAudit
{
    UIImageView* imgv = [[UIImageView alloc]initWithFrame:CGRectMake((SCREEN_WIDTH - 146)/2, 42, 146, 140)];
    imgv.image = [UIImage imageNamed:@"waitAudit"];
//    if (<#condition#>) {
//        <#statements#>
//    }
    [self.view addSubview:imgv];
    
    UILabel* labelSucc = [[UILabel alloc]initWithFrame:CGRectMake(20, 212, SCREEN_WIDTH - 40, 15)];
    labelSucc.text = @"审核中······";
    labelSucc.textColor = [Utility colorWithHexString:@"333333" alpha:1];
    labelSucc.textAlignment = NSTextAlignmentCenter;
    labelSucc.font = [UIFont systemFontOfSize: 15];
    [self.view addSubview:labelSucc];
    
    UILabel* labelFinish = [[UILabel alloc]initWithFrame:CGRectMake(20, 246, SCREEN_WIDTH - 40, 13)];
    labelFinish.text = @"请耐心等待结果";
    labelFinish.textColor = [Utility colorWithHexString:@"999999" alpha:1];
    labelFinish.textAlignment = NSTextAlignmentCenter;
    labelFinish.font = [UIFont systemFontOfSize: 13];
    [self.view addSubview:labelFinish];
    
    UILabel* labelTime = [[UILabel alloc]initWithFrame:CGRectMake(20, 269, SCREEN_WIDTH - 40, 13)];
    labelTime.text = @"我们将在1~3天内审核您的申请";
    labelTime.textColor = [Utility colorWithHexString:@"999999" alpha:1];
    labelTime.textAlignment = NSTextAlignmentCenter;
    labelTime.font = [UIFont systemFontOfSize: 13];
    [self.view addSubview:labelTime];
    
    UIButton* btnDra = [UIButton buttonWithType:UIButtonTypeCustom];
    btnDra.frame = CGRectMake(15, 322, SCREEN_WIDTH - 30, 50);
    [btnDra setTitle:@"重新提交" forState:UIControlStateNormal];
    [self.view addSubview:btnDra];
    btnDra.backgroundColor = GOLDCOLOR;
    btnDra.titleLabel.font = [UIFont systemFontOfSize:18];
    btnDra.layer.cornerRadius = 5;
    btnDra.layer.masksToBounds = YES;
    [btnDra addTarget:self action:@selector(recordClick) forControlEvents:UIControlEventTouchUpInside];
}
-(void)recordClick
{
    [self createUI];
}
#pragma mark --创建审核通过界面
-(void)createPassAudit
{
    UIImageView* imgv = [[UIImageView alloc]initWithFrame:CGRectMake((SCREEN_WIDTH - 122)/2, 50, 122, 122)];
    imgv.image = [UIImage imageNamed:@"waitAudit"];
    [self.view addSubview:imgv];
    
    UILabel* labelSucc = [[UILabel alloc]initWithFrame:CGRectMake(20, 222, SCREEN_WIDTH - 40, 18)];
    labelSucc.text = @"认证成功";
    labelSucc.textColor = [Utility colorWithHexString:@"333333" alpha:1];
    labelSucc.textAlignment = NSTextAlignmentCenter;
    labelSucc.font = [UIFont systemFontOfSize: 18];
    [self.view addSubview:labelSucc];
    
    UILabel* labelOpen = [[UILabel alloc]initWithFrame:CGRectMake(20, 250, SCREEN_WIDTH - 40, 18)];
    labelOpen.text = @"开启你的真实世界";
    labelOpen.textColor = [Utility colorWithHexString:@"333333" alpha:1];
    labelOpen.textAlignment = NSTextAlignmentCenter;
    labelOpen.font = [UIFont systemFontOfSize: 18];
    [self.view addSubview:labelOpen];
}


-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    [UIApplication sharedApplication].statusBarStyle = UIStatusBarStyleDefault;
    [[UIApplication sharedApplication] setStatusBarHidden:NO withAnimation:UIStatusBarAnimationNone];

}
#pragma mark - UI相关
- (void)createUI{
    
    
    self.myTableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT) style:UITableViewStylePlain];
    self.myTableView.delegate = self;
    self.myTableView.dataSource = self;
    self.myTableView.bounces = NO;
    self.myTableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    [self.view addSubview:self.myTableView];
    self.myTableView.tableFooterView = [UIView new];
    [self.myTableView setSeparatorColor:[Utility colorWithHexString:@"efefef" alpha:1]];
    UIView* view = [[UIView alloc]initWithFrame:CGRectMake(0, SCREEN_HEIGHT - 85*SCREEN_WIDTH/375 - 64, SCREEN_WIDTH, 85*SCREEN_WIDTH/375)];
    view.backgroundColor = [Utility colorWithHexString:@"ffffff" alpha:1];
    [self.view addSubview:view];
    
    UIButton* btnDra = [UIButton buttonWithType:UIButtonTypeCustom];
    btnDra.frame = CGRectMake(10*SCREEN_WIDTH/375, 15*SCREEN_WIDTH/375, SCREEN_WIDTH - 20*SCREEN_WIDTH/375, 44*SCREEN_WIDTH/375);
    [btnDra setTitle:@"提交" forState:UIControlStateNormal];
    [view addSubview:btnDra];
    btnDra.backgroundColor = GOLDCOLOR;
    btnDra.titleLabel.font = [UIFont systemFontOfSize:18];
    btnDra.layer.cornerRadius = 22;
    btnDra.layer.masksToBounds = YES;
    [btnDra addTarget:self action:@selector(withdraClick:) forControlEvents:UIControlEventTouchUpInside];
}
#pragma mark --提交按钮
-(void)withdraClick:(UIButton* )btn{
    btn.userInteractionEnabled = NO;
    [MBProgressHUD showHUDAddedTo:self.view animated:YES];
    NSData *data = [NSData dataWithContentsOfURL:_videoURL];
    NSMutableDictionary* dictVideo = [[NSMutableDictionary alloc]init];
    [dictVideo setObject:@(_videoDegress) forKey:@"rotate"];   //视频旋转角度
    [TLHTTPRequest MY_postToUrlString:UploadFileURL parameters:dictVideo fileData:data name:@"video" fileName:@"123" mimeType:1 response:Data success:^(NSURLSessionDataTask * _Nonnull task, NSDictionary * _Nonnull data) {
        if ([[data objectForKey:@"ret"] integerValue] == 0) {
            NSMutableDictionary* dict = [[NSMutableDictionary alloc]init];
            [dict setObject:[[data objectForKey:@"info"]objectForKey:@"fid"] forKey:@"fid"];
            [TLHTTPRequest MY_postWithBaseUrl:VideoIDentityUrl parameters:dict success:^(NSURLSessionDataTask * _Nonnull task, NSDictionary * _Nonnull data) {
                [MBProgressHUD hideHUDForView:self.view animated:YES];
                btn.userInteractionEnabled = YES;
                self.navigationItem.rightBarButtonItem.enabled=YES;
                if ([[data objectForKey:@"ret"] boolValue] == 0) {
                    [self.navigationController popViewControllerAnimated:YES];
                }
                else{
                    if ([data objectForKey:@"msg"]) {
                        [LQProgressHud showMessage:[data objectForKey:@"msg"]];
                    }
                }
            } failure:^(NSURLSessionDataTask * _Nonnull task, NSError * _Nonnull error) {
                [MBProgressHUD hideHUDForView:self.view animated:YES];
                btn.userInteractionEnabled = YES;
                self.navigationItem.rightBarButtonItem.enabled=YES;
                [LQProgressHud showMessage:@"发布失败"];
            }];
        }
        else{
            [MBProgressHUD hideHUDForView:self.view animated:YES];
            btn.userInteractionEnabled = YES;
            self.navigationItem.rightBarButtonItem.enabled=YES;
            if ([data objectForKey:@"msg"]) {
                [LQProgressHud showMessage:[data objectForKey:@"msg"]];
            }
        }
    } failure:^(NSURLSessionDataTask * _Nonnull task, NSError * _Nonnull error) {
        [MBProgressHUD hideHUDForView:self.view animated:YES];
        btn.userInteractionEnabled = YES;
        self.navigationItem.rightBarButtonItem.enabled=YES;
        [LQProgressHud showMessage:@"发布失败"];
    }];
}

#pragma mark - 代理相关
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return SCREEN_WIDTH >= 375 ? 168*SCREEN_WIDTH/375 : 168;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 1;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 33*SCREEN_WIDTH/375;
}

-(UIView*)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    UIView* view = [[UIView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 33*SCREEN_WIDTH/375)];
    view.backgroundColor = [Utility colorWithHexString:@"f8f8f8" alpha:1];
    
    UILabel* label = [[UILabel alloc]initWithFrame:CGRectMake(15, 0, SCREEN_WIDTH - 30, 33*SCREEN_WIDTH/375)];
    label.textColor = [Utility colorWithHexString:@"999999" alpha:1];
    label.text = @"上传视频";
    label.font = [UIFont systemFontOfSize:13];
    [view addSubview:label];
    return view;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *cellId = @"MY_TTLFacePhotoTableViewCell";
    MY_TTLFacePhotoTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellId];
    if (cell == nil) {
        cell = [[[NSBundle mainBundle]loadNibNamed:@"MY_TTLFacePhotoTableViewCell" owner:self options:nil] lastObject];
    }
    if (_imageFirst == nil) {
        NSLog(@"1111");
        cell.imgvIcon.image = [UIImage imageNamed:@"addFace"];
    }
    else{
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.7 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            cell.imgvIcon.image = _imageFirst;
            [LQProgressHud hide];
        });
    }
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    cell.labelDetail.text = @"添加视频时，需要说出“我爱MOYO”，视频时长不超过10s";
    return cell;
   
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [self chooseVideo];
    
}


#pragma mark --视频选择
- (void)chooseVideo
{
    
    UIAlertAction * act1 = [UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {
        //        _photos = 1;
    }];
    
    UIAlertAction * act2 = [UIAlertAction actionWithTitle:@"相册" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        //相册中提取视频
        UIImagePickerController* imPc = [[UIImagePickerController alloc]init];
        imPc.delegate = self;
        imPc.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;//sourcetype有三种分别是camera，photoLibrary和photoAlbum
        NSArray *availableMedia = [UIImagePickerController availableMediaTypesForSourceType:UIImagePickerControllerSourceTypePhotoLibrary];//Camera所支持的Media格式都有哪些,共有两个分别是@"public.image",@"public.movie"
        imPc.mediaTypes = [NSArray arrayWithObject:availableMedia[1]];//设置媒体类型为public.movie
        [self presentViewController:imPc animated:YES completion:^{
            [[UIApplication sharedApplication] setStatusBarStyle:UIStatusBarStyleLightContent];
        }];
//        [imPc dismissViewControllerAnimated:NO completion:^{
//            // 改变状态栏的颜色  改变为白色
//            [[UIApplication sharedApplication] setStatusBarStyle:UIStatusBarStyleDefault];
//        }];
    }];
    
    UIAlertAction * act3 = [UIAlertAction actionWithTitle:@"视频" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        //相册中提取视频
        UIImagePickerController* imPc = [[UIImagePickerController alloc]init];
        imPc.delegate = self;
        imPc.sourceType = UIImagePickerControllerSourceTypeCamera;//sourcetype有三种分别是camera，photoLibrary和photoAlbum
        NSArray *availableMedia = [UIImagePickerController availableMediaTypesForSourceType:UIImagePickerControllerSourceTypeCamera];//Camera所支持的Media格式都有哪些,共有两个分别是@"public.image",@"public.movie"
        imPc.mediaTypes = [NSArray arrayWithObject:availableMedia[1]];//设置媒体类型为public.movie
        [self presentViewController:imPc animated:YES completion:^{
            [[UIApplication sharedApplication] setStatusBarStyle:UIStatusBarStyleLightContent];
        }];
//        [imPc dismissViewControllerAnimated:NO completion:^{
//            // 改变状态栏的颜色  改变为白色
//            [[UIApplication sharedApplication] setStatusBarStyle:UIStatusBarStyleDefault];
//        }];
        
    }];
    
    UIAlertController * aleVC = [UIAlertController alertControllerWithTitle:@"提示" message:@"选择视频方式" preferredStyle:UIAlertControllerStyleActionSheet];
    [aleVC addAction:act1];
    [aleVC addAction:act2];
    [aleVC addAction:act3];
    [self presentViewController:aleVC animated:YES completion:nil];
    
    
}

#pragma mark -- 上传图片
- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary<NSString *,id> *)info {
    
    NSURL *sourceURL = [info objectForKey:UIImagePickerControllerMediaURL];
    NSURL *newVideoUrl ; //一般.mp4
    NSDateFormatter *formater = [[NSDateFormatter alloc] init];//用时间给文件全名，以免重复，在测试的时候其实可以判断文件是否存在若存在，则删除，重新生成文件即可
    [formater setDateFormat:@"yyyy-MM-dd-HH:mm:ss"];
    newVideoUrl = [NSURL fileURLWithPath:[NSHomeDirectory() stringByAppendingFormat:@"/Documents/output-%@.mp4", [formater stringFromDate:[NSDate date]]]] ;//这个是保存在app自己的沙盒路径里，后面可以选择是否在上传后删除掉。我建议删除掉，免得占空间。
    [picker dismissViewControllerAnimated:YES completion:^{
        [[UIApplication sharedApplication] setStatusBarStyle:UIStatusBarStyleDefault];
        [[UIApplication sharedApplication] setStatusBarHidden:NO withAnimation:UIStatusBarAnimationNone];

    }];
    [self convertVideoQuailtyWithInputURL:sourceURL outputURL:newVideoUrl completeHandler:nil];

}


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
    }
    [exportSession exportAsynchronouslyWithCompletionHandler:^(void)
     {
         switch (exportSession.status) {
             case AVAssetExportSessionStatusCancelled:
//                 NSLog(@"AVAssetExportSessionStatusCancelled");
                 break;
             case AVAssetExportSessionStatusUnknown:
//                 NSLog(@"AVAssetExportSessionStatusUnknown");
                 break;
             case AVAssetExportSessionStatusWaiting:
//                 NSLog(@"AVAssetExportSessionStatusWaiting");
                 break;
             case AVAssetExportSessionStatusExporting:
//                 NSLog(@"AVAssetExportSessionStatusExporting");
                 break;
             case AVAssetExportSessionStatusCompleted:
//                 NSLog(@"AVAssetExportSessionStatusCompleted");
                 //UISaveVideoAtPathToSavedPhotosAlbum([outputURL path], self, nil, NULL);//这个是保存到手机相册
                 _videoLength = [self getVideoDuration:outputURL];
                 [self alertUploadVideo:outputURL];
                 break;
             case AVAssetExportSessionStatusFailed:
//                 NSLog(@"AVAssetExportSessionStatusFailed");
                 break;
         }
         
     }];
    
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


-(void)alertUploadVideo:(NSURL*)URL{
    
    if(_videoLength <= 10){
        [self uploadVideo:URL];
    }
    else{
        [[NSNotificationCenter defaultCenter] postNotificationName:@"refreshwebpages" object:nil userInfo:nil];
        [[NSFileManager defaultManager] removeItemAtPath:[URL path] error:nil];//取消之后就删除，以免占用手机硬盘空间（沙盒）
        [LQProgressHud showMessage:@"视频长度不能超过10s"];
    }
    
}

#pragma mark --上传视频
-(void)uploadVideo:(NSURL*)URL{
    
    [MBProgressHUD hideHUDForView:self.view animated:YES];
    _videoDegress = [self degressFromVideoFileWithURL:URL];
    _imageFirst = [self getVideoPreViewImage:URL];
    _videoURL = URL;
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.7 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [LQProgressHud showLoading:@"正在处理"];
        if (_imageFirst != nil) {
            [self.myTableView reloadData];
        }
    });
    
    
    
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
