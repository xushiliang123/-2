//
//  DYBaseView.m
//  点击cell查看大图
//
//  Created by xudingyang on 16/8/21.
//  Copyright © 2016年 xudingyang. All rights reserved.
//

#define DYScreenW [UIApplication sharedApplication].keyWindow.frame.size.width
#define DYScreenH [UIApplication sharedApplication].keyWindow.frame.size.height
// 定义这个常量,就可以在使用Masonry不必总带着前缀 `mas_`:
#define MAS_SHORTHAND
// 定义这个常量,以支持在 Masonry 语法中自动将基本类型转换为 object 类型:
#define MAS_SHORTHAND_GLOBALS


#import "DYBaseView.h"
#import <Masonry.h>
#import <AVFoundation/AVFoundation.h>
#import "ZFPlayer.h"

@interface DYBaseView () <UIScrollViewDelegate,ZFPlayerDelegate>

/** currentRect scrollView中对应cell在window中的位置 */
@property (assign, nonatomic) CGRect currentRect;

/** baseView 用来放置scrollView的容器 */
@property (weak, nonatomic) UIView *baseView;
/** scrollView 用来展示图片的scrollView */
@property (weak, nonatomic) UIScrollView *scrollView;
/** currecntIndex scrollView中，当前图片的编号 */
@property (assign, nonatomic) NSInteger currecntIndex;
/** indexLabel 图片序号指示器 */
@property (weak, nonatomic) UILabel *indexLabel;


/** 当前modle */
@property (assign, nonatomic) PhotoLibModel *currecntModel;
// scrollView的三张图片
/** leftImageView */
@property (weak, nonatomic) UIImageView *leftImageView;
/** centerImageView */
@property (weak, nonatomic) UIImageView *centerImageView;
/** rightImageView */
@property (weak, nonatomic) UIImageView *rightImageView;


@property (strong, nonatomic) ZFPlayerView          * playerView;           //播放器视图
@property (nonatomic, strong) ZFPlayerControlView   * controlView;

@property (nonatomic, strong) ZFPlayerModel         * playerModel;

@end

@implementation DYBaseView

- (void)willMoveToSuperview:(UIView *)newSuperview {
    [self setupScrollView];
    [self setupIndicator];
}

- (void)setupScrollView {
    
//    [self.playerView resetToPlayNewVideo:self.playerModel];
    
    UIScrollView *scrollView = [[UIScrollView alloc] init];
    scrollView.frame = self.bounds;
    [self addSubview:scrollView];
    scrollView.backgroundColor = [UIColor clearColor];
    scrollView.contentSize = CGSizeMake(DYScreenW * 3, DYScreenH);
    scrollView.pagingEnabled = YES;
    scrollView.showsVerticalScrollIndicator = NO;
    scrollView.showsHorizontalScrollIndicator = NO;
    [scrollView setContentOffset:CGPointMake(DYScreenW, 0) animated:NO];
    scrollView.delegate = self;
    // 给scrollView添加手势，点击scrollView，大图缩小
    UITapGestureRecognizer *scrollViewGest = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(scrollViewDidClick)];
    [scrollView addGestureRecognizer:scrollViewGest];
    _scrollView = scrollView;
        
    // 设置初始图片
//    [self.playerView resetToPlayNewVideo:self.playerModel];
    
    // model
    PhotoLibModel * centeModel ;
    PhotoLibModel * leftModel ;
    PhotoLibModel * rightModel ;
    
    // url
    NSURL * centerUrl;
    NSURL * leftUrl;
    NSURL * rightUrl;
    
    if (_iconArray.count >1) {
        // 如果点击的是第一张
        if (self.index == 0) {
            
            centeModel = _iconArray[0];
            leftModel = _iconArray[_iconArray.count - 1];
            rightModel = _iconArray[1];
            
        } else if (self.index == _iconArray.count - 1) {   // 如果点击的是最后一张
            
            centeModel = _iconArray[_iconArray.count - 1];
            leftModel = _iconArray[_iconArray.count - 2];
            rightModel = _iconArray[0];
            
        } else {
            
            centeModel = _iconArray[self.index];
            leftModel = _iconArray[self.index - 1];
            rightModel = _iconArray[self.index + 1];
        }
    }else{
        centeModel = _iconArray[0];
        leftModel = _iconArray[_iconArray.count - 1];
        rightModel = _iconArray[0];
    }
   
//    if (leftModel) {
//        <#statements#>
//    }
    
    centerUrl = [NSURL URLWithString:centeModel.photoUrl];
    leftUrl = [NSURL URLWithString:leftModel.photoUrl];
    rightUrl = [NSURL URLWithString:rightModel.photoUrl];
    
    self.currecntIndex = self.index;
    if (!self.rectArray) {
        self.currentRect = CGRectMake(0, 0, self.mj_size.width, self.mj_size.height);
    }else if (self.rectArray.count == 1){
        self.currentRect = CGRectFromString(self.rectArray[0]);
    }else{
         self.currentRect = CGRectFromString(self.rectArray[self.index]);
    }
    
    
    self.indexLabel.text = [NSString stringWithFormat:@"%zd/%zd", self.currecntIndex+1, _iconArray.count];
    // 添加三个imageView，设置初始图片
    
    self.currecntModel = centeModel;
    
    
    UIImageView *leftImageView = [[UIImageView alloc] init];
    [leftImageView sd_setImageWithURL:leftUrl completed:^(UIImage *image, NSError *error, SDImageCacheType cacheType, NSURL *imageURL) {
        
        CGFloat leftHeight;
        if (image) {
            
            leftHeight =DYScreenW / image.size.width * image.size.height;
        }else{
            leftHeight = 0.0;
        }
        
        leftImageView.frame = CGRectMake(0, (DYScreenH-leftHeight)*0.5, DYScreenW, leftHeight);
       

    }];
    [scrollView addSubview:leftImageView];
    _leftImageView = leftImageView;
    
    UIImageView *centerImageView = [[UIImageView alloc] init];
    [centerImageView sd_setImageWithURL:centerUrl completed:^(UIImage *image, NSError *error, SDImageCacheType cacheType, NSURL *imageURL) {
    
        CGFloat centerHeight;
        if (image) {
            
            centerHeight =DYScreenW / image.size.width * image.size.height;
        }else{
            centerHeight = 0.0;
        }
        
        centerImageView.frame = CGRectMake(DYScreenW, (DYScreenH-centerHeight)*0.5, DYScreenW, centerHeight);
        
        
    }];
    [scrollView addSubview:centerImageView];
    _centerImageView = centerImageView;
    
    
    UIImageView *rightImageView = [[UIImageView alloc] init];
    [rightImageView sd_setImageWithURL:rightUrl completed:^(UIImage *image, NSError *error, SDImageCacheType cacheType, NSURL *imageURL) {
        
        CGFloat rightHeight;
        if (image) {
            
            rightHeight =DYScreenW / image.size.width * image.size.height;
        }else{
            rightHeight = 0.0;
        }
        
        rightImageView.frame = CGRectMake(DYScreenW*2, (DYScreenH-rightHeight)*0.5, DYScreenW, rightHeight);
       
    }];
    [scrollView addSubview:rightImageView];
    _rightImageView = rightImageView;
    
    
    // 取出字典中的第一视频URL
    if (centeModel.photoType.intValue == 1) {

        self.playerModel.fatherView = self.centerImageView;
        // 设置播放控制层和model
        [self.playerView playerControlView:nil playerModel:self.playerModel];
        
        // 自动播放
        [self.playerView autoPlayTheVideo];
    }
   
    if (self.iconArray.count == 1) {
        self.scrollView.scrollEnabled = NO;
    }
}

#pragma mark - 设置上边的图片下标指示器
- (void)setupIndicator {
    // 上边的图片序号指示器
    UILabel *indexLabel = [[UILabel alloc] init];
    [self addSubview:indexLabel];
    __weak typeof(self) weakSelf = self;
    [indexLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(weakSelf.mas_centerX);
//        make.centerX.equalTo(weakSelf.center);
        make.top.mas_equalTo(30);
        make.size.mas_equalTo(CGSizeMake(100, 40));
    }];
    indexLabel.textColor = [UIColor whiteColor];
    indexLabel.textAlignment = NSTextAlignmentCenter;
    _indexLabel = indexLabel;
    indexLabel.text = [NSString stringWithFormat:@"%zd/%zd", self.currecntIndex+1, _iconArray.count];
}

// 刷新iamgeView中的图片。难点：计算左中右的下标
- (void)refreshImages{
   
    NSInteger leftImageIndex;
    NSInteger rightImageIndex;
    CGPoint offset = self.scrollView.contentOffset;
    
    // 向右滑动。这时候应该让currentIndex加1：即让currentIndex + 1的图片显示在屏幕上
    if (offset.x > DYScreenW) {
        self.currecntIndex = (self.currecntIndex + 1) % self.iconArray.count;
    }
    // 向左滑动。这时候应该让currentIndex减1：即让currentIndex - 1的图片显示在屏幕上
    else if (offset.x < DYScreenW) {
        self.currecntIndex = (self.currecntIndex + self.iconArray.count - 1) % self.iconArray.count;
    }
    
    leftImageIndex = (self.currecntIndex + self.iconArray.count - 1) % self.iconArray.count;
    rightImageIndex = (self.currecntIndex + 1) % self.iconArray.count;
    

    PhotoLibModel * centeModel = self.iconArray[self.currecntIndex];
    PhotoLibModel * leftModel  = self.iconArray[leftImageIndex];
    PhotoLibModel * rightModel = self.iconArray[rightImageIndex];

    
    NSURL * centerUrl = [NSURL URLWithString:centeModel.photoUrl];
    NSURL * leftUrl = [NSURL URLWithString:leftModel.photoUrl];
    NSURL * rightUrl = [NSURL URLWithString:rightModel.photoUrl];
    
    [self.leftImageView sd_setImageWithURL:leftUrl completed:^(UIImage *image, NSError *error, SDImageCacheType cacheType, NSURL *imageURL) {
        
        CGFloat leftHeight;
        if (self.leftImageView.image) {
            
             leftHeight = DYScreenW / self.leftImageView.image.size.width * self.leftImageView.image.size.height;
        }else{
            leftHeight = 0.0;
        }
        
        self.leftImageView.frame = CGRectMake(0, (DYScreenH-leftHeight)*0.5, DYScreenW, leftHeight);
    }];
    
    [self.centerImageView sd_setImageWithURL:centerUrl completed:^(UIImage *image, NSError *error, SDImageCacheType cacheType, NSURL *imageURL) {
        
        CGFloat centerHeight;
        if (image) {
            
            centerHeight = DYScreenW / image.size.width * image.size.height;
        }else{
            centerHeight = 0.0;
        }
        
        self.centerImageView.frame = CGRectMake(DYScreenW, (DYScreenH-centerHeight)*0.5, DYScreenW, centerHeight);
    }];
    
    [self.rightImageView sd_setImageWithURL:rightUrl completed:^(UIImage *image, NSError *error, SDImageCacheType cacheType, NSURL *imageURL) {
        
        CGFloat rightHeight;
        if (image) {
            
            rightHeight = DYScreenW / image.size.width * image.size.height;
        }else{
            rightHeight = 0.0;
        }
        
        self.rightImageView.frame = CGRectMake(DYScreenW*2, (DYScreenH-rightHeight)*0.5, DYScreenW, rightHeight);
    }];
    
    _indexLabel.text = [NSString stringWithFormat:@"%zd/%zd", self.currecntIndex+1, _iconArray.count];
 
    
    if (!self.rectArray) {
        _currentRect = CGRectMake(0, 0, self.mj_size.width, self.mj_size.height);
    }else if (self.rectArray.count == 1){
        _currentRect = CGRectFromString(self.rectArray[0]);
    }else{
        _currentRect = CGRectFromString(self.rectArray[self.currecntIndex]);
    }
    
    self.currecntModel = centeModel;
    
    if (centeModel.photoType.intValue == 1) {
         [self.playerView resetPlayer];
        if ([self.currecntModel.videoUrl containsString:@"http"]) {
            self.playerModel.videoURL = [NSURL URLWithString:self.currecntModel.videoUrl];
        }else{
            self.playerModel.videoURL = [NSURL fileURLWithPath:self.currecntModel.videoUrl];
        }
        self.playerModel.placeholderImageURLString = self.currecntModel.photoUrl;
         self.playerModel.fatherView = self.centerImageView;
   
        [self.playerView playerControlView:nil playerModel:self.playerModel];
        
        // 自动播放
        [self.playerView autoPlayTheVideo];
    }else{
        [self.playerView resetPlayer];
        self.playerView = nil;
    }
}
- (void)scrollViewWillBeginDragging:(UIScrollView *)scrollView{
    
}
- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView{
    
    // 刷新imageView的图片
    [self refreshImages];
    // 把currentPageIndex立刻移到中间来
    [scrollView setContentOffset:CGPointMake(DYScreenW, 0) animated:NO];
}




// scrollView的手势的方法
- (void)scrollViewDidClick {
    
    UIImageView *tempImageView = [[UIImageView alloc] initWithImage:self.centerImageView.image];
    CGFloat tempHeight = DYScreenW / tempImageView.image.size.width * tempImageView.image.size.height;
    if (isnan(tempHeight)) {
        tempHeight = 0;
    }
    tempImageView.frame = CGRectMake(0, (DYScreenH-tempHeight)*0.5, DYScreenW, tempHeight);
    [self addSubview:tempImageView];
    [self.scrollView removeFromSuperview];
    [self.indexLabel removeFromSuperview];
    
    CGFloat width = _currentRect.size.width;
    if (width <= 0) {  // 如果cell没出现在界面中,即_currentRect = {0,0,0,0}；
        if (self.currecntIndex > self.index) {  // 说明往左滑动的，currentCell应该在屏幕下方
//            // 第一列:如果是第一列，且在屏幕上方，则图片往左上角方向消失。
//            if (self.currecntIndex % 4 == 0) {
//                _currentRect = CGRectMake(0, DYScreenH, 0, 0);
//            }
//            // 第二列：如果是第二列，且在屏幕上方，则图片往左上角偏重的地方消失
//            if (self.currecntIndex % 4 == 1) {
//                _currentRect = CGRectMake(DYScreenW * 0.25, DYScreenH, 0, 0);
//            }
//            // 第三列
//            if (self.currecntIndex % 4 == 2) {
//                _currentRect = CGRectMake(DYScreenW * 0.5, DYScreenH, 0, 0);
//            }
//            // 第四列
//            if (self.currecntIndex % 4 == 3) {
//                _currentRect = CGRectMake(DYScreenW * 0.75, DYScreenH, 0, 0);
//            }
            _currentRect = CGRectMake(DYScreenW * (self.currecntIndex % 4) / 4, DYScreenH, 0, 0);
        } else if (self.currecntIndex < self.index) { // 说明往右滑动的，currentCell应该在屏幕上方
            _currentRect = CGRectMake(DYScreenW * (self.currecntIndex % 4) / 4, 0, 0, 0);
        }
    }
    
    [UIView animateWithDuration:.4 animations:^{
        self.frame = _currentRect;
        tempImageView.frame = self.bounds;
    } completion:^(BOOL finished) {
    
        [self removeFromSuperview];
    }];
    
}


#pragma mark - - 设置左中右位置
-(void)LeftImageViewFrame:(PhotoLibModel*)leftModel{
    
//    NSURL * leftUrl =nil;
//
//    // 0为图片，1为视频截图
//    if (0 == [leftModel.photoType integerValue]) {
//
//        leftUrl = [NSURL URLWithString:leftModel.photoUrl];
//        [self.leftImageView sd_setImageWithURL:leftUrl completed:^(UIImage *image, NSError *error, SDImageCacheType cacheType, NSURL *imageURL) {
//            CGFloat leftHeight;
//            if (self.leftImageView.image) {
//                leftHeight = DYScreenW / self.leftImageView.image.size.width * self.leftImageView.image.size.height;
//
//            }else{
//                leftHeight = 0.0;
//            }
//            self.leftImageView.frame = CGRectMake(0, (DYScreenH-leftHeight)*0.5, DYScreenW, leftHeight);
//
//        }];
//
//    }else{
//        leftUrl = [NSURL URLWithString:leftModel.videoUrl];
////        播放视频（这里考虑 重用）
//        self.leftImageView.frame = CGRectMake(0, 0, DYScreenW, DYScreenH);
//
//
//
//    }
    
}


-(void)CenterImageViewFrame:(PhotoLibModel*)centerModel{
    
    
    
    
}


-(void)RightImageViewFrame:(PhotoLibModel*)rightModel{
    
    
    
    
}

#pragma mark - - - - - - - - - - - - - 视频

//  加载 View上 播放  remove

-(void)beginPlaying:(UIImageView*)imagePlayView withMOde:(PhotoLibModel*)model{
    
//    if ([self.playerView superView]) {
//        [self.playerView remove]
//    }

    
//    if ([model.indexVideo length]) {
//        if (self.playerView.state != ZFPlayerStatePlaying) {
//            // 取出字典中的第一视频URL
//            NSURL *videoURL = [NSURL URLWithString:model.indexVideo];
//            ZFPlayerModel *playerModel = [[ZFPlayerModel alloc] init];
//            playerModel.videoURL         = videoURL;
//            playerModel.nickName         = model.nickName;
//            playerModel.userId           = @(model.userId);
//            playerModel.placeholderImageURLString = model.indexIcon;
//            //    playerModel.scrollView       = weakSelf.tableView;
//            playerModel.indexPath        = [NSIndexPath indexPathWithIndex:0];
//            playerModel.fatherView = imagePlayView;
//            if (self.model.videoWidth > model.videoHeight) {
//                playerModel.isWideVideo = YES;
//            }else{
//                playerModel.isWideVideo = NO;
//
//            }
//            self.playerModel = playerModel;
//            // 设置播放控制层和model
//            [self.playerView playerControlView:nil playerModel:self.playerModel];
//            // 自动播放
//            [self.playerView autoPlayTheVideo];
//        }
//    }
   
    
}







#pragma mark - - 播放视频

- (UIStatusBarStyle)preferredStatusBarStyle {
    // 这里设置横竖屏不同颜色的statusbar
    if (ZFPlayerShared.isLandscape) {
        return UIStatusBarStyleLightContent;
    }
    return UIStatusBarStyleLightContent;
}

- (BOOL)prefersStatusBarHidden {
    return ZFPlayerShared.isStatusBarHidden;
}

//- (ZFPlayerControlView *)controlView {
//    if (!_controlView) {
//        //        __weak typeof(self) wSelf = self;
//        _controlView = [[ZFPlayerControlView alloc] init];
//        
//        _controlView.ShareAndAboutBlock = ^(BOOL isShare, NSIndexPath *indexPath) {
//            
//            //            if (!USERKEY) {
//            //                [wSelf loginOut];
//            //                return;
//            //            }
//            //            if (isShare) {
//            //                [wSelf rightBarButtonClick];
//            //            }
//            //            else {
//            //                [wSelf aboutOrderWithModel];
//            //            }
//        };
//    }
//    return _controlView;
//}
//
//
- (ZFPlayerView *)playerView {
    if (!_playerView) {
        _playerView = [[ZFPlayerView alloc] init];
        
        /**********************************************************
         *   // 指定控制层(可自定义)
         *   // ZFPlayerControlView *controlView = [[ZFPlayerControlView alloc] init];
         *   // 设置控制层和播放模型
         *   // 控制层传nil，默认使用ZFPlayerControlView(如自定义可传自定义的控制层)
         *   // 等效于 [_playerView playerModel:self.playerModel];
         **********************************************************/
        //        [_playerView playerControlView:nil playerModel:self.playerModel];
        
        // 设置代理
        _playerView.delegate = self;
        
        //（可选设置）可以设置视频的填充模式，内部设置默认（ZFPlayerLayerGravityResizeAspect：等比例填充，直到一个维度到达区域边界）
         _playerView.playerLayerGravity = ZFPlayerLayerGravityResizeAspectFill;
        
        // 打开下载功能（默认没有这个功能）
        _playerView.hasDownload    = NO;
        
        // 打开预览图
        _playerView.hasPreviewView = YES;
        
    }
    return _playerView;
}

//  视频参数初始化
- (ZFPlayerModel *)playerModel {
    if (!_playerModel) {
        _playerModel = [[ZFPlayerModel alloc] init];
        if ([self.currecntModel.videoUrl containsString:@"http"]) {
            _playerModel.videoURL = [NSURL URLWithString:self.currecntModel.videoUrl];
        }else{
            _playerModel.videoURL  = [NSURL fileURLWithPath:self.currecntModel.videoUrl];
        }
        
        _playerModel.placeholderImageURLString = self.currecntModel.photoUrl;
//        if (self.model.videoWidth > self.model.videoHeight) {
//            _playerModel.isWideVideo = YES;
//        }
//        else
//        {
//            _playerModel.isWideVideo = NO;
//        }
        _playerModel.fatherView = self.centerImageView;
        
    }
    return _playerModel;
}

#pragma mark #### ZFPlayerDelegate
- (void)zf_playerBackAction {
    
//    if (self.playBackBlock) {
//        
//        //        [self.playerView stop]
//        
//        self.playBackBlock();
//        
//    }
    
}

- (void)zf_playerControlViewWillShow:(UIView *)controlView isFullscreen:(BOOL)fullscreen {
    //    self.backBtn.hidden = YES;
    [UIView animateWithDuration:0.25 animations:^{
        //        self.backBtn.alpha = 0;
    }];
}

- (void)zf_playerControlViewWillHidden:(UIView *)controlView isFullscreen:(BOOL)fullscreen {
    //    self.backBtn.hidden = fullscreen;
    [UIView animateWithDuration:0.25 animations:^{
        //        self.backBtn.alpha = !fullscreen;
    }];
}
@end
