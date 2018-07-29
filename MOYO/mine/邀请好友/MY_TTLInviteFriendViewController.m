//
//  MY_TTLInviteFriendViewController.m
//  VTIME
//
//  Created by MadridLee on 2017/9/9.
//  Copyright © 2017年 MadridLee. All rights reserved.
//

#import "MY_TTLInviteFriendViewController.h"

@interface MY_TTLInviteFriendViewController ()
{
    UIView* _viewLine;
}
@end

@implementation MY_TTLInviteFriendViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"邀请好友";
    // Do any additional setup after loading the view.
    UIImageView* imgv = [[UIImageView alloc]initWithFrame:self.view.bounds];
    imgv.image = [UIImage imageNamed:@"邀请男女.jpg"];
//    imgv.backgroundColor = [UIColor blackColor];
    [self.view addSubview:imgv];

    
    [self uiConfig];
    [self uiHansonMan];
    
}
-(void)uiHansonMan
{

    UILabel* labelDetail = [[UILabel alloc]init];
    labelDetail.font = [UIFont systemFontOfSize:20];
    labelDetail.numberOfLines = 0;
    labelDetail.textColor = [Utility colorWithHexString:@"e6e6e6" alpha:1];
    [self.view addSubview:labelDetail];
    labelDetail.textAlignment = NSTextAlignmentCenter;
    [labelDetail mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.view.mas_left).offset(15);
        make.right.equalTo(self.view.mas_right).offset(-15);
        make.top.equalTo(_viewLine.mas_bottom).offset(69);
        make.height.mas_equalTo(54);
    }];
//    NSMutableAttributedString *attri = [[NSMutableAttributedString alloc] initWithString:@"高富帅收到红包的提成\n将作为你的奖励"];
    //    attri.yy_font = [UIFont systemFontOfSize:20];
//    NSRange range = NSMakeRange(8, 3);
//    [attri addAttribute:NSForegroundColorAttributeName value:GOLDCOLOR range:range];
//    labelDetail.attributedText = attri;

    if (![Utility isAuditEnvironment]) {//审核服
        labelDetail.text = @"高富帅收到红包的提成\n将作为你的奖励";
    }
    
    
    UIButton* btn = [UIButton buttonWithType:UIButtonTypeCustom];
    [btn setTitle:@"邀请高富帅" forState:UIControlStateNormal];
    btn.titleLabel.font = [UIFont systemFontOfSize:20];
    btn.backgroundColor = GOLDCOLOR;
    btn.layer.masksToBounds = YES;
    btn.layer.cornerRadius = 23;
    [btn setTitleColor:[Utility colorWithHexString:@"ffffff" alpha:1] forState:UIControlStateNormal];
    [self.view addSubview:btn];
    [btn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self.view.mas_centerX);
        make.top.equalTo(labelDetail.mas_bottom).offset(36);
        make.height.mas_equalTo(50);
        make.width.mas_equalTo(200);
    }];
    [btn addTarget:self action:@selector(inviteMan) forControlEvents:UIControlEventTouchUpInside];

}
-(void)uiConfig
{
    UILabel* labelTitle = [[UILabel alloc]init];
    labelTitle.font = [UIFont systemFontOfSize:24];
    labelTitle.textColor = [Utility colorWithHexString:@"e6e6e6" alpha:1];
    [self.view addSubview:labelTitle];
    labelTitle.text = @"MOYO 高端的私密社区";
    labelTitle.textAlignment = NSTextAlignmentCenter;
    [labelTitle mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.view.mas_left).offset(15);
        make.right.equalTo(self.view.mas_right).offset(-15);
        make.top.equalTo(self.view.mas_top).offset(53);
        make.height.mas_equalTo(24);
    }];
    
    
    UILabel* labelDetail = [[UILabel alloc]init];
    labelDetail.font = [UIFont systemFontOfSize:20];
    labelDetail.textColor = [Utility colorWithHexString:@"e6e6e6" alpha:1];
    [self.view addSubview:labelDetail];
    labelDetail.numberOfLines = 0;
    labelDetail.textAlignment = NSTextAlignmentCenter;
    [labelDetail mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.view.mas_left).offset(15);
        make.right.equalTo(self.view.mas_right).offset(-15);
        make.top.equalTo(labelTitle.mas_bottom).offset(58);
        make.height.mas_equalTo(54);
    }];
//    NSMutableAttributedString *attri = [[NSMutableAttributedString alloc] initWithString:@"白富美收到红包的提成\n将作为你的奖励"];
//    attri.yy_font = [UIFont systemFontOfSize:20];
//    NSRange range = NSMakeRange(8, 3);
//    [attri addAttribute:NSForegroundColorAttributeName value:GOLDCOLOR range:range];
    
    if (![Utility isAuditEnvironment]) {//审核服
        labelDetail.text = @"白富美收到红包的提成\n将作为你的奖励";
    }
    
    UIButton* btn = [UIButton buttonWithType:UIButtonTypeCustom];
    [btn setTitle:@"邀请白富美" forState:UIControlStateNormal];
    btn.titleLabel.font = [UIFont systemFontOfSize:20];
    btn.backgroundColor = GOLDCOLOR;
    btn.layer.masksToBounds = YES;
    btn.layer.cornerRadius = 23;
    [btn setTitleColor:[Utility colorWithHexString:@"ffffff" alpha:1] forState:UIControlStateNormal];
    [self.view addSubview:btn];
    [btn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self.view.mas_centerX);
        make.top.equalTo(labelDetail.mas_bottom).offset(36);
        make.height.mas_equalTo(50);
        make.width.mas_equalTo(200);
    }];
    [btn addTarget:self action:@selector(inviteWomen) forControlEvents:UIControlEventTouchUpInside];
    
    
    _viewLine = [[UIView alloc]init];
    _viewLine.backgroundColor = GOLDCOLOR;
    [self.view addSubview:_viewLine];
    [_viewLine mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.view.mas_left).offset(38);
        make.right.equalTo(self.view.mas_right).offset(-38);
        make.top.equalTo(btn.mas_bottom).offset(51);
        make.height.mas_equalTo(1);
    }];
}

-(void)inviteMan
{
    SDWebImageManager *manager = [SDWebImageManager sharedManager];
    
    [manager downloadImageWithURL:[NSURL URLWithString:self.model.headIcon] options:SDWebImageAllowInvalidSSLCertificates progress:^(NSInteger receivedSize, NSInteger expectedSize) {
        
    } completed:^(UIImage *image, NSError *error, SDImageCacheType cacheType, BOOL finished, NSURL *imageURL) {
        
        NSTimeInterval timeInterval = [[NSDate date] timeIntervalSince1970];
        NSString * timeStr = [NSString stringWithFormat:@"%lf", (double)timeInterval];
        
        NSString *titleStr = @"闲趣：“闲暇之余，有趣约会”";//[NSString stringWithFormat:@"%@邀请你入驻V时代", self.model.nickName];
        NSString *detailsStr = [NSString stringWithFormat:@"网红模特们的新宠儿和有趣的灵魂\n分享你成功的人生这里只有卓越，拒绝平庸"];
        NSString *urlStr = ShareInviteFriendUrl(USERID,1);
        
        NSArray* array = @[titleStr, detailsStr, urlStr];
        
        MY_TTLShareOnlyView* alert = [[MY_TTLShareOnlyView alloc]initWithFrame:ShareFrame withArray:array image:image type:1 typeId:nil];
        [UIView animateWithDuration:0.2 animations:^{
            [alert show];
        }];
    }];
}

-(void)inviteWomen
{
    SDWebImageManager *manager = [SDWebImageManager sharedManager];
    
    [manager downloadImageWithURL:[NSURL URLWithString:self.model.headIcon] options:SDWebImageAllowInvalidSSLCertificates progress:^(NSInteger receivedSize, NSInteger expectedSize) {
        
    } completed:^(UIImage *image, NSError *error, SDImageCacheType cacheType, BOOL finished, NSURL *imageURL) {
        
        NSTimeInterval timeInterval = [[NSDate date] timeIntervalSince1970];
        NSString * timeStr = [NSString stringWithFormat:@"%lf", (double)timeInterval];
        
        NSString *titleStr = @"闲趣：“闲暇之余，有趣约会”"; //[NSString stringWithFormat:@"%@邀请你入驻V时代", self.model.nickName];
        NSString *detailsStr = [NSString stringWithFormat:@"网红模特们的新宠儿和有趣的灵魂\n分享你成功的人生这里只有卓越，拒绝平庸"];
        NSString *urlStr = ShareInviteFriendUrl(USERID,0);
        
        NSArray* array = @[titleStr, detailsStr, urlStr];
        
        MY_TTLShareOnlyView* alert = [[MY_TTLShareOnlyView alloc]initWithFrame:ShareFrame withArray:array image:image type:0 typeId:nil   ];
        [UIView animateWithDuration:0.2 animations:^{
            [alert show];
        }];
    }];
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
