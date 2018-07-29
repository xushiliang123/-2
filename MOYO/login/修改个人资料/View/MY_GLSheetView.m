//
//  MY_GLSheetView.m
//  VTIME
//
//  Created by gll on 2017/9/11.
//  Copyright © 2017年 MadridLee. All rights reserved.
//

#import "MY_GLSheetView.h"


@interface MY_GLSheetView()
{
    UIView * _bgView;
}



@end

@implementation MY_GLSheetView

-(instancetype)initWithFrame:(CGRect)frame{
    
    self = [super initWithFrame:frame];
    
    if (self) {
        
        
        [self setupUI];
    }
    
    return self;
}

//  点击 sheet sender.tag 从100(取消) 开始
-(void)selectedUserStyleIndex2ClickMethod:(UIButton*)sender{
    
    
        if (self.ShowPhotoLibraryBlock) {
            
            self.ShowPhotoLibraryBlock(sender.tag - 100);
        }
    
    [self removeFromSuperview];
}

-(void)setupUI{
    
    UIView * bgView0 = [[UIView alloc]initWithFrame:self.frame];
    bgView0.backgroundColor = [Utility colorWithHexString:@"000000" alpha:0.5];
    [self addSubview:bgView0];
    
    CGFloat left = 10;
    CGFloat width = SCREEN_WIDTH - 20;
    CGFloat orgin_y = 10;
    CGFloat height = 38;
    NSArray * heightAry = @[@(38),@(38),@(58),@(24),@(24),@(24)];
    NSArray * titleAry = @[@"拍照",@"从手机相册选",@"",@"(以下形象照不会通过审核)",@"形象照修改"];

    UIFont * font = [UIFont systemFontOfSize:18];
    UIColor * bgColor = [UIColor whiteColor];
    //  取消
    
    UIButton * btn = [UIButton buttonWithType:UIButtonTypeCustom];
    [btn setFrame:CGRectMake(10, SCREEN_HEIGHT - orgin_y - height, width , height)];
    
    [btn setTitleColor:COlOR333 forState:(UIControlStateNormal)];
    [btn setTitle:@"取消" forState:(UIControlStateNormal)];
    btn.tag = 100;
    [btn setBackgroundColor:bgColor];
    [btn addTarget:self action:@selector(selectedUserStyleIndex2ClickMethod:) forControlEvents:(UIControlEventTouchUpInside)];
    btn.layer.cornerRadius = 4.0;
    [btn.layer setMasksToBounds:YES];
    btn.titleLabel.font = font;
    [btn setContentHorizontalAlignment:(UIControlContentHorizontalAlignmentCenter)];
    [self addSubview:btn];

    CGFloat bgHeight = 38 + 38 + 58 + 50;

    _bgView = [[UIView alloc]initWithFrame:CGRectMake(left,  btn.frame.origin.y - 10 -bgHeight, SCREEN_WIDTH - 20, bgHeight)];
    _bgView.backgroundColor = [Utility colorWithHexString:@"ffffff" alpha:0.5];
    _bgView.layer.cornerRadius = 4.0;
    [_bgView.layer setMasksToBounds:YES];
    [self addSubview:_bgView];
    
    
    orgin_y = bgHeight;//CGRectGetMinY(btn.frame) - orgin_y - height
    for (NSInteger i = 1; i < 6; i++) {
        
        UIButton * btn = [UIButton buttonWithType:UIButtonTypeCustom];

        orgin_y = orgin_y - [heightAry[i-1] integerValue];

        [btn setFrame:CGRectMake(0, orgin_y, width, [heightAry[i-1] integerValue])];

        [btn setTitleColor:COlOR333 forState:(UIControlStateNormal)];
        [btn setTitle:titleAry[i-1] forState:(UIControlStateNormal)];
        btn.tag = 100 + i;
        [btn setBackgroundColor:bgColor];
        btn.titleLabel.font = font;
        [btn setContentHorizontalAlignment:(UIControlContentHorizontalAlignmentCenter)];

        [_bgView addSubview:btn];
        
        if (3 == i) {
            btn.userInteractionEnabled = NO;
            [btn setImage:[UIImage imageNamed:@"editInfo_attentionPhoto"] forState:(UIControlStateNormal)];
        }else if (4 == i) {
            
            [btn setTitleColor:COlOR999 forState:(UIControlStateNormal)];
            [btn setTitle:titleAry[i-1] forState:(UIControlStateNormal)];
            btn.titleLabel.font = [UIFont systemFontOfSize:14];
            
        }else{

            [btn addTarget:self action:@selector(selectedUserStyleIndex2ClickMethod:) forControlEvents:(UIControlEventTouchUpInside)];
        }
        
    }
    
}

-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    
    if ([self superview] || self.frame.origin.y == 0) {
        
        CGRect rect = self.frame;
        rect.origin.y = SCREEN_HEIGHT;
        
        [UIView animateWithDuration:0.25 animations:^{
            
            self.frame = rect;
            
        } completion:^(BOOL finished) {
            
            [self removeFromSuperview];
        }];
        
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
