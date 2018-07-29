//
//  MY_TTLDynamicIssueViewController.m
//  TogetherLu
//
//  Created by MadridLee on 2016/12/30.
//  Copyright © 2016年 TogetherLu. All rights reserved.
//

#import "MY_TTLDynamicIssueViewController.h"
#import "IQKeyboardManager.h"

#import "TZImagePickerController.h"
#import "UIView+Layout.h"
#import "TZTestCell.h"
#import <AssetsLibrary/AssetsLibrary.h>
#import <Photos/Photos.h>
#import "LxGridViewFlowLayout.h"
#import "TZImageManager.h"
#import "TZVideoPlayerController.h"
#import "TZPhotoPreviewController.h"

#define MAX_LIMIT_NUMS     50
#define MaxCount 1
#define EveryNumber 4
@interface MY_TTLDynamicIssueViewController ()<UITextViewDelegate,TZImagePickerControllerDelegate,UICollectionViewDataSource,UICollectionViewDelegate,UIImagePickerControllerDelegate,UIAlertViewDelegate,UINavigationControllerDelegate>
{
    UITextView* _textView;
    UILabel* _placeholder_label;
    UILabel* _labelNum;
    UIButton* _btnAddImg;
    NSInteger _currentSelectShare;
    UIView* _bgView;
    NSArray * _shareAry;
    
    NSMutableArray *_selectedPhotos;
    NSMutableArray *_selectedAssets;
    BOOL _isSelectOriginalPhoto;
    
    CGFloat _itemWH;
    CGFloat _margin;
    
    BOOL _isChooseVideo;    //默认NO，不选视频，选择后改为yes；
    
    NSInteger _videoDegress;    //视频旋转角度
    UIImage* _imageFirst;   //视频首帧图片用于展示
    NSURL* _videoURL;   //视频地址
    NSInteger _videoLength; //视频时间长度

    
    
    //。  这些暂时不要，我怕以后要加，先留着
    NSString* _strSmallUrl; //上传视频返回占位图  小图
    NSString* _strFullUrl ; //上传视频返回的地址
    NSNumber* _numVideoHeight,  * _numVideoWidth;  //视频高，宽
}
@property (nonatomic, strong) UIImagePickerController *imagePickerVc;
@property (nonatomic, strong) UICollectionView *collectionView;
@property (strong, nonatomic) NSMutableDictionary* dict;//上传数据
@property (strong, nonatomic) NSMutableArray*      pageArray;//t图片


@end

@implementation MY_TTLDynamicIssueViewController

- (void)viewWillDisappear:(BOOL)animated{
    [super viewWillDisappear:animated];
    
    //    self.navigationController.navigationBar.translucent = YES;
}
-(void)viewDidAppear:(BOOL)animated{
    [super viewDidAppear:animated];
    [[IQKeyboardManager sharedManager] setEnable:NO];
}
-(void)viewDidDisappear:(BOOL)animated{
    [super viewDidDisappear:animated];
    [[IQKeyboardManager sharedManager] setEnable:YES];
}
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    //    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(hideImagePicker) name:@"hideImagePicker" object:nil];
    UIView* view = [[UIView alloc]initWithFrame:CGRectMake(1, 1, 1, 1)];
    [self.view addSubview:view];
    
    self.title = @"动态发布";
    //  导航按钮--左
    [self addNavBtn:@"取消" isLeft:YES target:self action:@selector(leftBarAction) bgImageName:nil];
    //  导航按钮--右
    [self addNavBtn:@"发布" isLeft:NO target:self action:@selector(rightBarAction:) bgImageName:nil];
    
    self.view.backgroundColor = [Utility colorWithHexString:@"f8f8f8" alpha:1];
    _selectedPhotos = [NSMutableArray array];
    _selectedAssets = [NSMutableArray array];
    
    [self uiConfig];
    [self configCollectionView];
}

#pragma clang diagnostic push
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

-(void)leftBarAction{
    
    [self.navigationController popViewControllerAnimated:YES];
    
}
-(void)rightBarAction:(id)sender
{
    NSLog(@"11111");
    if ([Utility isBlankString:_textView.text]) {
        [LQProgressHud showMessage:@"请输入文字"];
        return;
    }
    if (_selectedPhotos.count == 0 || _selectedPhotos == nil) {
        [LQProgressHud showMessage:@"请选择图片"];
        return;
    }
    //    [self.dict setObject:USERKEY forKey:@"key"];
    if (_textView.text.length >= 50) {
        [LQProgressHud showMessage:@"输入文字不能超过50个字"];
        return;
    }
    
    
    [MBProgressHUD showHUDAddedTo:self.view animated:YES];
    self.navigationItem.rightBarButtonItem.enabled=NO;
    if (_isChooseVideo == NO) {
        NSData* data = UIImageJPEGRepresentation(_selectedPhotos[0], 0.5);
        [TLHTTPRequest MY_postDataAndImageRequest:UploadFileURL parameters:nil imageDataArr:@[data] success:^(NSURLSessionDataTask * _Nonnull task, NSDictionary * _Nonnull data) {
            if ([[data objectForKey:@"ret"] integerValue] == 0) {
                [self.dict setObject:[[data objectForKey:@"info"]objectForKey:@"fid"] forKey:@"fid"];
                [self.dict setObject:_textView.text forKey:@"content"];
                [TLHTTPRequest MY_postWithBaseUrl:DynamicAddUrl parameters:self.dict success:^(NSURLSessionDataTask * _Nonnull task, NSDictionary * _Nonnull data) {
                    [MBProgressHUD hideHUDForView:self.view animated:YES];
                    self.navigationItem.rightBarButtonItem.enabled=YES;
                    if ([[data objectForKey:@"ret"] boolValue] == 0) {
                        [[NSNotificationCenter defaultCenter]postNotificationName:KRefresDynamicNotification object:nil userInfo:nil];
                        
                        [self.navigationController popViewControllerAnimated:YES];
                        
                    }
                    else{
                        if ([data objectForKey:@"msg"]) {
                            [LQProgressHud showMessage:[data objectForKey:@"msg"]];
                        }
                    }
                } failure:^(NSURLSessionDataTask * _Nonnull task, NSError * _Nonnull error) {
                    [MBProgressHUD hideHUDForView:self.view animated:YES];
                    self.navigationItem.rightBarButtonItem.enabled=YES;
                    [LQProgressHud showMessage:@"发布失败"];
                }];
            }
            else{
                [MBProgressHUD hideHUDForView:self.view animated:YES];
                self.navigationItem.rightBarButtonItem.enabled=YES;
                if ([data objectForKey:@"msg"]) {
                    [LQProgressHud showMessage:[data objectForKey:@"msg"]];
                }
            }
        } failure:^(NSURLSessionDataTask * _Nonnull task, NSError * _Nonnull error) {
            [MBProgressHUD hideHUDForView:self.view animated:YES];
            self.navigationItem.rightBarButtonItem.enabled=YES;
            [LQProgressHud showMessage:@"发布失败"];
        }];
    }
    else{
        NSData *data = [NSData dataWithContentsOfURL:_videoURL];
        NSMutableDictionary* dictVideo = [[NSMutableDictionary alloc]init];
        [dictVideo setObject:@(_videoDegress) forKey:@"rotate"];   //视频旋转角度
        [TLHTTPRequest MY_postToUrlString:UploadFileURL parameters:dictVideo fileData:data name:@"video" fileName:@"123" mimeType:1 response:Data success:^(NSURLSessionDataTask * _Nonnull task, NSDictionary * _Nonnull data) {
            if ([[data objectForKey:@"ret"] integerValue] == 0) {
                [self.dict setObject:[[data objectForKey:@"info"]objectForKey:@"fid"] forKey:@"fid"];
                [self.dict setObject:_textView.text forKey:@"content"];
                [TLHTTPRequest MY_postWithBaseUrl:DynamicAddUrl parameters:self.dict success:^(NSURLSessionDataTask * _Nonnull task, NSDictionary * _Nonnull data) {
                    [MBProgressHUD hideHUDForView:self.view animated:YES];
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
                    self.navigationItem.rightBarButtonItem.enabled=YES;
                    [LQProgressHud showMessage:@"发布失败"];
                }];
            }
            else{
                [MBProgressHUD hideHUDForView:self.view animated:YES];
                self.navigationItem.rightBarButtonItem.enabled=YES;
                if ([data objectForKey:@"msg"]) {
                    [LQProgressHud showMessage:[data objectForKey:@"msg"]];
                }
            }
        } failure:^(NSURLSessionDataTask * _Nonnull task, NSError * _Nonnull error) {
            [MBProgressHUD hideHUDForView:self.view animated:YES];
            self.navigationItem.rightBarButtonItem.enabled=YES;
            [LQProgressHud showMessage:@"发布失败"];
        }];
    }
}

-(void)uiConfig
{
    _bgView = [[UIView alloc]initWithFrame:CGRectMake(0, 15*SCREEN_WIDTH/375, SCREEN_WIDTH, 274*SCREEN_WIDTH/375)];
    [self.view addSubview:_bgView];
    _bgView.backgroundColor = [Utility colorWithHexString:@"ffffff" alpha:1];
    _bgView.layer.cornerRadius = 4;
    _bgView.layer.masksToBounds = YES;
    
    _textView = [[UITextView alloc]initWithFrame:CGRectMake(15, 10, SCREEN_WIDTH - 30, 130*SCREEN_WIDTH/375)];
    //    textView.text = @"";
    [_bgView addSubview:_textView];
    //    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(infoAction)name:UITextFieldTextDidChangeNotification object:nil];
    
    _textView.font = [UIFont systemFontOfSize:14];
    _textView.delegate = self;
    
    _placeholder_label = [[UILabel alloc] initWithFrame:CGRectMake(15, _textView.frame.origin.y, 300, 30)];
    _placeholder_label.text = @"多发点美美哒的照片和视频，会吸引更多粉丝哦";
    _placeholder_label.font =  [UIFont systemFontOfSize:14];
    _placeholder_label.textColor = [Utility colorWithHexString:@"c9c9c9" alpha:1.0];
    _placeholder_label.layer.cornerRadius = 10;
    _placeholder_label.layer.masksToBounds = YES;
    [_bgView addSubview:_placeholder_label];
   
    
    
}



- (void)configCollectionView {
    // 如不需要长按排序效果，将LxGridViewFlowLayout类改成UICollectionViewFlowLayout即可
    UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc] init];
    _margin = 4;
    _itemWH = (self.view.tz_width - 2 * _margin - 4) / 4 - _margin;
    layout.itemSize = CGSizeMake(_itemWH, _itemWH);
    layout.minimumInteritemSpacing = _margin;
    layout.minimumLineSpacing = _margin;
    _collectionView = [[UICollectionView alloc] initWithFrame:CGRectMake(15, CGRectGetMaxY(_textView.frame) + 50*SCREEN_WIDTH/375, SCREEN_WIDTH - 30, 97*SCREEN_WIDTH/375) collectionViewLayout:layout];
    _collectionView.scrollEnabled = NO;
    _collectionView.alwaysBounceVertical = YES;
    _collectionView.backgroundColor = [UIColor whiteColor];
    _collectionView.contentInset = UIEdgeInsetsMake(4, 4, 4, 4);
    _collectionView.dataSource = self;
    _collectionView.delegate = self;
    _collectionView.keyboardDismissMode = UIScrollViewKeyboardDismissModeOnDrag;
    [self.view addSubview:_collectionView];
    [_collectionView registerClass:[TZTestCell class] forCellWithReuseIdentifier:@"TZTestCell"];
    
    _labelNum = [[UILabel alloc]initWithFrame:CGRectMake(_collectionView.frame.size.width - 135*SCREEN_WIDTH/375, _collectionView.frame.size.height - 36*SCREEN_WIDTH/375, 125*SCREEN_WIDTH/375, 34*SCREEN_WIDTH/375)];
    _labelNum.font = [UIFont systemFontOfSize:12];
    _labelNum.text = @"（0/50）";
    _labelNum.textAlignment = NSTextAlignmentRight;
    _labelNum.textColor = [Utility colorWithHexString:@"333333" alpha:1];
    [_collectionView addSubview:_labelNum];
}



#pragma mark UICollectionView

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return 1;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    TZTestCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"TZTestCell" forIndexPath:indexPath];
    cell.videoImageView.hidden = YES;
    if (indexPath.row == _selectedPhotos.count) {
        cell.imageView.image = [UIImage imageNamed:@"AlbumAddBtn.png"];
        cell.deleteBtn.hidden = YES;
    } else {
        cell.imageView.image = _selectedPhotos[indexPath.row];
        if (_selectedAssets.count > 0) {
            cell.asset = _selectedAssets[indexPath.row];
        }
        else{
//            [cell.imageView sd_setImageWithURL:[NSURL URLWithString:_strSmallUrl] placeholderImage:nil];
            if (_imageFirst != nil) {
                cell.imageView.image = _imageFirst;
            }
            else{
                cell.imageView.image = nil;
            }
        }
        cell.deleteBtn.hidden = NO;
    }
    cell.deleteBtn.tag = indexPath.row;
    [cell.deleteBtn addTarget:self action:@selector(deleteBtnClik:) forControlEvents:UIControlEventTouchUpInside];
    return cell;
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.row == _selectedAssets.count) {
        //        BOOL showSheet = self.showSheetSwitch.isOn;
        BOOL showSheet = YES;
        if (showSheet) {
            
            UIAlertAction * act1 = [UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {
                //        _photos = 1;
                
            }];
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
            
        } else {
            [self pushImagePickerController];
        }
    } else { // preview photos or video / 预览照片或者视频
        id asset = _selectedAssets[indexPath.row];
        BOOL isVideo = NO;
        if ([asset isKindOfClass:[PHAsset class]]) {
            PHAsset *phAsset = asset;
            isVideo = phAsset.mediaType == PHAssetMediaTypeVideo;
        } else if ([asset isKindOfClass:[ALAsset class]]) {
            ALAsset *alAsset = asset;
            isVideo = [[alAsset valueForProperty:ALAssetPropertyType] isEqualToString:ALAssetTypeVideo];
        }
        if (isVideo) { // perview video / 预览视频
            TZVideoPlayerController *vc = [[TZVideoPlayerController alloc] init];
            TZAssetModel *model = [TZAssetModel modelWithAsset:asset type:TZAssetModelMediaTypeVideo timeLength:@""];
            vc.model = model;
            [self presentViewController:vc animated:YES completion:nil];
        } else { // preview photos / 预览照片
            TZImagePickerController *imagePickerVc = [[TZImagePickerController alloc] initWithSelectedAssets:_selectedAssets selectedPhotos:_selectedPhotos index:indexPath.row];
            imagePickerVc.maxImagesCount = MaxCount;
            imagePickerVc.allowPickingOriginalPhoto = YES;
            imagePickerVc.isSelectOriginalPhoto = _isSelectOriginalPhoto;
            [imagePickerVc setDidFinishPickingPhotosHandle:^(NSArray<UIImage *> *photos, NSArray *assets, BOOL isSelectOriginalPhoto) {
                _selectedPhotos = [NSMutableArray arrayWithArray:photos];
                _selectedAssets = [NSMutableArray arrayWithArray:assets];
                _isSelectOriginalPhoto = isSelectOriginalPhoto;
                [_collectionView reloadData];
                //                _collectionView.contentSize = CGSizeMake(0, ((_selectedPhotos.count + 2) / 3 ) * (_margin + _itemWH));
            }];
            [self presentViewController:imagePickerVc animated:YES completion:nil];
        }
    }
}

#pragma mark - LxGridViewDataSource

/// 以下三个方法为长按排序相关代码
- (BOOL)collectionView:(UICollectionView *)collectionView canMoveItemAtIndexPath:(NSIndexPath *)indexPath {
    return indexPath.item < _selectedPhotos.count;
}

- (BOOL)collectionView:(UICollectionView *)collectionView itemAtIndexPath:(NSIndexPath *)sourceIndexPath canMoveToIndexPath:(NSIndexPath *)destinationIndexPath {
    return (sourceIndexPath.item < _selectedPhotos.count && destinationIndexPath.item < _selectedPhotos.count);
}

- (void)collectionView:(UICollectionView *)collectionView itemAtIndexPath:(NSIndexPath *)sourceIndexPath didMoveToIndexPath:(NSIndexPath *)destinationIndexPath {
    UIImage *image = _selectedPhotos[sourceIndexPath.item];
    [_selectedPhotos removeObjectAtIndex:sourceIndexPath.item];
    [_selectedPhotos insertObject:image atIndex:destinationIndexPath.item];
    
    id asset = _selectedAssets[sourceIndexPath.item];
    [_selectedAssets removeObjectAtIndex:sourceIndexPath.item];
    [_selectedAssets insertObject:asset atIndex:destinationIndexPath.item];
    
    [_collectionView reloadData];
}

#pragma mark - TZImagePickerController

- (void)pushImagePickerController {
    if (MaxCount <= 0) {
        return;
    }
    TZImagePickerController *imagePickerVc = [[TZImagePickerController alloc] initWithMaxImagesCount:MaxCount columnNumber:EveryNumber delegate:self pushPhotoPickerVc:YES];
    
    
#pragma mark - 四类个性化设置，这些参数都可以不传，此时会走默认设置
    imagePickerVc.isSelectOriginalPhoto = _isSelectOriginalPhoto;
    
    if (MaxCount > 1) {
        // 1.设置目前已经选中的图片数组
        imagePickerVc.selectedAssets = _selectedAssets; // 目前已经选中的图片数组
    }
    imagePickerVc.allowTakePicture = NO; // 在内部显示拍照按钮
    
    // 2. Set the appearance
    // 2. 在这里设置imagePickerVc的外观
    // imagePickerVc.navigationBar.barTintColor = [UIColor greenColor];
    // imagePickerVc.oKButtonTitleColorDisabled = [UIColor lightGrayColor];
    // imagePickerVc.oKButtonTitleColorNormal = [UIColor greenColor];
    
    // 3. Set allow picking video & photo & originalPhoto or not
    // 3. 设置是否可以选择视频/图片/原图
    imagePickerVc.allowPickingVideo = YES;
    imagePickerVc.allowPickingImage = YES;
    imagePickerVc.allowPickingOriginalPhoto = YES;
    
    // 4. 照片排列按修改时间升序
    imagePickerVc.sortAscendingByModificationDate = YES;
    
    // imagePickerVc.minImagesCount = 3;
    // imagePickerVc.alwaysEnableDoneBtn = YES;
    
    // imagePickerVc.minPhotoWidthSelectable = 3000;
    // imagePickerVc.minPhotoHeightSelectable = 2000;
    
    /// 5. Single selection mode, valid when maxImagesCount = 1
    /// 5. 单选模式,maxImagesCount为1时才生效
    imagePickerVc.showSelectBtn = YES;
    imagePickerVc.allowCrop = NO;
    imagePickerVc.needCircleCrop = NO;
    //    imagePickerVc.circleCropRadius = 100;
    /*
     [imagePickerVc setCropViewSettingBlock:^(UIView *cropView) {
     cropView.layer.borderColor = [UIColor redColor].CGColor;
     cropView.layer.borderWidth = 2.0;
     }];*/
#pragma mark - 到这里为止
    
    // You can get the photos by block, the same as by delegate.
    // 你可以通过block或者代理，来得到用户选择的照片.
    [imagePickerVc setDidFinishPickingPhotosHandle:^(NSArray<UIImage *> *photos, NSArray *assets, BOOL isSelectOriginalPhoto) {
        _isChooseVideo = NO;
    }];
    
    [self presentViewController:imagePickerVc animated:YES completion:nil];
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
            NSLog(@"模拟器中无法打开照相机,请在真机中使用");
        }
    }
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
                            [self refreshCollectionViewWithAddedAsset:asset image:cropImage];
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

    _selectedPhotos = [NSMutableArray arrayWithArray:photos];
    _selectedAssets = [NSMutableArray arrayWithArray:assets];
    _isSelectOriginalPhoto = isSelectOriginalPhoto;
    [_collectionView reloadData];
    // _collectionView.contentSize = CGSizeMake(0, ((_selectedPhotos.count + 2) / 3 ) * (_margin + _itemWH));
    _isChooseVideo = NO;
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
        dispatch_async(dispatch_get_main_queue(), ^{
            [weakSelf alertUploadVideo:url];
        });
        [_collectionView reloadData];
        
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


- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    [self.view endEditing:YES];
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


#pragma textViewDelegate
-(void)textViewDidChange:(UITextView *)textView
{
    //    if (_textView.text.length != 0) {
    _placeholder_label.text = @"";
    _placeholder_label.hidden = YES;
    //    }
    //    else{
    //        _placeholder_label.text = @"多发点美美哒的照片和视频，会吸引更多粉丝哦";
    //        _placeholder_label.hidden = NO;
    //    }
    
    NSString  *nsTextContent =  [textView.text stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceCharacterSet]];
    NSInteger existTextNum = nsTextContent.length;
    
    if (existTextNum > MAX_LIMIT_NUMS)
    {
        //截取到最大位置的字符
        NSString *s = [nsTextContent substringToIndex:MAX_LIMIT_NUMS];
        [textView setText:s];
        existTextNum = s.length;
    }
    //不让显示负数
    _labelNum.text = [NSString stringWithFormat:@"%td/%d",MAX(0, existTextNum),MAX_LIMIT_NUMS];
}

- (BOOL)textView:(UITextView *)textView shouldChangeTextInRange:(NSRange)range
 replacementText:(NSString *)text
{
    NSString *comcatstr = [textView.text stringByReplacingCharactersInRange:range withString:text];
    NSInteger caninputlen = MAX_LIMIT_NUMS - comcatstr.length;
    
    //为了粘贴过来显示字数问题
    if ([textView.text length] == 0 && range.location == 0 && range.length == 0) {
        NSInteger textLength = text.length>MAX_LIMIT_NUMS?MAX_LIMIT_NUMS:text.length;
        
        _labelNum.text = [NSString stringWithFormat:@"%td/%d",textLength,MAX_LIMIT_NUMS];
    }
    
    if (caninputlen >= 0)
    {
        if ([@"\n" isEqualToString:text] == YES)
        {
            [textView resignFirstResponder];
            if (_textView.text.length == 0)
            {
                _placeholder_label.text = @"多发点美美哒的照片和视频，会吸引更多粉丝哦";
                _placeholder_label.hidden = NO;
            }
            return NO;
        }
        return YES;
    }
    else
    {
        NSInteger len = text.length + caninputlen;
        //防止当text.length + caninputlen < 0时，使得rg.length为一个非法最大正数出错
        NSRange rg = {0,MAX(len,0)};
        
        if (rg.length > 0)
        {
            NSString *s = [text substringWithRange:rg];
            
            [textView setText:[textView.text stringByReplacingCharactersInRange:range withString:s]];
        }
        if ([@"\n" isEqualToString:text] == YES)
        {
            [textView resignFirstResponder];
            if (_textView.text.length == 0)
            {
                _placeholder_label.text = @"多发点美美哒的照片和视频，会吸引更多粉丝哦";
                _placeholder_label.hidden = NO;
            }
            return NO;
        }
        return NO;
    }
}

-(void)textViewDidBeginEditing:(UITextView *)textView{
    
    _placeholder_label.text = @"";
    _placeholder_label.hidden = YES;
    
}

-(void)textViewDidEndEditing:(UITextView *)textView
{
    if (_textView.text.length != 0) {
        _placeholder_label.text = @"";
        _placeholder_label.hidden = YES;
    }
    else{
        _placeholder_label.text = @"多发点美美哒的照片和视频，会吸引更多粉丝哦";
        _placeholder_label.hidden = NO;
    }
}


-(NSMutableDictionary *)dict
{
    if (!_dict) {
        _dict = [[NSMutableDictionary alloc]init];
    }
    return _dict;
}

-(NSMutableArray *)pageArray
{
    if (!_pageArray) {
        _pageArray = [[NSMutableArray alloc]init];
    }
    return _pageArray;
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
//                 NSLog(@"AVAssetExportSessionStatusExporting");
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
        [_collectionView reloadData];
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

- (void)dealloc {
    [[NSNotificationCenter defaultCenter] removeObserver:self];
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
