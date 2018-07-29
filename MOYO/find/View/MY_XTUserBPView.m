//
//  MY_XTUserBPView.m
//  VTIME
//
//  Created by tingting on 2017/10/25.
//  Copyright © 2017年 MadridLee. All rights reserved.
//

#import "MY_XTUserBPView.h"

@interface MY_XTUserBPView()
{
    UIView *contentView;
}

@property (nonatomic, strong) UIImageView *HeaderImgV;
@property (nonatomic, strong) UIImageView *RZImgV;

@property (nonatomic, strong) UILabel *nameLabel;
@property (nonatomic, strong) UIImageView *XBImgV;
@property (nonatomic, strong) UILabel *levelLabel;

@property (nonatomic, strong) UILabel *ageLabel;
@property (nonatomic, strong) UILabel *distanceLabel;
@property (nonatomic ,assign) BOOL selected;

@end

@implementation MY_XTUserBPView

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

- (instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
         [self initContent];
    }
    return self;
}
//- (void)awakeFromNib{
//    [super awakeFromNib];
//    contentView = [[[NSBundle mainBundle]loadNibNamed:@"MY_XTUserBPView" owner:self options:nil]lastObject];
//    contentView.frame = self.bounds;
//    [self addSubview:contentView];
//}

- (void)initContent
{
    self.frame = CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT);
    //alpha 0.0  白色   alpha 1 ：黑色   alpha 0～1 ：遮罩颜色，逐渐
    self.backgroundColor = [UIColor colorWithRed:0 green:0 blue:0 alpha:0];
    self.userInteractionEnabled = YES;
    [self addGestureRecognizer:[[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(animateOut)]];
    
    if (contentView == nil)
    {
        contentView = [[UIView alloc]initWithFrame:CGRectMake(34 * SCREEN_WIDTH/375, 130 * SCREEN_HEIGHT/667, 306 * SCREEN_WIDTH/375, 284 * SCREEN_HEIGHT/667)];
        contentView.backgroundColor = [UIColor whiteColor];
        contentView.layer.masksToBounds = YES;
        contentView.layer.cornerRadius = 7.0f;
        [self addSubview:contentView];
        
        UIButton *_missButton = [[UIButton alloc]initWithFrame:CGRectMake(contentView.frame.size.width - 29 * SCREEN_WIDTH/375, 14 * SCREEN_HEIGHT/667, 16 * SCREEN_WIDTH/375, 17 * SCREEN_HEIGHT/667)];
        [_missButton setImage:[UIImage imageNamed:@"错误"] forState:UIControlStateNormal];
        [_missButton addTarget:self action:@selector(animateOut) forControlEvents:UIControlEventTouchUpInside];
        [contentView addSubview:_missButton];
        
        UIImageView *jinggao = [[UIImageView alloc] initWithFrame:CGRectMake(13 * SCREEN_WIDTH/375, 14 * SCREEN_HEIGHT/667, 20 * SCREEN_WIDTH/375, 20 * SCREEN_HEIGHT/667)];
        jinggao.image = [UIImage imageNamed:@"警告1"];
        [contentView addSubview:jinggao];
        
        _HeaderImgV = [[UIImageView alloc]initWithFrame:CGRectMake(109* SCREEN_WIDTH/375, 18 * SCREEN_HEIGHT/667, 87* SCREEN_WIDTH/375, 87* SCREEN_WIDTH/375)];
        _HeaderImgV.layer.masksToBounds = YES;
        _HeaderImgV.layer.cornerRadius = 87 * SCREEN_WIDTH/375 /2;
        _HeaderImgV.image = [UIImage imageNamed:@"占位图"];
        [contentView addSubview:_HeaderImgV];
        
        _RZImgV = [[UIImageView alloc] initWithFrame:CGRectMake(169* SCREEN_WIDTH/375, 87 * SCREEN_HEIGHT/667, 22* SCREEN_WIDTH/375, 22 * SCREEN_HEIGHT/667)];
        _RZImgV.image = [UIImage imageNamed:@"GZ"];
        [contentView addSubview:_RZImgV];
        
        _nameLabel = [[UILabel alloc] initWithFrame:CGRectMake(56* SCREEN_WIDTH/375, 121 * SCREEN_HEIGHT/667, 126* SCREEN_WIDTH/375, 17 * SCREEN_HEIGHT/667)];
        _nameLabel.textColor = [Utility colorWithHexString:@"#333333" alpha:1.0f];
        _nameLabel.font = [UIFont systemFontOfSize:18 * SCREEN_WIDTH/375];
        _nameLabel.text = @"布拉和没有宫殿";
//        CGSize size = [_nameLabel.text sizeWithAttributes:[NSDictionary dictionaryWithObjectsAndKeys:[UIFont systemFontOfSize:18 * SCREEN_WIDTH/375],NSFontAttributeName,nil]];
//        CGFloat nameH = size.height;
//        CGFloat nameW = size.width;
//        _nameLabel.frame = CGRectMake(100,100, nameW,nameH);
        [contentView addSubview:_nameLabel];
        
        _XBImgV = [[UIImageView alloc]initWithFrame:CGRectMake(_nameLabel.frame.origin.x + _nameLabel.frame.size.width + 6 * SCREEN_WIDTH/375, 122 * SCREEN_HEIGHT/667, 15 * SCREEN_HEIGHT/667, 15  * SCREEN_HEIGHT/667)];
        _XBImgV.image = [UIImage imageNamed:@"性别"];
        [contentView addSubview:_XBImgV];
        
        _levelLabel = [[UILabel alloc] initWithFrame:CGRectMake(_XBImgV.frame.origin.x + _XBImgV.frame.size.width + 6 * SCREEN_WIDTH/375, 121 * SCREEN_HEIGHT/667, 40* SCREEN_WIDTH/375, 17 * SCREEN_HEIGHT/667)];
        _levelLabel.textColor = [Utility colorWithHexString:@"#FFFFFF" alpha:1.0f];
        _levelLabel.font = [UIFont boldSystemFontOfSize:10 * SCREEN_WIDTH/375];
        _levelLabel.text = @"VIP0";
        _levelLabel.textAlignment = NSTextAlignmentCenter;
        _levelLabel.backgroundColor = [Utility colorWithHexString:@"#FA4034" alpha:1.0f];
        _levelLabel.layer.masksToBounds = YES;
        _levelLabel.layer.cornerRadius = 17 * SCREEN_HEIGHT/667 /2;
        [contentView addSubview:_levelLabel];
        
        UIImageView *ageV = [[UIImageView alloc]initWithFrame:CGRectMake(90 * SCREEN_WIDTH/375, 152 * SCREEN_HEIGHT/667, 16 * SCREEN_HEIGHT/667, 13  * SCREEN_HEIGHT/667)];
        ageV.image = [UIImage imageNamed:@"年龄"];
        [contentView addSubview:ageV];
        
        
        _ageLabel = [[UILabel alloc] initWithFrame:CGRectMake(ageV.frame.origin.x + ageV.frame.size.width + 5 * SCREEN_WIDTH/375, 152 * SCREEN_HEIGHT/667, 40* SCREEN_WIDTH/375, 14 * SCREEN_HEIGHT/667)];
        _ageLabel.textColor = [Utility colorWithHexString:@"#C9C9C9" alpha:1.0f];
        _ageLabel.font = [UIFont boldSystemFontOfSize:15 * SCREEN_WIDTH/375];
        _ageLabel.text = @"15岁";
        _ageLabel.textAlignment = NSTextAlignmentLeft;
        [contentView addSubview:_ageLabel];
        
        
        UIImageView *DisV = [[UIImageView alloc]initWithFrame:CGRectMake(153 * SCREEN_WIDTH/375, 152 * SCREEN_HEIGHT/667, 11 * SCREEN_HEIGHT/667, 14  * SCREEN_HEIGHT/667)];
        DisV.image = [UIImage imageNamed:@"距离"];
        [contentView addSubview:DisV];
        
        _distanceLabel = [[UILabel alloc] initWithFrame:CGRectMake(DisV.frame.origin.x + DisV.frame.size.width + 5 * SCREEN_WIDTH/375, 152 * SCREEN_HEIGHT/667, 100* SCREEN_WIDTH/375, 14 * SCREEN_HEIGHT/667)];
        _distanceLabel.textColor = [Utility colorWithHexString:@"#C9C9C9" alpha:1.0f];
        _distanceLabel.font = [UIFont boldSystemFontOfSize:15 * SCREEN_WIDTH/375];
        _distanceLabel.text = @"1.5千米";
        _distanceLabel.textAlignment = NSTextAlignmentLeft;
        [contentView addSubview:_distanceLabel];
        
        UIView *view1 = [[UIView alloc]initWithFrame:CGRectMake(11* SCREEN_WIDTH/375, 186* SCREEN_HEIGHT/667, 282* SCREEN_WIDTH/375, 1)];
        view1.backgroundColor = [Utility colorWithHexString:@"#EFEFEF" alpha:1.0f];
        [contentView addSubview:view1];
        
        for(int i = 0;i < 3;i++)
        {
            UIButton *guanzhuBtn = [[UIButton alloc]initWithFrame:CGRectMake(contentView.frame.size.width / 3 * i, contentView.frame.size.height - 102 * SCREEN_HEIGHT/667, contentView.frame.size.width / 3, 51 * SCREEN_HEIGHT/667)];
            guanzhuBtn.tag = 1000+i;
//            [guanzhuBtn addTarget:self action:@selector(BuyBaPing:) forControlEvents:UIControlEventTouchUpInside];
//            guanzhuBtn.layer.masksToBounds = YES;
//            guanzhuBtn.layer.cornerRadius = 57.5 / 2 * SCREEN_HEIGHT/667;
            switch (i)
            {
                case 0:{
                    [guanzhuBtn setTitle:@"+关注" forState:UIControlStateNormal];
                    break;
                }
                case 1:{
                    [guanzhuBtn setTitle:@"主页" forState:UIControlStateNormal];
                    break;
                }
                case 2:{
                    [guanzhuBtn setTitle:@"私聊" forState:UIControlStateNormal];
                    break;
                }
            }
            
            if(i == 0)
            {
                [guanzhuBtn addTarget:self action:@selector(choose:) forControlEvents:UIControlEventTouchUpInside];
            }
            else
            {
                [guanzhuBtn addTarget:self action:@selector(btn_click:) forControlEvents:UIControlEventTouchUpInside];
            }
            
            guanzhuBtn.titleLabel.font = [UIFont systemFontOfSize:17 * SCREEN_WIDTH/375];
            [guanzhuBtn setTitleColor:[Utility colorWithHexString:@"#DDB362" alpha:1.0f] forState:UIControlStateNormal];
            
            [contentView addSubview:guanzhuBtn];
        }
        for(int i = 0;i < 2;i++)
        {
            
            UIView *view2 = [[UIView alloc]initWithFrame:CGRectMake(contentView.frame.size.width / 3 * (i+1), 198* SCREEN_HEIGHT/667, 1, 23* SCREEN_HEIGHT/667)];
            view2.backgroundColor = [Utility colorWithHexString:@"#EFEFEF" alpha:1.0f];
            [contentView addSubview:view2];
            
            
            
            UIButton *guanzhuBtn = [[UIButton alloc]initWithFrame:CGRectMake(contentView.frame.size.width / 2 * i, contentView.frame.size.height - 51 * SCREEN_HEIGHT/667, contentView.frame.size.width / 2, 51 * SCREEN_HEIGHT/667)];
            guanzhuBtn.tag = 2000+i;
            //            [guanzhuBtn addTarget:self action:@selector(BuyBaPing:) forControlEvents:UIControlEventTouchUpInside];
            //            guanzhuBtn.layer.masksToBounds = YES;
            //            guanzhuBtn.layer.cornerRadius = 57.5 / 2 * SCREEN_HEIGHT/667;
            switch (i)
            {
                case 0:{
                    [guanzhuBtn setTitle:@"发红包" forState:UIControlStateNormal];
                    break;
                }
                case 1:{
                    [guanzhuBtn setTitle:@"霸屏" forState:UIControlStateNormal];
                    break;
                }
               
            }
            guanzhuBtn.titleLabel.font = [UIFont systemFontOfSize:17 * SCREEN_WIDTH/375];
            [guanzhuBtn setTitleColor:[Utility colorWithHexString:@"#FFFFFF" alpha:1.0f] forState:UIControlStateNormal];
            guanzhuBtn.backgroundColor = [Utility colorWithHexString:@"#FA4034" alpha:1.0f];
            [contentView addSubview:guanzhuBtn];
            [guanzhuBtn addTarget:self action:@selector(btn_click:) forControlEvents:UIControlEventTouchUpInside];
        }
            
        
        UIView *view2 = [[UIView alloc]initWithFrame:CGRectMake(contentView.frame.size.width / 2 , 250* SCREEN_HEIGHT/667, 1, 22* SCREEN_HEIGHT/667)];
        view2.backgroundColor = [Utility colorWithHexString:@"#FFFFFF" alpha:1.0f];
        [contentView addSubview:view2];
        
    }
}

-(void)loadUserModel:(MY_LYPersonInfoModel *)model
{
    self.userid = model.userId;
    
    self.model = model;
    
    if(model.isAuthen == 0)
    {
        [_RZImgV setHidden:YES];
    }else
    {
        [_RZImgV setHidden:NO];
    }
    
    [_HeaderImgV sd_setImageWithURL:[NSURL URLWithString:model.headIcon] placeholderImage:[UIImage imageNamed:@"占位图"]];
    _nameLabel.text = model.nickName;
    CGSize size = [_nameLabel.text sizeWithAttributes:[NSDictionary dictionaryWithObjectsAndKeys:[UIFont systemFontOfSize:18 * SCREEN_WIDTH/375],NSFontAttributeName,nil]];
    CGFloat nameW = size.width;
    
    _nameLabel.frame = CGRectMake((294 * SCREEN_WIDTH/375 - nameW - 55 * SCREEN_WIDTH/375)/2,121 * SCREEN_WIDTH/375, nameW,17 * SCREEN_HEIGHT/667);
    _XBImgV.frame = CGRectMake(_nameLabel.frame.origin.x + _nameLabel.frame.size.width + 6 * SCREEN_WIDTH/375, 122 * SCREEN_HEIGHT/667, 15 * SCREEN_HEIGHT/667, 15  * SCREEN_HEIGHT/667);
    _levelLabel.frame = CGRectMake(_XBImgV.frame.origin.x + _XBImgV.frame.size.width + 6 * SCREEN_WIDTH/375, 121 * SCREEN_HEIGHT/667, 40* SCREEN_WIDTH/375, 17 * SCREEN_HEIGHT/667);
    
//    _levelLabel.text = [NSString stringWithFormat:@"VIP%ld",model.consumptionLevel];
    _levelLabel.text = GetVipLevel(model.consumptionLevel);
    _ageLabel.text = [NSString stringWithFormat:@"%ld岁",model.age];
    NSString *region;
    
    if ([model.region isEqualToString:@"角落里"]) {
        region = @"角落里";
    }else if ([_mymodel.region isEqualToString:model.region]) {
          region  = [NSString stringWithFormat:@"%.1fkm",[model.distance floatValue]];
    }else{
        region =  model.region;
    }
    
    _distanceLabel.text = region;
    switch (model.sex) {
        case 0:
            _XBImgV.image = [UIImage imageNamed:@"女"];
            break;
        case 1:
            _XBImgV.image = [UIImage imageNamed:@"男"];
            break;
        default:
            break;
    }
    
    
    for (UIButton *findBtn in contentView.subviews) {
        if (findBtn.tag == 1000)
        {
            switch (model.isFollow) {
                case 0:
                    _selected = NO;
                    [findBtn setTitle:@"+关注" forState:UIControlStateNormal];
                    break;
                case 1:
                    _selected = YES;
                    [findBtn setTitle:@"取消关注" forState:UIControlStateNormal];
                    break;
                default:
                    break;
            }
            
        }
    }
    
    
}

-(void)animateOut
{
    [UIView animateWithDuration:0.3 animations:^{
        contentView.transform = CGAffineTransformMakeScale(0.01, 0.01);
        contentView.alpha = 0.2;
        self.alpha = 0.2;
    } completion:^(BOOL finished) {
        [self removeFromSuperview];
         [contentView removeFromSuperview];
    }];
    
}

-(void)creatBackgroundView:(UIView *)view
{
    if (!view)
    {
        return;
    }
    [view addSubview:self];
    [view addSubview:contentView];
    // 保存当前弹出的视图
//    contentView = view;
//    CGFloat halfScreenWidth = [[UIScreen mainScreen] bounds].size.width * 0.5;
//    CGFloat halfScreenHeight = [[UIScreen mainScreen] bounds].size.height * 0.5;
    // 屏幕中心
    CGPoint screenCenter = CGPointMake(SCREEN_WIDTH*0.5, (SCREEN_HEIGHT - 64 - 25)*0.5);
    contentView.center = screenCenter;
//    UIWindow *keyWindow = [UIApplication sharedApplication].keyWindow;
//    [keyWindow addSubview:contentView];
    
    if (view) {
        // 第一步：将view宽高缩至无限小（点）
        contentView.transform = CGAffineTransformScale(CGAffineTransformIdentity,
                                                CGFLOAT_MIN, CGFLOAT_MIN);
        [UIView animateWithDuration:0.3
                         animations:^{

                         }
                         completion:^(BOOL finished) {
                             [UIView animateWithDuration:0.2
                                              animations:^{
                                                  // 第三步： 以动画的形式将view恢复至原始大小
                                                  contentView.transform = CGAffineTransformIdentity;
                                              }];
                         }];
    }

    
}

-(void)dissMissPresentVC
{
    [self animateOut];
}

-(void)btn_click:(UIButton *)sender
{
    if ( [self.delegate respondsToSelector:@selector(BtnClick:withBPView:)] )
    {
        [self.delegate BtnClick:sender withBPView:self];
    }
    else
    {
        NSLog(@"BtnClick: haven't found in delegate.");
    }
}

- (void)choose:(UIButton *)sender
{
    _selected = !_selected;
    if(_selected) {
        
        
        NSMutableDictionary* dict = [[NSMutableDictionary alloc]init];
        
        [dict setObject:[NSString stringWithFormat:@"%ld", self.model.userId] forKey:@"onkey"];
        
        [dict setObject:@"0" forKey:@"type"];
        
        [TLHTTPRequest MY_postWithBaseUrl:AttentionURL parameters:dict success:^(NSURLSessionDataTask * _Nonnull task, NSDictionary * _Nonnull data) {
            
            if ([[data objectForKey:@"ret"] boolValue] == 0) {
                
                [sender setTitle:@"取消关注" forState:UIControlStateNormal];

            }
            else {
                if (dict[@"msg"]) {
                    [LQProgressHud showMessage:dict[@"msg"]];
                }
            }
        } failure:^(NSURLSessionDataTask * _Nonnull task, NSError * _Nonnull error) {
            [LQProgressHud showMessage:@"网络出现问题"];
        }];
        
        
    }else {
        
       
        NSMutableDictionary* dict = [[NSMutableDictionary alloc]init];
        
        [dict setObject:[NSString stringWithFormat:@"%ld", self.model.userId] forKey:@"onkey"];
        
        [dict setObject:@"1" forKey:@"type"];
        
        [TLHTTPRequest MY_postWithBaseUrl:AttentionURL parameters:dict success:^(NSURLSessionDataTask * _Nonnull task, NSDictionary * _Nonnull data) {
            
            if ([[data objectForKey:@"ret"] boolValue] == 0) {
                
                [sender setTitle:@"+关注" forState:UIControlStateNormal];
                
            }
            else {
                if (dict[@"msg"]) {
                    [LQProgressHud showMessage:dict[@"msg"]];
                }
            }
        } failure:^(NSURLSessionDataTask * _Nonnull task, NSError * _Nonnull error) {
            [LQProgressHud showMessage:@"网络出现问题"];
        }];
        
    }
}


@end
