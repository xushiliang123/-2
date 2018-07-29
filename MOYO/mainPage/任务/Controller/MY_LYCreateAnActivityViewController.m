//
//  MY_XTCreateAnActivityViewController.m
//  VTIME
//
//  Created by tingting on 2017/11/7.
//  Copyright © 2017年 MadridLee. All rights reserved.
//

#import "MY_LYCreateAnActivityViewController.h"
#import "MY_XTSubjectTableViewCell.h"
#import "MY_TTLEditMateritalTableViewCell.h"
#import "MY_LYMessageInfoModel.h"
#import "MY_XTPickTimeView.h"
#import "MY_XTPickRedPackageView.h"
#import "MY_XTCreateAnActivityViewCell.h"
#import "MY_LYLocationViewController.h"
#import "PickerModel.h"
#import "CustomPickerView.h"
#import "TimePickerView.h"

@interface MY_LYCreateAnActivityViewController ()<UITableViewDelegate,UITableViewDataSource,delegateColl,UITextFieldDelegate>
{
    UIButton *BoyBtn;
    UIButton *GirlBtn;
    UIButton *AnyBtn;
    
    UIButton *downBtn;
    UIButton *addBtn;
    UITextField *personNumtextfield;
    
    UILabel *personNumLable;
    UILabel *timeLabel;
    UILabel *redpgLabel;
    UILabel *cityLabel;
    
    UITextField *cityText;
    
    UITextField *placeText;
    UITextField *hongbaoText;
    
    UITextField *BeizhuText;
    
    UIButton *StartBtn;

    UISwitch * _mySwitch;
    
    MY_XTPickTimeView *picktimeV;
    MY_XTPickRedPackageView *pickpgV;
    
    UIButton *footerButton;
    
    //任务说明
    NSString *_renwuString;
    
    NSArray *_pickerArray;
    
    PickerModel * _timeModel;
    NSString *_currTimeStr;
    
    CGFloat _yueMoney;
    
}

@property (strong, nonatomic) NSArray *imgList;
@property (strong, nonatomic) NSArray *nameList;
@property (strong, nonatomic) NSArray* arrayTitle;
@property (nonatomic, strong) UIButton *lastSelectedButton;
// 按钮数组
@property (nonatomic, strong) NSMutableArray *btnArray;
//@property (nonatomic, assign) NSInteger personnumber;
@property(retain,nonatomic) UISwitch * mySwitch;

@property (nonatomic, strong) NSMutableDictionary *activityList;

@property (nonatomic, strong) NSMutableDictionary *dataDict;
@property (nonatomic, strong) MY_LYPersonInfoModel * uModel;

@end



@implementation MY_LYCreateAnActivityViewController


- (NSMutableArray *)btnArray {
    if (!_btnArray) {
        NSMutableArray *array = [NSMutableArray array];
        _btnArray = array;
        
    }
    return _btnArray;
}

- (NSMutableDictionary *)activityList {
    if (!_activityList) {
        NSMutableDictionary *dictionary = [NSMutableDictionary dictionary];
        _activityList = dictionary;
    }
    return _activityList;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.title = @"发布";
    self.arrayTitle = @[@"性别",@"人数",@"时间",@"红包",@"所在地",@"匿名",@"任务说明"];
//    _personnumber = 1;
//    _uModel = [[MessageInfoModel sharedManager] loadPersonModelWithID: [USERID integerValue]];
    
    NSString * where = [NSString stringWithFormat:@"userId = %td",[USERID integerValue]];
    NSArray *arry = [[MY_LLDBManager sharedManager] selectClass:[MY_LYPersonInfoModel class] withWhere:where];
    _uModel = arry.firstObject;
    
    if(_uModel.selectRegion){//是否有地理位置信息
        [self.activityList setObject:_uModel.selectRegion forKey:@"所在地"];
    }else{
        [self.activityList setObject:@"" forKey:@"所在地"];
    }

//    [self.activityList setObject:@"1" forKey:@"类型"];
    [self.activityList setObject:@"0" forKey:@"性别"];
    [self.activityList setObject:@1 forKey:@"人数"];
    [self.activityList setObject:@"1" forKey:@"匿名"];
    [self.activityList setObject:@"1000" forKey:@"红包"];
    [self.activityList setObject:@"" forKey:@"任务说明"];
    [self.activityList setObject:@"选择时间" forKey:@"时间"];
    [self uiConfig];
    
    //获取余额
    NSMutableDictionary * parameters = [NSMutableDictionary dictionary];
    [TLHTTPRequest MY_getWithBaseUrl:BalanceURL parameters:parameters success:^(NSURLSessionDataTask * _Nonnull task, NSDictionary * _Nonnull data) {
        if ([[data objectForKey:@"ret"] integerValue] == 0) {
            NSDictionary * infoDict = data[@"info"];
            _yueMoney = [infoDict[@"totalMoney"] floatValue];
        }
    } failure:^(NSURLSessionDataTask * _Nonnull task, NSError * _Nonnull error) {
        
    }];
    
//    [self setTimeDate];
}

-(void)uiConfig
{
    self.automaticallyAdjustsScrollViewInsets = NO;
    self.tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT-64) style:UITableViewStylePlain];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    self.tableView.tableFooterView = [UIView new];
    [self.tableView setSeparatorStyle:(UITableViewCellSeparatorStyleSingleLine)];
    [self.tableView setSeparatorColor:[Utility colorWithHexString:@"efefef" alpha:1]];
    self.tableView.backgroundColor = [UIColor whiteColor];
//    self.tableView.scrollEnabled = NO;
    [self.tableView registerNib:[UINib nibWithNibName:@"MY_XTSubjectTableViewCell" bundle:nil] forCellReuseIdentifier:@"MY_XTSubjectTableViewCell"];
    [self.view addSubview:self.tableView];
    
    UIView *view = [[UIView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 85)];
    view.backgroundColor = self.tableView.backgroundColor;
    self.tableView.tableFooterView = view;
    
    footerButton = [UIButton buttonWithType:UIButtonTypeCustom];
    footerButton.frame = CGRectMake(104, 40 * SCREEN_HEIGHT / 667, SCREEN_WIDTH - 208, 41 * SCREEN_HEIGHT / 667);
//    footerButton.layer.cornerRadius = footerButton.frame.size.height/2;
//    [footerButton setTitle:@"发布任务" forState:UIControlStateNormal];
//    [footerButton setBackgroundColor:[Utility colorWithHexString:@"#DAB878" alpha:1.0f]];
    [footerButton setImage:[UIImage imageNamed:@"发布发起活动"] forState:UIControlStateNormal];
    [footerButton setImage:[UIImage imageNamed:@"发布发起活动1"] forState:UIControlStateSelected];
    footerButton.selected = NO;
    footerButton.enabled = NO;
    [footerButton addTarget:self action:@selector(StartAnActivity) forControlEvents:UIControlEventTouchUpInside];
    
    UILabel *lab = [[UILabel alloc] initWithFrame:CGRectMake(25, 5, SCREEN_WIDTH-50, 20)];
    lab.text = @"您发布的任务金额越高，任务排名越靠前哦！";
    lab.textColor = [Utility colorWithHexString:@"#FF7979" alpha:1.0f];
    lab.font = [UIFont systemFontOfSize:14];
    
    [view addSubview:lab];
    [view addSubview:footerButton];
    
    
}
//- (void)setTimeDate{
//    
//}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    //    return [self.dataArray count];
    return self.arrayTitle.count;
}
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    if(indexPath.row == 6)
    {
        return 180 * SCREEN_HEIGHT / 667;
    }
    return 50 * SCREEN_HEIGHT / 667;
}



- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    if(indexPath.row == 6)
    {
        static NSString *CellID = @"MY_XTCreateAnActivityViewCell";
        MY_XTCreateAnActivityViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellID];
        if (cell == nil) {
            cell = [[[NSBundle mainBundle]loadNibNamed:@"MY_XTCreateAnActivityViewCell" owner:self options:nil] lastObject];
        }

        //编辑完任务返回内容
        __weak typeof(self) weakself = self;
        __weak typeof(footerButton) weakSelffooterButton = footerButton;
        cell.textBlock = ^(NSString *text) {
            _renwuString = text;
            [self.activityList setObject:text forKey:@"任务说明"];
            if([NSString stringWithFormat:@"%@",[weakself.activityList objectForKey:@"时间"]].length != 0 && [NSString stringWithFormat:@"%@",[weakself.activityList objectForKey:@"红包"]].length != 0 && [NSString stringWithFormat:@"%@",[weakself.activityList objectForKey:@"备注"]].length != 0 && [NSString stringWithFormat:@"%@",[weakself.activityList objectForKey:@"地点"]].length != 0 && [NSString stringWithFormat:@"%@",[weakself.activityList objectForKey:@"所在地"]].length != 0  && [NSString stringWithFormat:@"%@",[weakself.activityList objectForKey:@"任务说明"]].length != 0 )
            {
                weakSelffooterButton.selected = YES;
                weakSelffooterButton.enabled = YES;
            }
        };
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        return cell;
    }
    else
    {
        static NSString *CellID = @"MY_TTLEditMateritalTableViewCell";
        MY_TTLEditMateritalTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellID];
        if (cell == nil) {
            cell = [[[NSBundle mainBundle]loadNibNamed:@"MY_TTLEditMateritalTableViewCell" owner:self options:nil] lastObject];
        }
        cell.titleLabel.text = self.arrayTitle[indexPath.row];
        cell.titleLabel.font = [UIFont systemFontOfSize:16 * SCREEN_HEIGHT / 667];
        cell.titleLabel.textColor = [Utility colorWithHexString:@"666666" alpha:1];
        cell.textField.hidden = YES;
        cell.detailLabel.hidden  = YES;
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        UIImageView *imgV = [[UIImageView alloc]initWithFrame:CGRectMake(SCREEN_WIDTH - 34 * SCREEN_WIDTH / 375 , 18.5 * SCREEN_HEIGHT / 667, 8 * SCREEN_WIDTH / 375, 13 * SCREEN_HEIGHT / 667)];
        imgV.image = [UIImage imageNamed:@"shuzhe"];
        [cell.contentView addSubview:imgV];

        switch (indexPath.row) {
            case 0:
                GirlBtn = [UIButton buttonWithType:UIButtonTypeCustom];//button的类型
                GirlBtn.frame = CGRectMake(161 * SCREEN_WIDTH/375, 12 * SCREEN_HEIGHT / 667,44 * SCREEN_WIDTH/375, 27 * SCREEN_HEIGHT / 667);
                [GirlBtn setImage:[UIImage imageNamed:@"男女未选中"] forState:UIControlStateNormal];
                [GirlBtn setImage:[UIImage imageNamed:@"男女选中"] forState:UIControlStateSelected];
                [GirlBtn setTitle:@" 女" forState:0];
                [GirlBtn setTitleColor:[Utility colorWithHexString:@"#909090" alpha:1.0f] forState:0];
                GirlBtn.imageEdgeInsets = UIEdgeInsetsMake(0,0,0,GirlBtn.titleLabel.bounds.size.width);
                GirlBtn.tag = 0;
                [GirlBtn addTarget:self action:@selector(tap:) forControlEvents:UIControlEventTouchUpInside];
                [cell.contentView addSubview:GirlBtn];
                [self.btnArray addObject:GirlBtn];
                
                if ([self.activityList[@"性别"] isEqualToString:@"0"]) {
                    GirlBtn.selected = YES;
                }else{
                    GirlBtn.selected = NO;
                }
                
                
                BoyBtn = [UIButton buttonWithType:UIButtonTypeCustom];//button的类型
                BoyBtn.frame = CGRectMake(217 * SCREEN_WIDTH/375, 12 * SCREEN_HEIGHT / 667,44 * SCREEN_WIDTH/375, 27 * SCREEN_HEIGHT / 667);
                [BoyBtn setImage:[UIImage imageNamed:@"男女未选中"] forState:UIControlStateNormal];
                [BoyBtn setImage:[UIImage imageNamed:@"男女选中"] forState:UIControlStateSelected];
                BoyBtn.imageEdgeInsets = UIEdgeInsetsMake(0,0,0,BoyBtn.titleLabel.bounds.size.width);
                [BoyBtn setTitle:@" 男" forState:0];
                [BoyBtn setTitleColor:[Utility colorWithHexString:@"#909090" alpha:1.0f] forState:0];
                [BoyBtn addTarget:self action:@selector(tap:) forControlEvents:UIControlEventTouchUpInside];
                BoyBtn.tag = 1;
                [cell.contentView addSubview:BoyBtn];
                [self.btnArray addObject:BoyBtn];
                if ([self.activityList[@"性别"] isEqualToString:@"1"]) {
                    BoyBtn.selected = YES;
                }else{
                    BoyBtn.selected = NO;
                }
                
                AnyBtn = [UIButton buttonWithType:UIButtonTypeCustom];//button的类型
                AnyBtn.frame = CGRectMake(273 * SCREEN_WIDTH/375, 12 * SCREEN_HEIGHT / 667,80 * SCREEN_WIDTH/375, 27 * SCREEN_HEIGHT / 667);
                [AnyBtn setImage:[UIImage imageNamed:@"男女未选中"] forState:UIControlStateNormal];
                [AnyBtn setImage:[UIImage imageNamed:@"男女选中"] forState:UIControlStateSelected];
                [AnyBtn setTitle:@" 不限" forState:0];
                [AnyBtn setTitleColor:[Utility colorWithHexString:@"#909090" alpha:1.0f] forState:0];
                [AnyBtn addTarget:self action:@selector(tap:) forControlEvents:UIControlEventTouchUpInside];
                AnyBtn.tag = 2;
                [cell.contentView addSubview:AnyBtn];
                [self.btnArray addObject:AnyBtn];
                if ([self.activityList[@"性别"] isEqualToString:@"2"]) {
                    AnyBtn.selected = YES;
                }else{
                    AnyBtn.selected = NO;
                }
                
                [imgV setHidden:YES];
                
                break;
                
            case 1:
                
                personNumLable = [[UILabel alloc]initWithFrame:CGRectMake(SCREEN_WIDTH - 172* SCREEN_WIDTH/375, 18* SCREEN_HEIGHT / 667, 130* SCREEN_WIDTH/375, 14* SCREEN_HEIGHT / 667)];
                personNumLable.font = [UIFont systemFontOfSize:14* SCREEN_HEIGHT / 667];
                personNumLable.textColor = [Utility colorWithHexString:@"#909090" alpha:1.0f];
                personNumLable.textAlignment = NSTextAlignmentRight;
                personNumLable.text = @"1";
                [cell.contentView addSubview:personNumLable];
                
//                downBtn = [UIButton buttonWithType:UIButtonTypeCustom];//button的类型
//                downBtn.frame = CGRectMake(SCREEN_WIDTH - 107 * SCREEN_WIDTH/375, 16 * SCREEN_HEIGHT / 667,18 * SCREEN_WIDTH/375, 18 * SCREEN_HEIGHT / 667);
//                [downBtn setImage:[UIImage imageNamed:@"minusperson"] forState:UIControlStateNormal];
//                [downBtn addTarget:self action:@selector(downoraddperson:) forControlEvents:UIControlEventTouchUpInside];
//                downBtn.tag = 10001;
//                downBtn.enabled = NO;
//                [cell.contentView addSubview:downBtn];
//
//                personNumtextfield = [[UITextField alloc]initWithFrame:CGRectMake(SCREEN_WIDTH - 172* SCREEN_WIDTH/375, 18* SCREEN_HEIGHT / 667, 130* SCREEN_WIDTH/375, 14* SCREEN_HEIGHT / 667)];
////                personNumtextfield.layer.borderWidth = 1.0f;
////                personNumtextfield.layer.borderColor = [Utility colorWithHexString:@"#AAAAAA" alpha:1.0f].CGColor;
//                personNumtextfield.textColor = [Utility colorWithHexString:@"#909090" alpha:1.0f];
//                personNumtextfield.font = [UIFont systemFontOfSize:14 * SCREEN_WIDTH/375];
//                personNumtextfield.textAlignment = NSTextAlignmentRight;
//                personNumtextfield.text = @"1";
//                personNumtextfield.delegate = self;
//                personNumtextfield.keyboardType = UIKeyboardTypeNumberPad;
//                [personNumtextfield addTarget:self action:@selector(textFieldDidChange:) forControlEvents:UIControlEventEditingChanged];

//                [cell.contentView addSubview:personNumtextfield];
//
//                addBtn = [UIButton buttonWithType:UIButtonTypeCustom];//button的类型
//                addBtn.frame = CGRectMake(SCREEN_WIDTH - 42 * SCREEN_WIDTH/375, 16* SCREEN_HEIGHT / 667,18 * SCREEN_WIDTH/375, 18* SCREEN_HEIGHT / 667);
//                [addBtn setImage:[UIImage imageNamed:@"addperson_selected"] forState:UIControlStateNormal];
//                [addBtn addTarget:self action:@selector(downoraddperson:) forControlEvents:UIControlEventTouchUpInside];
//                addBtn.tag = 10002;
//                addBtn.enabled = YES;
//                [cell.contentView addSubview:addBtn];
                [imgV setHidden:YES];
                
                break;
                
            case 2:
                
                timeLabel = [[UILabel alloc]initWithFrame:CGRectMake(SCREEN_WIDTH - 172* SCREEN_WIDTH/375, 18* SCREEN_HEIGHT / 667, 130* SCREEN_WIDTH/375, 14* SCREEN_HEIGHT / 667)];
                timeLabel.font = [UIFont systemFontOfSize:14* SCREEN_HEIGHT / 667];
                timeLabel.textColor = [Utility colorWithHexString:@"#909090" alpha:1.0f];
                timeLabel.textAlignment = NSTextAlignmentRight;
                timeLabel.text = self.activityList[@"时间"];
                [cell.contentView addSubview:timeLabel];
                
                
                [imgV setHidden:NO];
//                cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
                break;
                
            case 3:
                redpgLabel = [[UILabel alloc]initWithFrame:CGRectMake(SCREEN_WIDTH - 58* SCREEN_WIDTH/375, 5* SCREEN_HEIGHT / 667, 14* SCREEN_HEIGHT / 667, 40* SCREEN_HEIGHT / 667)];
                redpgLabel.font = [UIFont systemFontOfSize:14* SCREEN_HEIGHT / 667];
                redpgLabel.textColor = [Utility colorWithHexString:@"#909090" alpha:1.0f];
                redpgLabel.text = @"元";
                [cell.contentView addSubview:redpgLabel];
                hongbaoText = [[UITextField alloc]initWithFrame:CGRectMake(SCREEN_WIDTH - 190* SCREEN_WIDTH/375, 5* SCREEN_HEIGHT / 667, 130* SCREEN_WIDTH/375, 40* SCREEN_HEIGHT / 667)];
                hongbaoText.font = [UIFont systemFontOfSize:14* SCREEN_HEIGHT / 667];
                hongbaoText.textColor = [Utility colorWithHexString:@"#909090" alpha:1.0f];
                hongbaoText.textAlignment = NSTextAlignmentRight;
                hongbaoText.tag = 20000100;
                hongbaoText.keyboardType = UIKeyboardTypeNumberPad;
                hongbaoText.delegate = self;
                hongbaoText.text = self.activityList[@"红包"];
                [hongbaoText addTarget:self action:@selector(textFieldDidChange:) forControlEvents:UIControlEventEditingChanged];
                [cell.contentView addSubview:hongbaoText];
                [imgV setHidden:YES];
                
                break;
            
            case 4:
                cityLabel = [[UILabel alloc]initWithFrame:CGRectMake(SCREEN_WIDTH - 172* SCREEN_WIDTH/375, 18* SCREEN_HEIGHT / 667, 130* SCREEN_WIDTH/375, 14* SCREEN_HEIGHT / 667)];
                cityLabel.font = [UIFont systemFontOfSize:14* SCREEN_HEIGHT / 667];
                cityLabel.textColor = [Utility colorWithHexString:@"#909090" alpha:1.0f];
                cityLabel.textAlignment = NSTextAlignmentRight;
                cityLabel.text = self.activityList[@"所在地"];
                [cell.contentView addSubview:cityLabel];
                
                [imgV setHidden:NO];
                
//                cityText = [[UITextField alloc]initWithFrame:CGRectMake(SCREEN_WIDTH - 172* SCREEN_WIDTH/375, 18* SCREEN_HEIGHT / 667, 130* SCREEN_WIDTH/375, 14* SCREEN_HEIGHT / 667)];
////                cityText.text = @"上海";
//                cityText.font = [UIFont systemFontOfSize:14* SCREEN_HEIGHT / 667];
//                cityText.textColor = [Utility colorWithHexString:@"#999999" alpha:1.0f];
//                cityText.textAlignment = NSTextAlignmentRight;
//                cityText.tag = 2000001;
//                cityText.text = self.activityList[@"所在地"];
//                [cityText addTarget:self action:@selector(textFieldDidChange:) forControlEvents:UIControlEventEditingChanged];
//                [cell.contentView addSubview:cityText];
//                [imgV setHidden:YES];
                
                break;
                
            case 5:
                _mySwitch = [[UISwitch alloc]init];
                _mySwitch.frame=CGRectMake(SCREEN_WIDTH - 70* SCREEN_WIDTH/375 , 11* SCREEN_HEIGHT / 667, 58* SCREEN_WIDTH/375, 24* SCREEN_HEIGHT / 667);
                if ([@"0" isEqualToString:self.activityList[@"匿名"]]) {
                    _mySwitch.on=NO;
                }else{
                    _mySwitch.on=YES;
                }

                [cell.contentView addSubview:_mySwitch];
                [_mySwitch setOnTintColor:[Utility colorWithHexString:@"#DAB878" alpha:1.0f]];
                [_mySwitch setThumbTintColor:[UIColor whiteColor]];
                _mySwitch.backgroundColor = [Utility colorWithHexString:@"#EEEEEE" alpha:1.0f];
                _mySwitch.layer.cornerRadius = 14* SCREEN_HEIGHT / 667;
                _mySwitch.layer.masksToBounds = true;
                [_mySwitch setTintColor:[Utility colorWithHexString:@"#EEEEEE" alpha:1.0f]];
                [_mySwitch addTarget:self action:@selector(swChange:) forControlEvents:UIControlEventValueChanged];
                [imgV setHidden:YES];
                

                break;
                
            case 6:
                
                placeText = [[UITextField alloc]initWithFrame:CGRectMake(SCREEN_WIDTH - 200* SCREEN_WIDTH/375, 18* SCREEN_HEIGHT / 667, 177* SCREEN_WIDTH/375, 14* SCREEN_HEIGHT / 667)];
                placeText.placeholder = @"填写一下活动的地址吧~";
                placeText.font = [UIFont systemFontOfSize:14* SCREEN_HEIGHT / 667];
                placeText.textColor = [Utility colorWithHexString:@"#909090" alpha:1.0f];
                placeText.textAlignment = NSTextAlignmentRight;
                placeText.tag = 2000002;
                [placeText addTarget:self action:@selector(textFieldDidChange:) forControlEvents:UIControlEventEditingChanged];
                [cell.contentView addSubview:placeText];
                [imgV setHidden:YES];
                //                cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
                
                break;
                
            case 7:
                
                BeizhuText = [[UITextField alloc]initWithFrame:CGRectMake(SCREEN_WIDTH - 200* SCREEN_WIDTH/375, 18* SCREEN_HEIGHT / 667, 177* SCREEN_WIDTH/375, 14* SCREEN_HEIGHT / 667)];
                BeizhuText.placeholder = @"简单说点你的要求啊！";
                BeizhuText.font = [UIFont systemFontOfSize:14* SCREEN_WIDTH/375];
                BeizhuText.textColor = [Utility colorWithHexString:@"#909090" alpha:1.0f];
                BeizhuText.textAlignment = NSTextAlignmentRight;
                BeizhuText.tag = 2000003;
                [BeizhuText addTarget:self action:@selector(textFieldDidChange:) forControlEvents:UIControlEventEditingChanged];
                [cell.contentView addSubview:BeizhuText];
                [imgV setHidden:YES];
                break;
            default:
                break;
        }
        
        return cell;
    }
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
//    __weak typeof(self) weakself = self;
//     __weak typeof(footerButton) weakSelffooterButton = footerButton;
    if(indexPath.row == 2)
    {
        [self addTimePickerView];
    }
//    else if(indexPath.row == 3)
//    {
//        pickpgV = [[MY_XTPickRedPackageView alloc]init];
//        pickpgV.number = personNumtextfield.text.intValue;
//        [pickpgV showInView:self.tableView];
//        __weak typeof(redpgLabel) weakSelfredpgLabel = redpgLabel;
//        __weak typeof(pickpgV) weakSelfpickpgV = pickpgV;
//        pickpgV.returnRedPBlock = ^(NSDictionary *dic) {
//            NSLog(@"%@",dic);
//            [weakSelfpickpgV disMissView];
//            weakSelfredpgLabel.text = [NSString stringWithFormat:@"%@",dic[@"type"]];
//            [weakself.activityList setObject:dic[@"type"] forKey:@"红包"];
//            [weakself.dataDict setObject:@"0" forKey:@"payMode"];
//            [weakself.dataDict setObject:@([dic[@"money"] integerValue]) forKey:@"money"];
//
//            if([NSString stringWithFormat:@"%@",[weakself.activityList objectForKey:@"时间"]].length != 0 && [NSString stringWithFormat:@"%@",[weakself.activityList objectForKey:@"红包"]].length != 0 && [NSString stringWithFormat:@"%@",[weakself.activityList objectForKey:@"备注"]].length != 0 && [NSString stringWithFormat:@"%@",[weakself.activityList objectForKey:@"地点"]].length != 0 && [NSString stringWithFormat:@"%@",[weakself.activityList objectForKey:@"所在地"]].length != 0  )
//            {
//                weakSelffooterButton.selected = YES;
//                weakSelffooterButton.enabled = YES;
//            }
//        };
//    }
    else if(indexPath.row == 4)
    {
        [self changeCity];
    }
}

-(void)gettime
{
    
}

#pragma mark --- 时间选择 ---

- (void)addTimePickerView
{
    __weak typeof(self) weakself = self;
    TimePickerView *timePicker = [[TimePickerView alloc] init];
    timePicker.timeBlbck = ^(NSString *timeString, NSString *showString) {
        [weakself.activityList setObject:showString forKey:@"时间"];
        [weakself.dataDict setObject:timeString forKey:@"expireTime"];
        [weakself.tableView reloadData];
    };
    [timePicker show];
}

- (void)addPickViewData{
    //    _timeArray = [NSArray array];
    _pickerArray = [NSArray array];
    
    NSArray * dayArray = @[@"今天", @"明天"];
    NSMutableArray * hourArray = [NSMutableArray array];
    NSMutableArray * minuteArray = [NSMutableArray array];
    
    _timeModel = [[PickerModel alloc] init];
    
    NSDate * date = [NSDate date];
    NSDateFormatter * format = [[NSDateFormatter alloc] init];
    format.dateFormat = @"yyyy-MM-dd HH:mm";
    _currTimeStr = [NSMutableString stringWithFormat:@"%@", [format stringFromDate:date]];
    
    
    NSRange hourRange = {11, 2};
    NSString * hourStr = [_currTimeStr substringWithRange:hourRange];
    
    NSRange minuteRange = {14, 2};
    NSString * minuteStr = [_currTimeStr substringWithRange:minuteRange];
    
    NSInteger dayString = 0;
    NSInteger hourString = [hourStr integerValue];
    NSInteger minuteString = [minuteStr integerValue] + 10;
    
    if (minuteString >=60) {
        minuteString -= 60;
        hourString += 1;
    }
    if (hourString == 24) {
        dayString = 1;
        hourString = 0;
    }
    NSInteger hour = 0;
    while (hour++ < 24) {
        [hourArray addObject:[NSString stringWithFormat:@"%02ld", (long)hour - 1]];
    }
    NSInteger minutes = 0;
    while (minutes++ < 60) {
        [minuteArray addObject:[NSString stringWithFormat:@"%02ld", (long)minutes - 1]];
    }
    
    _pickerArray = @[dayArray, hourArray, minuteArray];
    _timeModel.oneComponent = @0;
    _timeModel.oneRow = @(dayString);
    _timeModel.twoComponent = @1;
    _timeModel.twoRow = @(hourString);
    _timeModel.threeComponent = @2;
    _timeModel.threeRow = @(minuteString);

    
    NSMutableString * mTime = [NSMutableString string];
    
    [mTime appendString:[NSString stringWithFormat:@"%02ld", (long)hourString]];
    [mTime appendString:@":"];
    [mTime appendString:[NSString stringWithFormat:@"%02ld", (long)minuteString]];
    NSArray * titleArray = @[@"日期", @"时", @"分"];
    CustomPickerView * picekerView = [[CustomPickerView alloc] initWithFrame:CGRectMake(0, SCREEN_HEIGHT, SCREEN_WIDTH, 237) titleArray:titleArray oldModel:_timeModel];
    picekerView.pickerArray = _pickerArray;
    //  选择成功回调
    __weak typeof(self) weakself = self;
    __weak typeof(footerButton) weakSelffooterButton = footerButton;
    __weak typeof(timeLabel) weakSelftimeLabel = timeLabel;
    picekerView.didSelectBlock = ^(PickerModel *model) {
        NSLog(@"model = %@ - %@",model.twoComponent,model.twoRow);
        weakSelftimeLabel.text = nil;
        NSString *timeString = [NSString stringWithFormat:@"%@ %@:%@",_pickerArray[0][model.oneRow.integerValue],_pickerArray[1][model.twoRow.integerValue],_pickerArray[2][model.threeRow.integerValue]];
        weakSelftimeLabel.text = timeString;
        [weakself.activityList setObject:timeString forKey:@"时间"];
        
        if (model.oneRow.integerValue == 0) {
            NSString *s = [_currTimeStr substringToIndex:11];
            NSString *h = _pickerArray[1][model.twoRow.integerValue];
            NSString *m = _pickerArray[2][model.threeRow.integerValue];
            NSString *str = [NSString stringWithFormat:@"%@%@:%@",s,h,m];
            [weakself.dataDict setObject:str forKey:@"expireTime"];
        }else{
            NSString *t = [self GetTomorrowDay:date];
            NSString *h = _pickerArray[1][model.twoRow.integerValue];
            NSString *m = _pickerArray[2][model.threeRow.integerValue];
            NSString *str = [NSString stringWithFormat:@"%@ %@:%@",t,h,m];
            [weakself.dataDict setObject:str forKey:@"expireTime"];
        }
        
        if([NSString stringWithFormat:@"%@",[weakself.activityList objectForKey:@"时间"]].length != 0 && [NSString stringWithFormat:@"%@",[weakself.activityList objectForKey:@"红包"]].length != 0 && [NSString stringWithFormat:@"%@",[weakself.activityList objectForKey:@"备注"]].length != 0 && [NSString stringWithFormat:@"%@",[weakself.activityList objectForKey:@"地点"]].length != 0 && [NSString stringWithFormat:@"%@",[weakself.activityList objectForKey:@"所在地"]].length != 0  && [NSString stringWithFormat:@"%@",[weakself.activityList objectForKey:@"任务说明"]].length != 0 )
        {
            weakSelffooterButton.selected = YES;
            weakSelffooterButton.enabled = YES;
        }
    };
    [UIView animateWithDuration:0.2 animations:^{
        [picekerView show];
    }];
//    [_currTimeStr replaceCharactersInRange:NSMakeRange(11, 5) withString:mTime];
}
//传入今天的时间，返回明天的时间
- (NSString *)GetTomorrowDay:(NSDate *)aDate {
    NSCalendar *gregorian = [[NSCalendar alloc] initWithCalendarIdentifier:NSCalendarIdentifierGregorian];
    NSDateComponents *components = [gregorian components:NSCalendarUnitWeekday | NSCalendarUnitYear | NSCalendarUnitMonth | NSCalendarUnitDay fromDate:aDate];
    [components setDay:([components day]+1)];
    
    NSDate *beginningOfWeek = [gregorian dateFromComponents:components];
    NSDateFormatter *dateday = [[NSDateFormatter alloc] init];
    [dateday setDateFormat:@"yyyy-MM-dd"];
    return [dateday stringFromDate:beginningOfWeek];
}

#pragma mark --- 城市选择 ---
-(void)changeCity
{
    MY_LYLocationViewController * locationVC = [[MY_LYLocationViewController alloc] init];
    locationVC.vcTitle = @"城市";
    locationVC.isHomePage = YES;
    
    __weak typeof(self) wSelf = self;
    
    locationVC.changeLocationBlock = ^(NSString * cityName){
        cityLabel.text = cityName;
        [wSelf.activityList setObject:cityName forKey:@"所在地"];
        if([NSString stringWithFormat:@"%@",[wSelf.activityList objectForKey:@"时间"]].length != 0 && [NSString stringWithFormat:@"%@",[wSelf.activityList objectForKey:@"红包"]].length != 0 && [NSString stringWithFormat:@"%@",[wSelf.activityList objectForKey:@"备注"]].length != 0 && [NSString stringWithFormat:@"%@",[wSelf.activityList objectForKey:@"地点"]].length != 0 && [NSString stringWithFormat:@"%@",[wSelf.activityList objectForKey:@"所在地"]].length != 0 && [NSString stringWithFormat:@"%@",[wSelf.activityList objectForKey:@"任务说明"]].length != 0 )
        {
            footerButton.selected = YES;
            footerButton.enabled = YES;
        }
    };
    [self.navigationController pushViewController:locationVC animated:YES];
}
#pragma mark - 代理用来接收点击的是第几个
-(void)ClickCooRow :(int)CellRow
{
    printf("\n点击的是==========%d\n",CellRow);
}

- (void) swChange:(UISwitch*) sw{

    if(sw.on==YES){
        [self.dataDict setObject:@1 forKey:@"isAnonymously"];
        [self.activityList setObject:@"1" forKey:@"匿名"];
//        NSLog(@"开关被打开");
    }else{
        [self.dataDict setObject:@0 forKey:@"isAnonymously"];
        [self.activityList setObject:@"0" forKey:@"匿名"];
//        NSLog(@"开关被关闭");
    }
}

-(void)tap:(UIButton *) sender
{
    NSInteger tag = sender.tag;
    switch (tag) {
        case 0:{
            if (!sender.isSelected) {
                if (BoyBtn.isSelected) {
                    BoyBtn.selected = NO;
                }else if(AnyBtn.isSelected){
                    AnyBtn.selected = NO;
                }
                sender.selected = YES;
                [self.activityList setObject:[NSString stringWithFormat:@"%ld",sender.tag] forKey:@"性别"];
                [self.dataDict setObject:@(tag) forKey:@"limitSex"];
            }
            break;
        }
        case 1:
        {
            if (!sender.isSelected) {
                if (GirlBtn.isSelected) {
                    GirlBtn.selected = NO;
                }else if(AnyBtn.isSelected){
                    AnyBtn.selected = NO;
                }
                sender.selected = YES;
                [self.activityList setObject:[NSString stringWithFormat:@"%ld",sender.tag] forKey:@"性别"];
                [self.dataDict setObject:@(tag) forKey:@"limitSex"];
            }
            break;
        }
        case 2:
        {
            if (!sender.isSelected) {
                if (BoyBtn.isSelected) {
                    BoyBtn.selected = NO;
                }else if(GirlBtn.isSelected){
                    GirlBtn.selected = NO;
                }
                sender.selected = YES;
                [self.activityList setObject:[NSString stringWithFormat:@"%ld",sender.tag] forKey:@"性别"];
                [self.dataDict setObject:@(tag) forKey:@"limitSex"];
            }
            break;
        }
        default:
            break;
    }
}

-(void)downoraddperson:(UIButton *)sender
{
//        if(sender.tag == 10001)
//        {
//            _personnumber --;
//            personNumtextfield.text = [NSString stringWithFormat:@"%ld",_personnumber];
//            if(_personnumber <= 1)
//            {
//                downBtn.enabled = NO;
//                [downBtn setImage:[UIImage imageNamed:@"minusperson"] forState:UIControlStateNormal];
//                addBtn.enabled = YES;
//                [addBtn setImage:[UIImage imageNamed:@"addperson_selected"] forState:UIControlStateNormal];
//            }
//            else if(_personnumber >1 && _personnumber <=50)
//            {
//                downBtn.enabled = YES;
//                [downBtn setImage:[UIImage imageNamed:@"minusperson_selected"] forState:UIControlStateNormal];
//                addBtn.enabled = YES;
//                [addBtn setImage:[UIImage imageNamed:@"addperson_selected"] forState:UIControlStateNormal];
//            }
//
//        }
//        else
//            if(sender.tag == 10002)
//        {
//            _personnumber ++;
//            personNumtextfield.text = [NSString stringWithFormat:@"%ld",_personnumber];
//            if(_personnumber == 50)
//            {
//                addBtn.enabled = NO;
//                [addBtn setImage:[UIImage imageNamed:@"addperson"] forState:UIControlStateNormal];
//                downBtn.enabled = YES;
//                [downBtn setImage:[UIImage imageNamed:@"minusperson_selected"] forState:UIControlStateNormal];
//            }
//            else if(_personnumber >1 && _personnumber <=50)
//            {
//                addBtn.enabled = YES;
//                [addBtn setImage:[UIImage imageNamed:@"addperson_selected"] forState:UIControlStateNormal];
//                downBtn.enabled = YES;
//                [downBtn setImage:[UIImage imageNamed:@"minusperson_selected"] forState:UIControlStateNormal];
//            }
//        }
    
}
//- (void)textFieldDidEndEditing:(UITextField *)textField
//{
//    if (textField == personNumtextfield) {
//        if (personNumtextfield.text.integerValue <= 0){
//            personNumtextfield.text = [NSString stringWithFormat:@"%d",1];;
//            _personnumber = personNumtextfield.text.integerValue;
//        }
//    }
//}
- (void)textFieldDidChange:(UITextField *)textField {
    if (textField == hongbaoText) {
        if (hongbaoText.text.integerValue >= 10000000){
            hongbaoText.text = [NSString stringWithFormat:@"%d",9999999];
        }
    }
    else
        if(textField == cityText)
    {
        [self.activityList setObject:cityText.text forKey:@"所在地"];
        
        if([NSString stringWithFormat:@"%@",[self.activityList objectForKey:@"时间"]].length != 0 && [NSString stringWithFormat:@"%@",[self.activityList objectForKey:@"红包"]].length != 0 && [NSString stringWithFormat:@"%@",[self.activityList objectForKey:@"备注"]].length != 0 && [NSString stringWithFormat:@"%@",[self.activityList objectForKey:@"地点"]].length != 0 && [NSString stringWithFormat:@"%@",[self.activityList objectForKey:@"所在地"]].length != 0 && [NSString stringWithFormat:@"%@",[self.activityList objectForKey:@"任务说明"]].length != 0  )
        {
            footerButton.selected = YES;
            footerButton.enabled = YES;
        }
    }
    else if(textField == placeText)
    {
        [self.activityList setObject:placeText.text forKey:@"地点"];
        if([NSString stringWithFormat:@"%@",[self.activityList objectForKey:@"时间"]].length != 0 && [NSString stringWithFormat:@"%@",[self.activityList objectForKey:@"红包"]].length != 0 && [NSString stringWithFormat:@"%@",[self.activityList objectForKey:@"备注"]].length != 0 && [NSString stringWithFormat:@"%@",[self.activityList objectForKey:@"地点"]].length != 0 && [NSString stringWithFormat:@"%@",[self.activityList objectForKey:@"所在地"]].length != 0 && [NSString stringWithFormat:@"%@",[self.activityList objectForKey:@"任务说明"]].length != 0  )
        {
            footerButton.selected = YES;
            footerButton.enabled = YES;
        }
        
    }
    else if(textField == BeizhuText)
    {
        [self.activityList setObject:BeizhuText.text forKey:@"备注"];
        if([NSString stringWithFormat:@"%@",[self.activityList objectForKey:@"时间"]].length != 0 && [NSString stringWithFormat:@"%@",[self.activityList objectForKey:@"红包"]].length != 0 && [NSString stringWithFormat:@"%@",[self.activityList objectForKey:@"备注"]].length != 0 && [NSString stringWithFormat:@"%@",[self.activityList objectForKey:@"地点"]].length != 0 && [NSString stringWithFormat:@"%@",[self.activityList objectForKey:@"所在地"]].length != 0 && [NSString stringWithFormat:@"%@",[self.activityList objectForKey:@"任务说明"]].length != 0  )
        {
            footerButton.selected = YES;
            footerButton.enabled = YES;
        }
    }
}
- (void)textFieldDidEndEditing:(UITextField *)textField
{
    if (textField == hongbaoText) {
        if (textField.text.integerValue<100) {
            textField.text = @"100";
            [LQProgressHud showMessage:@"金额不可小于100元"];
        }
    }
    [self.activityList setObject:textField.text forKey:@"红包"];
}

-(void)StartAnActivity
{
    [self postUpData];
//    NSLog(@"%@",self.activityList);
}
#pragma mark ----- 上传数据 -----
- (void)postUpData{
    
    [self.view endEditing:YES];
    //判断空
    NSString *moneyString = self.activityList[@"红包"];
    
//    [self.dataDict setObject:@(0.01) forKey:@"money"];

    [self.dataDict setObject:@(moneyString.integerValue) forKey:@"money"];
    
    if (!self.dataDict[@"expireTime"] || [Utility isBlankString:self.dataDict[@"expireTime"]]) {
        [LQProgressHud showMessage:@"请选择时间"];
        return;
    }
    
    if (![Utility isBlankString:cityLabel.text]) {
        [self.dataDict setObject:cityLabel.text forKey:@"location"];
    }else{
        [LQProgressHud showMessage:@"请填写地点"];
        return;
    }
    if (![Utility isBlankString:_renwuString]) {
        [self.dataDict setObject:_renwuString forKey:@"taskInfo"];
    }else{
        [LQProgressHud showMessage:@"请填写任务说明"];
        return;
    }
    
    if (moneyString.integerValue > _yueMoney) {
        MY_LLPayViewController * payVC = [[MY_LLPayViewController alloc] init];
        payVC.userId = [NSString stringWithFormat:@"%ld",_uModel.userId];
        payVC.price = moneyString;
        payVC.renwuDic = self.dataDict;
        payVC.headIconStr = _uModel.headIcon;
        payVC.nickName = _uModel.nickName;
        payVC.redSingleType = RedPacketRenwu;
//        [payVC setHidesBottomBarWhenPushed:YES];
        [self.navigationController pushViewController:payVC animated:YES];
        return;
    }
    
//    NSLog(@"dict - %@",self.dataDict);
    [LQProgressHud showLoading:nil];
//    __weak typeof(self)WeakSelf = self;
    if (self.dataDict.count > 0) {
        [TLHTTPRequest MY_postWithBaseUrl:TaskPublishURL parameters:self.dataDict success:^(NSURLSessionDataTask * _Nonnull task, NSDictionary * _Nonnull data) {
            if ([[data objectForKey:@"ret"] boolValue] == 0) {
//                NSLog(@"data - %@",data);
                [LQProgressHud hide];
                [self backClick];
                [[NSNotificationCenter defaultCenter] postNotificationName:@"MY_XTActivityViewUpdate" object:nil];
            }
            else{
                
                if ([data objectForKey:@"msg"]) {
                    NSLog(@"data - %@",data[@"msg"]);
//                    UIAlertController * alertC = [UIAlertController alertControllerWithTitle:@"" message:[data objectForKey:@"msg"] preferredStyle:UIAlertControllerStyleAlert];
//                    UIAlertController *cancleAction = [UIAlertAction actionWithTitle:@"确认" style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {
//                        [self backClick];
//                    }];
//                    [alertC addAction:cancleAction];
//                    [self presentViewController:alertC animated:YES completion:nil];
                    [LQProgressHud showMessage:[data objectForKey:@"msg"]];
                }
            }

        } failure:^(NSURLSessionDataTask * _Nonnull task, NSError * _Nonnull error) {
            [LQProgressHud showMessage:@"上传失败"];
        }];
    }
}

- (NSMutableDictionary *)dataDict
{
    if (!_dataDict) {
        _dataDict = [NSMutableDictionary dictionary];
        [_dataDict setObject:@0 forKey:@"limitSex"];
        [_dataDict setObject:@1 forKey:@"limitNum"];
        [_dataDict setObject:@1 forKey:@"isAnonymously"];
        [_dataDict setObject:@0 forKey:@"payMode"];
    }
    return _dataDict;
}

#pragma mark - 内存相关
-(NSArray *)imgList
{
    if(_imgList == nil)
    {
        _imgList = [NSArray array];
    }
    return _imgList;
}

#pragma mark - 内存相关
-(NSArray *)nameList
{
    if(_nameList == nil)
    {
        _nameList = [NSArray array];
    }
    return _nameList;
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
