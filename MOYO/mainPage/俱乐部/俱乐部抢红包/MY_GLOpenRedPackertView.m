//
//  MY_GLOpenRedPackertView.m
//  VTIME
//
//  Created by gll on 2017/10/19.
//  Copyright © 2017年 MadridLee. All rights reserved.
//

#import "MY_GLOpenRedPackertView.h"

@interface MY_GLOpenRedPackertView()

@property (strong, nonatomic) UIView  *    backView;
@property (strong, nonatomic) UIImageView* backImgView;

@property (strong, nonatomic) UIImageView* imgvHead;

@property (strong, nonatomic) UILabel*    nickLabel;
@property (strong, nonatomic) UILabel*    moneyLabel;
@property (strong, nonatomic) UIButton*   btnAdd;

@end


@implementation MY_GLOpenRedPackertView


- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
        self.backgroundColor = [UIColor clearColor];
        [self setupUI];
        
/*
 NSString * titleStr = [NSString stringWithFormat:@"%td个红包，已被抢完，总金额¥%@",[_model.num longValue],[_model.totalMoney stringValue]];
 if ([_model.grepNum integerValue] != [_model.num integerValue]) {
 titleStr = [NSString stringWithFormat:@"%td个红包，已抢%td个，总金额¥%@",[_model.num longValue],[_model.grepNum integerValue],[_model.totalMoney stringValue]];
 }
 
 */
        
    }
    return self;
}

-(void)setRedViewMoney:(NSString*)money withModel:(NSDictionary*)dic{
    
    /*
     [0]    (null)    @"roomId" : (int)2120549
     [1]    (null)    @"userId" : (int)2120548
     [2]    (null)    @"xiTongMsgFirstList" : @"0 elements"
     [3]    (null)    @"nickname" : @"Brian "
     [4]    (null)    @"xiTongMsgType" : (int)0
     [5]    (null)    @"groupNickName" : @"Happy23"
     [6]    (null)    @"groupAvaterURLPath" : @"http://123.59.69.252/upload/images/sm_2120549-59992584968173655961508413405143.png"
     [7]    (null)    @"type" : @"sendMultipleHongbao"
     [8]    (null)    @"avatarURLPath" : @"http://123.59.69.252/upload/images/2120548-47354327060839836691508136733647.png"
     [9]    (null)    @"typeMsg" : @"{\"msg\":\"嗯休息\",\"hid\":211,\"roomId\":2120549}"
     */
    
//    NSData * data = [dic[@"typeMsg"] dataUsingEncoding:(NSUTF8StringEncoding)];
//
//    NSDictionary * typeMsgdic = [NSJSONSerialization JSONObjectWithData:data options:NSUTF8StringEncoding error:nil];
    
    if ([money  length]) {
        self.moneyLabel.text = [NSString stringWithFormat:@"%.2f元",[money doubleValue]];
    }
    
    if (dic[@"avatarURLPath"]) {
        NSURL * imgUrl = [NSURL URLWithString:dic[@"avatarURLPath"]];
        
        __weak typeof(self) weakSwlf = self;
        
        [self.imgvHead sd_setImageWithURL:imgUrl placeholderImage:[UIImage imageNamed:@"aa"] completed:^(UIImage *image, NSError *error, SDImageCacheType cacheType, NSURL *imageURL) {
            
            weakSwlf.imgvHead.image = [Utility circleImage:image borderWidth:0 borderColor:0];
        }];
    }
    
    if (![Utility isBlankString:dic[@"nickname"]]) {
        self.nickLabel.text = dic[@"nickname"];
    }
        
//    self.redGetInfo.text = typeMsgdic[@"msg"];
    
}

-(void)setupUI{
    
    UIColor * whiteColor = [UIColor whiteColor];
    
    self.backView = [[UIView alloc]init];
    self.backView.backgroundColor = [UIColor blackColor];
    self.backView.alpha = 0.2;
    [self addSubview:self.backView];

    [self.backView mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.left.equalTo(self.mas_left).offset(0);
        make.right.equalTo(self.mas_right).offset(0);
        make.top.equalTo(self.mas_top).offset(0);
        make.bottom.mas_equalTo(self.mas_bottom).offset(0);
    }];
    
    
    self.backImgView = [[UIImageView alloc]init];

    self.backImgView.image = [UIImage imageNamed:@"club_openHongbao"];
    [self addSubview:self.backImgView];
    [self.backImgView setContentMode:UIViewContentModeScaleAspectFill];
    self.backImgView.clipsToBounds = YES;
    self.backImgView.userInteractionEnabled = YES;
    
    [self.backImgView mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.left.equalTo(self.backView.mas_left).offset(10);
//        make.right.equalTo(self.backView.mas_right).offset(-10);
//        make.top.equalTo(self.backView.mas_top).offset(170);
//        make.bottom.equalTo(self.backView.mas_bottom).offset(-170);
        make.width.mas_equalTo(SCREEN_WIDTH);
        make.height.mas_equalTo(52*SCREEN_WIDTH/49);
        make.centerX.equalTo(self.backView.mas_centerX).offset(0);
        make.centerY.equalTo(self.backView.mas_centerY).offset(0);
    }];
    
    
    self.imgvHead = [[UIImageView alloc]init];
    [self.backImgView addSubview:self.imgvHead];
    [self.imgvHead setContentMode:UIViewContentModeScaleAspectFill];
    self.imgvHead.clipsToBounds = YES;
    self.imgvHead.userInteractionEnabled = YES;
    
    [self.imgvHead mas_makeConstraints:^(MASConstraintMaker *make) {

        make.centerX.equalTo(self.backImgView.mas_centerX).offset(0);
        make.top.equalTo(self.backImgView.mas_top).offset(18+SCREEN_WIDTH/49*5);
        make.width.mas_equalTo(70);
        make.height.mas_equalTo(70);
    }];
    
    self.nickLabel = [[UILabel alloc] init];
    self.nickLabel.textColor = whiteColor;
    self.nickLabel.textAlignment = NSTextAlignmentCenter;
    self.nickLabel.font = [UIFont systemFontOfSize:19];
    [self.backImgView addSubview:self.nickLabel];
    
    [self.nickLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.left.equalTo(self.backImgView.mas_left).offset(0);
        make.right.equalTo(self.backImgView.mas_right).offset(0);
        make.top.equalTo(self.imgvHead.mas_bottom).offset(7);
        make.height.mas_equalTo(15);
    }];
    
    
    self.redGetInfo = [[UILabel alloc] init];
    self.redGetInfo.textColor = whiteColor;
    self.redGetInfo.textAlignment = NSTextAlignmentCenter;
    self.redGetInfo.font = [UIFont systemFontOfSize:18];
    self.redGetInfo.text = @"您已抢了";
    [self.backImgView addSubview:self.redGetInfo];
    
    [self.redGetInfo mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.left.equalTo(self.backImgView.mas_left).offset(0);
        make.right.equalTo(self.backImgView.mas_right).offset(0);
        make.top.equalTo(self.nickLabel.mas_bottom).offset(20);
        make.height.mas_equalTo(18);
    }];
    
    
    self.moneyLabel = [[UILabel alloc] init];
    self.moneyLabel.textColor = whiteColor;
    self.moneyLabel.textAlignment = NSTextAlignmentCenter;
    self.moneyLabel.font = [UIFont systemFontOfSize:19];
    self.moneyLabel.text = @"元";
    [self.backImgView addSubview:self.moneyLabel];
    
    [self.moneyLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.left.equalTo(self.backImgView.mas_left).offset(0);
        make.right.equalTo(self.backImgView.mas_right).offset(0);
        make.top.equalTo(self.redGetInfo.mas_bottom).offset(13);
        make.height.mas_equalTo(15);
    }];
    
    
    self.btnAdd = [UIButton buttonWithType:UIButtonTypeCustom];
    self.btnAdd.layer.masksToBounds = YES;
    self.btnAdd.layer.cornerRadius  = 14;
    [self.backImgView addSubview:self.btnAdd];
    [self.btnAdd setBackgroundColor:[UIColor clearColor]];
    self.btnAdd.titleLabel.font = [UIFont systemFontOfSize:19];
    [self.btnAdd setTitle:@"查看领取详情" forState:UIControlStateNormal];
    [self.btnAdd addTarget:self action:@selector(knownTaClickMethod:) forControlEvents:(UIControlEventTouchUpInside)];
    [self.btnAdd mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.backImgView.mas_left).offset(20);
        make.right.equalTo(self.backImgView.mas_right).offset(-20);
        make.bottom.equalTo(self.backImgView.mas_bottom).offset(-10-SCREEN_WIDTH/49*5);
        make.height.mas_equalTo(39);
    }];
    
}


// goto 红包详情页
-(void)knownTaClickMethod:(UIButton*)sender{
    
    if(self.GoToRedPacketInfoBlock){
        self.GoToRedPacketInfoBlock(self);
    }
    
}

-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    
    
    [UIView animateWithDuration:0.2 animations:^{
        
        self.alpha = 0.0;
        
    } completion:^(BOOL finished) {
        
        [self removeFromSuperview];
        
    }];
    
}



/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
