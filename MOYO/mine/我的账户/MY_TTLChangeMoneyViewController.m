
//
//  MY_TTLChangeMoneyViewController.m
//  TogetherLu
//
//  Created by MadridLee on 2016/12/26.
//  Copyright © 2016年 TogetherLu. All rights reserved.
//

#import "MY_TTLChangeMoneyViewController.h"
#import "MY_TTLIncomeDetailViewController.h"
#import "MY_TTLIncomeModel.h"
#import "MY_TTLTiXianViewController.h"
#import "RechargeViewController.h"
#import "MY_XTTiXianViewController.h"
@interface MY_TTLChangeMoneyViewController ()
{
    UILabel* _labelMoneyS;  //  收益
    UILabel* _labelMoneyC;  //  ￥充值
    
    UILabel* _labelMoneySR; //  ￥邀请
    UILabel* _labelMoneySW; //  红包
    UILabel* _labelMoneyXF; //  消费
    UILabel* _labelMoneyOT; //  其他

}
@end

@implementation MY_TTLChangeMoneyViewController

-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
}


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.navigationController.navigationBar.translucent = NO;
    self.view.backgroundColor = [Utility colorWithHexString:@"f8f8f8" alpha:1];
    self.title = @"我的账户";
    
    [self setNewUI];
    [self upLoadData:self.model];
}


- (void)setNewUI {
    
    NSArray * imageAr = @[@"changeBack1", @"changeBack1"];
    NSArray * topImageAr = @[@"余额", @"收益"];
    NSArray * btnTitleAr = @[@"充值", @"提现"];
    
    _labelMoneyS = [[UILabel alloc] init];
    _labelMoneyC = [[UILabel alloc] init];
    
//    _labelMoneyS.text = @"100元";
//    _labelMoneyC.text = @"200元";
    
    NSArray * labelArr = nil;
    
    labelArr = @[_labelMoneyC, _labelMoneyS];
    
    for (NSInteger i = 0; i < labelArr.count; ++i) {
        
        UIImageView * imageView = [[UIImageView alloc] init];
        imageView.image = [UIImage imageNamed:imageAr[i]];
        imageView.backgroundColor = [Utility colorWithHexString:@"685340" alpha:1];
        imageView.userInteractionEnabled = YES;
        [self.view addSubview:imageView];
        
        CGFloat y = (ScaleWidth(194) + 30) * i + 30 ;
        
        CGFloat imgHeight = ScaleWidth(194);
        if (i == 1) {
            imgHeight = ScaleWidth(290);
        }
        imageView.layer.masksToBounds = YES;
        imageView.layer.cornerRadius = 6;
        [imageView mas_makeConstraints:^(MASConstraintMaker *make) {
            
            make.top.equalTo(self.view.mas_top).mas_offset(y);
            make.centerX.equalTo(self.view.mas_centerX);
            make.width.mas_equalTo(ScaleWidth(316));
            make.height.mas_equalTo(imgHeight);
        }];
        
        UIImageView * topImage = [[UIImageView alloc] init];
        topImage.image = [UIImage imageNamed:topImageAr[i]];
        [imageView addSubview:topImage];
        
        [topImage mas_makeConstraints:^(MASConstraintMaker *make) {
            
            make.top.equalTo(imageView.mas_top).mas_offset(12);
            make.left.equalTo(imageView.mas_left).mas_offset(12);
            make.width.mas_equalTo(22);
            make.height.mas_equalTo(20);
        }];
        
        UILabel * titleLabel = [[UILabel alloc] init];
        titleLabel.text = topImageAr[i];
        titleLabel.textColor = [UIColor whiteColor];
        titleLabel.font = [UIFont systemFontOfSize:14];
        titleLabel.textAlignment = NSTextAlignmentLeft;
        [imageView addSubview:titleLabel];
        
        [titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            
            make.centerY.equalTo(topImage.mas_centerY);
            make.left.equalTo(topImage.mas_right).mas_offset(10);
            make.width.mas_equalTo(60);
            make.height.mas_equalTo(15);
        }];

        UIButton *  btn = [UIButton buttonWithType:UIButtonTypeCustom];
        [btn setTitle:btnTitleAr[i] forState:UIControlStateNormal];
        [btn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        btn.titleLabel.font = [UIFont systemFontOfSize:18];
        btn.backgroundColor  = [Utility colorWithHexString:@"#ffffff" alpha:0.3];
        btn.tag = 100 + i;
        [imageView addSubview:btn];
        
        [btn mas_makeConstraints:^(MASConstraintMaker *make) {
            
            make.bottom.equalTo(imageView.mas_bottom);
            make.centerX.equalTo(imageView.mas_centerX);
            make.width.equalTo(imageView.mas_width);
            make.height.mas_equalTo(ScaleWidth(194)*2/9);
        }];
        
        UILabel * label = labelArr[i];
        label.textColor = [UIColor whiteColor];
        label.font = [UIFont systemFontOfSize:18];
        label.textAlignment = NSTextAlignmentCenter;
        [imageView addSubview:label];
        
        if (1 == i) {
            
            UIButton* btnming = [UIButton buttonWithType:UIButtonTypeCustom];
            btnming.titleLabel.font = [UIFont systemFontOfSize:14];
            [btnming setTitle:@"明细" forState:UIControlStateNormal];
            [btnming setTitleColor:GOLDCOLOR forState:UIControlStateNormal];
            [imageView addSubview:btnming];
            [btnming addTarget:self action:@selector(inComeClick) forControlEvents:UIControlEventTouchUpInside];
            [btnming mas_makeConstraints:^(MASConstraintMaker *make) {
                make.top.equalTo(imageView.mas_top).mas_offset(ScaleWidth(10));
                make.right.equalTo(imageView.mas_right).offset(0);
                make.width.mas_equalTo(60);
                make.height.mas_equalTo(20);
            }];
            
            [label mas_makeConstraints:^(MASConstraintMaker *make) {
                
                make.top.equalTo(imageView.mas_top).mas_offset(ScaleWidth(55));
                make.centerX.equalTo(imageView.mas_centerX);
                make.width.equalTo(imageView.mas_width);
                make.height.mas_equalTo(20);
            }];
            
            UILabel * WBLabel = [[UILabel alloc] init];
            WBLabel.text = @"红包收益";
            WBLabel.textColor = [UIColor whiteColor];
            WBLabel.font = [UIFont systemFontOfSize:14];
            WBLabel.textAlignment = NSTextAlignmentCenter;
            WBLabel.backgroundColor = [UIColor clearColor];
            [imageView addSubview:WBLabel];
            
            CGFloat width = ScaleWidth(267) / 3;
            
            [WBLabel mas_makeConstraints:^(MASConstraintMaker *make) {
                make.top.equalTo(imageView.mas_top).mas_offset(ScaleWidth(98));
                make.left.equalTo(imageView.mas_left).mas_offset(ScaleWidth(30));
                make.height.mas_equalTo(13.5);
                make.width.mas_equalTo(60);
            }];
            
            UILabel * RLabel = [[UILabel alloc] init];
            RLabel.text = @"邀请分成";
            RLabel.textColor = [UIColor whiteColor];
            RLabel.font = [UIFont systemFontOfSize:14];
            RLabel.textAlignment = NSTextAlignmentCenter;
            RLabel.backgroundColor = [UIColor clearColor];
            [imageView addSubview:RLabel];
            
            [RLabel mas_makeConstraints:^(MASConstraintMaker *make) {
                
                make.top.equalTo(imageView.mas_top).mas_offset(ScaleWidth(133));
                make.left.equalTo(imageView.mas_left).mas_offset(ScaleWidth(30));
                make.height.mas_equalTo(13.5);
                make.width.mas_equalTo(60);
            }];
            
            UILabel * xLabel = [[UILabel alloc] init];
            xLabel.text = @"消费分成";
            xLabel.textColor = [UIColor whiteColor];
            xLabel.font = [UIFont systemFontOfSize:14];
            xLabel.textAlignment = NSTextAlignmentCenter;
            xLabel.backgroundColor = [UIColor clearColor];
            [imageView addSubview:xLabel];
            [xLabel mas_makeConstraints:^(MASConstraintMaker *make) {
                
                make.top.equalTo(imageView.mas_top).mas_offset(ScaleWidth(168));
                make.left.equalTo(imageView.mas_left).mas_offset(ScaleWidth(30));
                make.height.mas_equalTo(13.5);
                make.width.mas_equalTo(60);
            }];
            
            UILabel * otLabel = [[UILabel alloc] init];
            otLabel.text = @"其他收益";
            otLabel.textColor = [UIColor whiteColor];
            otLabel.font = [UIFont systemFontOfSize:14];
            otLabel.textAlignment = NSTextAlignmentCenter;
            otLabel.backgroundColor = [UIColor clearColor];
            [imageView addSubview:otLabel];
            [otLabel mas_makeConstraints:^(MASConstraintMaker *make) {
                make.top.equalTo(imageView.mas_top).mas_offset(ScaleWidth(203));
                make.left.equalTo(imageView.mas_left).mas_offset(ScaleWidth(30));
                make.height.mas_equalTo(13.5);
                make.width.mas_equalTo(60);
            }];
            
            _labelMoneySW = [[UILabel alloc] init];
            _labelMoneySW.textColor = [UIColor whiteColor];
            _labelMoneySW.font = [UIFont systemFontOfSize:21];
            _labelMoneySW.textAlignment = NSTextAlignmentRight;
            _labelMoneySW.backgroundColor = [UIColor clearColor];
            [imageView addSubview:_labelMoneySW];
//            _labelMoneySW.text = @"10000元";
            [_labelMoneySW mas_makeConstraints:^(MASConstraintMaker *make) {
                
                make.top.equalTo(WBLabel.mas_top).mas_offset(-2.25);
                make.right.equalTo(imageView.mas_right).mas_offset(-30);
                make.height.mas_equalTo(18);
                make.width.mas_equalTo(150);
                
            }];
            
            _labelMoneySR = [[UILabel alloc] init];
            _labelMoneySR.textColor = [UIColor whiteColor];
            _labelMoneySR.font = [UIFont systemFontOfSize:21];
            _labelMoneySR.textAlignment = NSTextAlignmentRight;
            _labelMoneySR.backgroundColor = [UIColor clearColor];
            [imageView addSubview:_labelMoneySR];
//            _labelMoneySR.text = @"20000元";
            [_labelMoneySR mas_makeConstraints:^(MASConstraintMaker *make) {
                
                make.top.equalTo(RLabel.mas_top).mas_offset(-2.25);
                make.right.equalTo(imageView.mas_right).mas_offset(-30);
                make.height.mas_equalTo(18);
                make.width.mas_equalTo(150);
            }];
            
            
            _labelMoneyXF = [[UILabel alloc] init];
            _labelMoneyXF.textColor = [UIColor whiteColor];
            _labelMoneyXF.font = [UIFont systemFontOfSize:21];
            _labelMoneyXF.textAlignment = NSTextAlignmentRight;
            _labelMoneyXF.backgroundColor = [UIColor clearColor];
            [imageView addSubview:_labelMoneyXF];
//            _labelMoneyXF.text = @"30000元";
            [_labelMoneyXF mas_makeConstraints:^(MASConstraintMaker *make) {
                
                make.top.equalTo(xLabel.mas_top).mas_offset(-2.25);
                make.right.equalTo(imageView.mas_right).mas_offset(-30);
                make.height.mas_equalTo(18);
                make.width.mas_equalTo(150);
            }];
            
            _labelMoneyOT = [[UILabel alloc] init];
            _labelMoneyOT.textColor = [UIColor whiteColor];
            _labelMoneyOT.font = [UIFont systemFontOfSize:21];
            _labelMoneyOT.textAlignment = NSTextAlignmentRight;
            _labelMoneyOT.backgroundColor = [UIColor clearColor];
            [imageView addSubview:_labelMoneyOT];
//                        _labelMoneyXF.text = @"30000元";
            [_labelMoneyOT mas_makeConstraints:^(MASConstraintMaker *make) {
                make.top.equalTo(otLabel.mas_top).mas_offset(-2.25);
                make.right.equalTo(imageView.mas_right).mas_offset(-30);
                make.height.mas_equalTo(18);
                make.width.mas_equalTo(150);
            }];
            
            [btn addTarget:self action:@selector(withdraClick) forControlEvents:UIControlEventTouchUpInside];
        }
        else {
            [label mas_makeConstraints:^(MASConstraintMaker *make) {
                make.centerY.equalTo(imageView.mas_centerY);
                make.centerX.equalTo(imageView.mas_centerX);
                make.width.equalTo(imageView.mas_width);
                make.height.mas_equalTo(25);
            }];
            [btn addTarget:self action:@selector(rechargeMoney:) forControlEvents:UIControlEventTouchUpInside];
        }
    }
}

/*
 totalIncome 总收益
 totalMoney  剩余总金额
 gold" :  余额收益
 balance" : 余额
 coin" :  玩币
 coinBack" :  玩币收益
*/
//- (void)setModel:(MY_TTLMeModel *)model {
-(void)upLoadData:(MY_TTLMeModel *)model{
        
//  收益
    NSString * strS = [NSString stringWithFormat:@"%.2f",[model.moneyBack doubleValue]];
    
    NSMutableString * stringS = [NSMutableString stringWithFormat:@"%@元", [Utility isBlankString:strS] ? @"0" :  strS];
    NSMutableAttributedString * attStrS = [[NSMutableAttributedString alloc] initWithString:stringS];
    
    [attStrS addAttribute:NSFontAttributeName
                    value:[UIFont systemFontOfSize:24]
                    range:NSMakeRange(0, attStrS.length - 1)];
    
    _labelMoneyS.attributedText = attStrS;

//  充值
    NSString * strC = [NSString stringWithFormat:@"%.2f",[model.money doubleValue]];
    
    NSMutableString * stringC = [NSMutableString stringWithFormat:@"%@元", [Utility isBlankString:strC] ? @"0" :  strC];
    
    NSMutableAttributedString * attStrC = [[NSMutableAttributedString alloc] initWithString:stringC];

    [attStrC addAttribute:NSFontAttributeName
                    value:[UIFont systemFontOfSize:24]
                    range:NSMakeRange(0, attStrC.length - 1)];
    
    _labelMoneyC.attributedText = attStrC;
    
    
//  收益详情
    //红包收益
    NSString * strSW = [NSString stringWithFormat:@"%.2f", [model.hongbaoGetMoney doubleValue]];

    NSMutableString * stringSW = [NSMutableString stringWithFormat:@"%@元", [Utility isBlankString:strSW] ? @"0" :  strSW];
    
    NSMutableAttributedString * attStrSW = [[NSMutableAttributedString alloc] initWithString:stringSW];
    
    [attStrSW addAttribute:NSFontAttributeName
                    value:[UIFont systemFontOfSize:12]
                    range:NSMakeRange(attStrSW.length - 2, 2)];
    
    _labelMoneySW.attributedText = attStrSW;
    
    //￥邀请分成
    NSString * strSR = [NSString stringWithFormat:@"%.2f", [model.moneyIncomeGet doubleValue]];
    
    NSMutableString * stringSR = [NSMutableString stringWithFormat:@"%@元", [Utility isBlankString:strSR] ? @"0" :  strSR];
    
    NSMutableAttributedString * attStrSR = [[NSMutableAttributedString alloc] initWithString:stringSR];
    
    [attStrSR addAttribute:NSFontAttributeName
                    value:[UIFont systemFontOfSize:12]
                    range:NSMakeRange(attStrSR.length - 2, 2)];
    
    _labelMoneySR.attributedText = attStrSR;
    
    
    //消费分成
    NSString * strXF = [NSString stringWithFormat:@"%.2f", [model.moneyIncomeSend doubleValue]];
    
    NSMutableString * stringXF = [NSMutableString stringWithFormat:@"%@元", [Utility isBlankString:strXF] ? @"0" :  strXF];
    
    NSMutableAttributedString * attStrXF = [[NSMutableAttributedString alloc] initWithString:stringXF];
    
    [attStrXF addAttribute:NSFontAttributeName
                     value:[UIFont systemFontOfSize:12]
                     range:NSMakeRange(attStrXF.length - 2, 2)];
    
    _labelMoneyXF.attributedText = attStrXF;
    
    //其他收益
    NSString * strOT = [NSString stringWithFormat:@"%.2f", [model.other doubleValue]];

    NSMutableString * stringOT = [NSMutableString stringWithFormat:@"%@元", [Utility isBlankString:strOT] ? @"0" :  strOT];

    NSMutableAttributedString * attStrOT = [[NSMutableAttributedString alloc] initWithString:stringOT];

    [attStrOT addAttribute:NSFontAttributeName
                     value:[UIFont systemFontOfSize:12]
                     range:NSMakeRange(attStrOT.length - 2, 2)];

    _labelMoneyOT.attributedText = attStrOT;
}

-(void)inComeClick
{
    MY_TTLIncomeDetailViewController* inVc = [[MY_TTLIncomeDetailViewController alloc]init];
    [self.navigationController pushViewController:inVc animated:YES];
}

#pragma mark 提现点击事件
-(void)withdraClick
{
    MY_XTTiXianViewController* draVc = [[MY_XTTiXianViewController alloc]init];
    draVc.money = _labelMoneyS.text;
    [self.navigationController pushViewController:draVc animated:YES];
}
#pragma mark 充值点击事件
-(void)rechargeMoney:(UIButton *)btn
{
    RechargeViewController* reVc = [[RechargeViewController alloc]init];
    
    [self.navigationController pushViewController:reVc animated:YES];
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
