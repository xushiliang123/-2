//
//  TopScrollView.m
//  tingting_starguest
//
//  Created by Louie on 16/11/1.
//  Copyright © 2016年 gll. All rights reserved.
//

#import "TopScrollView.h"
#import <UIImageView+WebCache.h>

#define KHeight (self.bounds.size.height)
#define KWidth (self.bounds.size.width)

@implementation TopScrollView
{
    UIScrollView * _scrollView;
    NSMutableArray * _imageNames;
    UIPageControl * _pageControl;
    NSInteger _currentPage;         //记录当前页
    NSTimer * _timer;
    PicturesFrom _form;
    BOOL isRun;
}


- (id)initWithFrame:(CGRect)frame withImages:(NSArray *)images PicturesFrom:(PicturesFrom)form{
    self = [super initWithFrame:frame];
    if (self) {
        _form = form;
        _imageNames = [NSMutableArray array];
        [_imageNames addObject:images.lastObject];
        [_imageNames addObjectsFromArray:images];
        [_imageNames addObject:images.firstObject];
        _currentPage = 0;
        isRun = YES;
        //搭建界面
        [self customUI];
        if (images.count > 1) {
            [self createTimer];
        }
        
    }
    return self;
}

-(void)customUI{
    
    _scrollView = [[UIScrollView alloc]initWithFrame:self.bounds];
    _scrollView.bounces = NO;
    _scrollView.showsVerticalScrollIndicator = NO;
    _scrollView.showsHorizontalScrollIndicator = NO;
    for (NSInteger i = 0; i < _imageNames.count; i++) {
        
        UIImageView * imageView = [[UIImageView alloc]initWithFrame:CGRectMake(5 + KWidth * i, 4,(KWidth - 10), KHeight - 8)];
        imageView.contentMode=UIViewContentModeScaleAspectFill;
        imageView.clipsToBounds = YES;
        imageView.layer.cornerRadius = 5.0;
        imageView.userInteractionEnabled = YES;
        NSDictionary * dic = _imageNames[i];
        
        if (_form == PicturesFromLocal) {
            
            imageView.image=[UIImage imageNamed:dic[@"image"]];
            
        }else if (_form == PicturesFromTheNetwork) {
            
            [imageView sd_setImageWithURL:[NSURL URLWithString:dic[@"url"]] placeholderImage:[UIImage imageNamed:@"占位图"] options:SDWebImageRefreshCached];
        }
        
        imageView.tag = 100 + i;
        
        imageView.userInteractionEnabled = YES;
        
        UITapGestureRecognizer * tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapClick:)];
        
        [imageView addGestureRecognizer:tap];
        
        [_scrollView addSubview:imageView];
    }
    _scrollView.pagingEnabled = YES;
    
    _scrollView.contentSize = CGSizeMake(KWidth * _imageNames.count, KHeight);
    _scrollView.contentOffset = CGPointMake(KWidth, 0);
    _scrollView.delegate = self;
    [self addSubview:_scrollView];
    
    
    
}

-(void)createTimer
{
//    _timer.fireDate = [NSDate date];
    if (isRun == YES) {
        _timer = [NSTimer scheduledTimerWithTimeInterval:2 target:self selector:@selector(timerStart) userInfo:nil repeats:YES];
    }
}

- (void)timerStart{
    
//    [UIView animateWithDuration:0.5 animations:^{
//
//        _scrollView.contentOffset = CGPointMake(KWidth * (_currentPage + 2), 0);
//
//    } completion:^(BOOL finished) {
//
//        [self scrollViewDidEndDecelerating:_scrollView];
//
//    }];
    
    //1获得当前的点
    CGPoint point = _scrollView.contentOffset;
    //2求得将要变换的点
    CGPoint endPoint = CGPointMake(point.x+KWidth, 0);
    //判断
    if (endPoint.x == (_imageNames.count-1)*KWidth) {
        [UIView animateWithDuration:0.5 animations:^{
            _scrollView.contentOffset = CGPointMake(endPoint.x, 0);
        } completion:^(BOOL finished) {
            //动画完成的block
            _scrollView.contentOffset = CGPointMake(KWidth, 0);
            CGPoint realEnd = _scrollView.contentOffset;
            //取一遍页码数
            _currentPage = realEnd.x/KWidth;
            _pageControl.currentPage = _currentPage-1;
        }];
    }
    else{
        //0.5s中更改一个图片
        [UIView animateWithDuration:0.5 animations:^{
            _scrollView.contentOffset = endPoint;
        } completion:^(BOOL finished) {
        }];
        CGPoint realEnd = _scrollView.contentOffset;
        //取一遍页码数
        _currentPage = realEnd.x/KWidth;
        _pageControl.currentPage = _currentPage-1;
    }
}


- (void)addPageControlWithFrame:(CGRect)frame pageIndicatorColor:(UIColor *)pageIndicatorColor currentPageIndicatorColor:(UIColor *)currentColor{
    
    _pageControl = [[UIPageControl alloc]initWithFrame:frame];
    _pageControl.alpha = 0.8;
    _pageControl.numberOfPages = _imageNames.count - 2;
    _pageControl.currentPage = 0;
    _pageControl.currentPageIndicatorTintColor = currentColor;
    _pageControl.pageIndicatorTintColor = pageIndicatorColor;
    [self addSubview:_pageControl];
}

#pragma mark UIScrollViewDelegate
//停止滚动
-(void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView{

//    _currentPage = scrollView.contentOffset.x / KWidth;
//
//    if (_currentPage == 0) {
//
//        scrollView.contentOffset=CGPointMake(KWidth*(_imageNames.count-2), 0);
//
//        _currentPage = [_imageNames count] - 2;
//
//    }else if (_currentPage == _imageNames.count - 1) {
//
//        scrollView.contentOffset = CGPointMake(KWidth, 0);
//        _currentPage = 0;
//
//    }else{
//
//        _currentPage -= 1;
//
//    }
//
//    _pageControl.currentPage = _currentPage;
//
//    [_timer invalidate];
//    _timer = [NSTimer scheduledTimerWithTimeInterval:2 target:self selector:@selector(timerStart) userInfo:nil repeats:NO];
    if (_timer) {
        [_timer setFireDate:[NSDate dateWithTimeIntervalSinceNow:2]];
    }
    //图片的个数 1 2 3 4 5 6 7 8
    //真实的页码 0 1 2 3 4 5 6 7
    //显示的页码  0 1 2 3 4 5
    CGPoint point = _scrollView.contentOffset;
    if (point.x == (_imageNames.count-1)*KWidth) {
        scrollView.contentOffset = CGPointMake(KWidth, 0);
    }
    if (point.x == 0) {
        scrollView.contentOffset = CGPointMake((_imageNames.count-2)*KWidth, 0);
    }
    //取一遍页码数
    CGPoint endPoint = scrollView.contentOffset;
    _currentPage = endPoint.x/KWidth;
    _pageControl.currentPage = _currentPage-1;
}


//手指开始触摸的时候，停止计时器
-(void)scrollViewWillBeginDragging:(UIScrollView *)scrollView{
    if (_timer) {
        //如果有，停掉
        [_timer setFireDate:[NSDate distantFuture]];
    }
}


- (void)tapClick:(UITapGestureRecognizer *)tap{
    
    UIImageView * imageView = (UIImageView *)tap.view;
    NSInteger index = imageView.tag - 100;
    NSDictionary * dic = _imageNames[index];
    if (_tapGestureBlock) {
        self.tapGestureBlock(dic[@"webUrl"], dic[@"remark"]);
    }
}

- (void)dealloc{
    if (_timer) {
        [_timer invalidate];
        _timer = nil;
    }
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
