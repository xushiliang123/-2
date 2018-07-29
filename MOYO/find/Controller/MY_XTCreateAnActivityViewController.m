//
//  MY_XTCreateAnActivityViewController.m
//  VTIME
//
//  Created by tingting on 2017/11/7.
//  Copyright © 2017年 MadridLee. All rights reserved.
//

#import "MY_XTCreateAnActivityViewController.h"
#import "MY_XTSubjectTableViewCell.h"
#import "MY_TTLEditMateritalTableViewCell.h"
#import "MY_LYMessageInfoModel.h"
#import "MY_XTPickTimeView.h"
#import "MY_XTPickRedPackageView.h"

@interface MY_XTCreateAnActivityViewController ()<UITableViewDelegate,UITableViewDataSource,delegateColl,UITextFieldDelegate>
{
    UIButton *BoyBtn;
    UIButton *GirlBtn;
    UIButton *AnyBtn;
    
    UIButton *downBtn;
    UIButton *addBtn;
    UITextField *personNumtextfield;
    
    UILabel *timeLabel;
    UILabel *redpgLabel;
    
    UITextField *cityText;
    
    UITextField *placeText;
    
    UITextField *BeizhuText;
    
    UIButton *StartBtn;
    
    UISwitch * _mySwitch;
    
    MY_XTPickTimeView *picktimeV;
    MY_XTPickRedPackageView *pickpgV;
    
    UIButton *footerButton;
    
}

@property (strong, nonatomic) NSArray *imgList;
@property (strong, nonatomic) NSArray *nameList;
@property (strong, nonatomic) NSArray* arrayTitle;
@property (nonatomic, strong) UIButton *lastSelectedButton;
// 按钮数组
@property (nonatomic, strong) NSMutableArray *btnArray;
@property (nonatomic, assign) NSInteger personnumber;
@property(retain,nonatomic) UISwitch * mySwitch;

@property (nonatomic, strong) NSMutableDictionary *activityList;

@end



@implementation MY_XTCreateAnActivityViewController


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
    self.title = @"类型";
    self.arrayTitle = @[@"",@"性别",@"人数",@"时间",@"城市",@"地点",@"红包",@"匿名",@"备注"];
    _personnumber = 1;
    
    [self.activityList setObject:@"1" forKey:@"类型"];
    [self.activityList setObject:@"0" forKey:@"性别"];
    [self.activityList setObject:@(_personnumber) forKey:@"人数"];
    [self.activityList setObject:@"上海" forKey:@"城市"];
    [self.activityList setObject:@"是" forKey:@"匿名"];
    [self.activityList setObject:@"" forKey:@"红包"];
    [self.activityList setObject:@"" forKey:@"地点"];
    [self.activityList setObject:@"" forKey:@"备注"];
    [self.activityList setObject:@"" forKey:@"时间"];
    [self uiConfig];
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
    self.tableView.backgroundColor = [Utility colorWithHexString:@"f8f8f8" alpha:1];
    self.tableView.scrollEnabled = NO;
    [self.tableView registerNib:[UINib nibWithNibName:@"MY_XTSubjectTableViewCell" bundle:nil] forCellReuseIdentifier:@"MY_XTSubjectTableViewCell"];
    [self.view addSubview:self.tableView];
    
    UIView *view = [[UIView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 50)];
    view.backgroundColor = self.tableView.backgroundColor;
    self.tableView.tableFooterView = view;
    
    footerButton = [UIButton buttonWithType:UIButtonTypeCustom];
    footerButton.frame = CGRectMake(104, 19 * SCREEN_HEIGHT / 667, SCREEN_WIDTH - 208, 41 * SCREEN_HEIGHT / 667);
    footerButton.layer.cornerRadius = 5;
    [footerButton setTitle:@"发起活动" forState:UIControlStateNormal];
    [footerButton setBackgroundColor:[Utility colorWithHexString:@"#DDDDDD" alpha:1.0f]];
    footerButton.enabled = NO;
    [footerButton addTarget:self action:@selector(StartAnActivity) forControlEvents:UIControlEventTouchUpInside];
    [view addSubview:footerButton];
    
    
}



- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    //    return [self.dataArray count];
    return 9;
}
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    if(indexPath.row == 0)
    {
        return 63 * SCREEN_HEIGHT / 667;
    }
    return 50 * SCREEN_HEIGHT / 667;
}



- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    if(indexPath.row == 0)
    {
        static NSString * cellId = @"MY_XTSubjectTableViewCell";
        MY_XTSubjectTableViewCell *cell = [self.tableView dequeueReusableCellWithIdentifier:cellId forIndexPath:indexPath];
        if (!cell)
        {
            cell = [[MY_XTSubjectTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellId];
        }
        //实现代理
        //    cell.subImgArr = self.imgList;
        //    cell.subNameArr = self.nameList;
        [cell.SubjectCollectionView reloadData];
        cell.delegateColl = self;
        
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
        UIImageView *imgV = [[UIImageView alloc]initWithFrame:CGRectMake(SCREEN_WIDTH - 34 * SCREEN_WIDTH / 375 , 15 * SCREEN_HEIGHT / 667, 12 * SCREEN_WIDTH / 375, 20 * SCREEN_HEIGHT / 667)];
        imgV.image = [UIImage imageNamed:@"shuzhe"];
        [cell.contentView addSubview:imgV];

        switch (indexPath.row) {
            case 1:
                GirlBtn = [UIButton buttonWithType:UIButtonTypeCustom];//button的类型
                GirlBtn.frame = CGRectMake(125 * SCREEN_WIDTH/375, 12 * SCREEN_HEIGHT / 667,82 * SCREEN_WIDTH/375, 27 * SCREEN_HEIGHT / 667);
                GirlBtn.backgroundColor = [UIColor clearColor];
                [GirlBtn setImage:[UIImage imageNamed:@"女"] forState:UIControlStateNormal];
                GirlBtn.imageEdgeInsets = UIEdgeInsetsMake(0,0,0,GirlBtn.titleLabel.bounds.size.width);
                [GirlBtn setTitle:@"女 生" forState:UIControlStateNormal];//设置button的title
                GirlBtn.titleLabel.font = [UIFont systemFontOfSize:12 * SCREEN_WIDTH/375];
                GirlBtn.titleLabel.textAlignment = NSTextAlignmentCenter;
                [GirlBtn setTitleColor:[Utility colorWithHexString:@"#909090" alpha:1.0f] forState:UIControlStateNormal];
                [GirlBtn setBackgroundImage:[UIImage imageNamed:@"roundedrectangle_selected"] forState:UIControlStateSelected];
                GirlBtn.titleEdgeInsets = UIEdgeInsetsMake(0, 0, 0, 0);
                [GirlBtn addTarget:self action:@selector(tap:) forControlEvents:UIControlEventTouchUpInside];
                GirlBtn.layer.cornerRadius = 13.5 * SCREEN_HEIGHT / 667;
                GirlBtn.layer.masksToBounds = YES;
                GirlBtn.layer.borderColor = [Utility colorWithHexString:@"#999999" alpha:1.0f].CGColor;
                GirlBtn.layer.borderWidth = 0.5;
                GirlBtn.tag = 0;
                [cell.contentView addSubview:GirlBtn];
                [self.btnArray addObject:GirlBtn];
                
                [GirlBtn setBackgroundImage:[UIImage imageNamed:@"roundedrectangle_selected"] forState:UIControlStateNormal];
                GirlBtn.layer.borderWidth = 0;
                GirlBtn.selected = YES;
                self.lastSelectedButton = GirlBtn;
                
                BoyBtn = [UIButton buttonWithType:UIButtonTypeCustom];//button的类型
                BoyBtn.frame = CGRectMake(217 * SCREEN_WIDTH/375, 12 * SCREEN_HEIGHT / 667,82 * SCREEN_WIDTH/375, 27 * SCREEN_HEIGHT / 667);
                BoyBtn.backgroundColor = [UIColor clearColor];
                [BoyBtn setImage:[UIImage imageNamed:@"男"] forState:UIControlStateNormal];
                BoyBtn.imageEdgeInsets = UIEdgeInsetsMake(0,0,0,BoyBtn.titleLabel.bounds.size.width);
                [BoyBtn setTitle:@"男 生" forState:UIControlStateNormal];//设置button的title
                BoyBtn.titleLabel.font = [UIFont systemFontOfSize:12  * SCREEN_WIDTH/375];
                BoyBtn.titleLabel.textAlignment = NSTextAlignmentCenter;
                [BoyBtn setTitleColor:[Utility colorWithHexString:@"#909090" alpha:1.0f] forState:UIControlStateNormal];
                [BoyBtn setTitleColor:[UIColor grayColor] forState:UIControlStateHighlighted];
                [BoyBtn setBackgroundImage:[UIImage imageNamed:@"roundedrectangle_selected"] forState:UIControlStateSelected];
                BoyBtn.titleEdgeInsets = UIEdgeInsetsMake(0, 0, 0, 0);
                [BoyBtn addTarget:self action:@selector(tap:) forControlEvents:UIControlEventTouchUpInside];
                BoyBtn.layer.cornerRadius = 13.5 * SCREEN_HEIGHT / 667;
                BoyBtn.layer.masksToBounds = YES;
                BoyBtn.layer.borderColor = [Utility colorWithHexString:@"#999999" alpha:1.0f].CGColor;
                BoyBtn.layer.borderWidth = 0.5;
                BoyBtn.tag = 1;
                [cell.contentView addSubview:BoyBtn];
                [self.btnArray addObject:BoyBtn];
                
                AnyBtn = [UIButton buttonWithType:UIButtonTypeCustom];//button的类型
                AnyBtn.frame = CGRectMake(309 * SCREEN_WIDTH/375, 12 * SCREEN_HEIGHT / 667,44 * SCREEN_WIDTH/375, 27 * SCREEN_HEIGHT / 667);
                AnyBtn.backgroundColor = [UIColor clearColor];
                [AnyBtn setTitle:@"不限" forState:UIControlStateNormal];//设置button的title
                AnyBtn.titleLabel.font = [UIFont systemFontOfSize:12 * SCREEN_WIDTH/375];
                AnyBtn.titleLabel.textAlignment = NSTextAlignmentCenter;
                [AnyBtn setTitleColor:[Utility colorWithHexString:@"#909090" alpha:1.0f] forState:UIControlStateNormal];
                [AnyBtn setBackgroundImage:[UIImage imageNamed:@"roundedrectangle_selected"] forState:UIControlStateSelected];
                [AnyBtn addTarget:self action:@selector(tap:) forControlEvents:UIControlEventTouchUpInside];
                AnyBtn.layer.cornerRadius = 13.5 * SCREEN_HEIGHT / 667;
                AnyBtn.layer.masksToBounds = YES;
                AnyBtn.layer.borderColor = [Utility colorWithHexString:@"#999999" alpha:1.0f].CGColor;
                AnyBtn.layer.borderWidth = 0.5;
                AnyBtn.tag = 2;
                [cell.contentView addSubview:AnyBtn];
                [self.btnArray addObject:AnyBtn];
                
                
                [imgV setHidden:YES];
                
                break;
                
            case 2:
                downBtn = [UIButton buttonWithType:UIButtonTypeCustom];//button的类型
                downBtn.frame = CGRectMake(SCREEN_WIDTH - 107 * SCREEN_WIDTH/375, 16 * SCREEN_HEIGHT / 667,18 * SCREEN_WIDTH/375, 18 * SCREEN_HEIGHT / 667);
                [downBtn setImage:[UIImage imageNamed:@"minusperson"] forState:UIControlStateNormal];
                [downBtn addTarget:self action:@selector(downoraddperson:) forControlEvents:UIControlEventTouchUpInside];
                downBtn.tag = 10001;
                downBtn.enabled = NO;
                [cell.contentView addSubview:downBtn];
                
                personNumtextfield = [[UITextField alloc]initWithFrame:CGRectMake(SCREEN_WIDTH - 83 * SCREEN_WIDTH/375, 16 * SCREEN_HEIGHT / 667, 36 * SCREEN_WIDTH/375, 18 * SCREEN_HEIGHT / 667)];
                personNumtextfield.layer.borderWidth = 1.0f;
                personNumtextfield.layer.borderColor = [Utility colorWithHexString:@"#AAAAAA" alpha:1.0f].CGColor;
                personNumtextfield.backgroundColor = [Utility colorWithHexString:@"#EEEEEE" alpha:1.0f];
                personNumtextfield.textColor = [Utility colorWithHexString:@"#909090" alpha:1.0f];
                personNumtextfield.font = [UIFont systemFontOfSize:14 * SCREEN_WIDTH/375];
                personNumtextfield.textAlignment = NSTextAlignmentCenter;
                personNumtextfield.text = [NSString stringWithFormat:@"%ld",_personnumber];
                personNumtextfield.delegate = self;
                personNumtextfield.keyboardType = UIKeyboardTypeNumberPad;
                [personNumtextfield addTarget:self action:@selector(textFieldDidChange:) forControlEvents:UIControlEventEditingChanged];

                [cell.contentView addSubview:personNumtextfield];
             
                addBtn = [UIButton buttonWithType:UIButtonTypeCustom];//button的类型
                addBtn.frame = CGRectMake(SCREEN_WIDTH - 42 * SCREEN_WIDTH/375, 16* SCREEN_HEIGHT / 667,18 * SCREEN_WIDTH/375, 18* SCREEN_HEIGHT / 667);
                [addBtn setImage:[UIImage imageNamed:@"addperson_selected"] forState:UIControlStateNormal];
                [addBtn addTarget:self action:@selector(downoraddperson:) forControlEvents:UIControlEventTouchUpInside];
                addBtn.tag = 10002;
                addBtn.enabled = YES;
                [cell.contentView addSubview:addBtn];
                
                
                [imgV setHidden:YES];
                
                break;
                
            case 3:
                
                timeLabel = [[UILabel alloc]initWithFrame:CGRectMake(SCREEN_WIDTH - 172* SCREEN_WIDTH/375, 18* SCREEN_HEIGHT / 667, 130* SCREEN_WIDTH/375, 14* SCREEN_HEIGHT / 667)];
                timeLabel.font = [UIFont systemFontOfSize:14* SCREEN_HEIGHT / 667];
                timeLabel.textColor = [Utility colorWithHexString:@"#909090" alpha:1.0f];
                timeLabel.textAlignment = NSTextAlignmentRight;
                [cell.contentView addSubview:timeLabel];
                
                
                [imgV setHidden:NO];
//                cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
                break;
                
            case 4:
                
                cityText = [[UITextField alloc]initWithFrame:CGRectMake(SCREEN_WIDTH - 100* SCREEN_WIDTH/375, 18* SCREEN_HEIGHT / 667, 77* SCREEN_WIDTH/375, 14* SCREEN_HEIGHT / 667)];
                cityText.text = @"上海";
                cityText.font = [UIFont systemFontOfSize:14* SCREEN_HEIGHT / 667];
                cityText.textColor = [Utility colorWithHexString:@"#999999" alpha:1.0f];
                cityText.textAlignment = NSTextAlignmentRight;
                cityText.tag = 2000001;
                [cityText addTarget:self action:@selector(textFieldDidChange:) forControlEvents:UIControlEventEditingChanged];
                [cell.contentView addSubview:cityText];
                [imgV setHidden:YES];
                break;
            
            case 5:
                
                placeText = [[UITextField alloc]initWithFrame:CGRectMake(SCREEN_WIDTH - 200* SCREEN_WIDTH/375, 18* SCREEN_HEIGHT / 667, 177* SCREEN_WIDTH/375, 14* SCREEN_HEIGHT / 667)];
                placeText.placeholder = @"填写一下活动的地址吧~";
                placeText.font = [UIFont systemFontOfSize:14* SCREEN_HEIGHT / 667];
                placeText.textColor = [Utility colorWithHexString:@"#909090" alpha:1.0f];
                placeText.textAlignment = NSTextAlignmentRight;
                placeText.tag = 2000002;
                 [placeText addTarget:self action:@selector(textFieldDidChange:) forControlEvents:UIControlEventEditingChanged];
                [cell.contentView addSubview:placeText];
               [imgV setHidden:YES];
                break;
                
            case 6:
                
                
                redpgLabel = [[UILabel alloc]initWithFrame:CGRectMake(SCREEN_WIDTH - 172* SCREEN_WIDTH/375, 18* SCREEN_HEIGHT / 667, 130* SCREEN_WIDTH/375, 14* SCREEN_HEIGHT / 667)];
                redpgLabel.font = [UIFont systemFontOfSize:14* SCREEN_HEIGHT / 667];
                redpgLabel.textColor = [Utility colorWithHexString:@"#909090" alpha:1.0f];
                redpgLabel.textAlignment = NSTextAlignmentRight;
                [cell.contentView addSubview:redpgLabel];
                
                [imgV setHidden:NO];
//                cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
                
                break;
                
            case 7:
                
                _mySwitch = [[UISwitch alloc]init];
                _mySwitch.frame=CGRectMake(SCREEN_WIDTH - 81* SCREEN_WIDTH/375 , 11* SCREEN_HEIGHT / 667, 58* SCREEN_WIDTH/375, 25* SCREEN_HEIGHT / 667);
                _mySwitch.on=YES;
                [cell.contentView addSubview:_mySwitch];
                [_mySwitch setOnTintColor:[Utility colorWithHexString:@"#FFD632" alpha:1.0f]];
                [_mySwitch setThumbTintColor:[UIColor whiteColor]];
                _mySwitch.backgroundColor = [Utility colorWithHexString:@"#EEEEEE" alpha:1.0f];
                _mySwitch.layer.cornerRadius = 12.5* SCREEN_HEIGHT / 667;
                _mySwitch.layer.masksToBounds = true;
                [_mySwitch setTintColor:[Utility colorWithHexString:@"#EEEEEE" alpha:1.0f]];
                [_mySwitch addTarget:self action:@selector(swChange:) forControlEvents:UIControlEventValueChanged];
                [imgV setHidden:YES];
                
                break;
                
            case 8:
                
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
    __weak typeof(self) weakself = self;
     __weak typeof(footerButton) weakSelffooterButton = footerButton;
    if(indexPath.row == 3)
    {
        picktimeV = [[MY_XTPickTimeView alloc]init];
        [picktimeV showInView:self.tableView];
        
        __weak typeof(timeLabel) weakSelftimeLabel = timeLabel;
        __weak typeof(picktimeV) weakSelfpicktimeV = picktimeV;
        picktimeV.returnValueBlock = ^(NSDictionary *dic) {
            weakSelftimeLabel.text = [NSString stringWithFormat:@"%@ %@",dic[@"日期"],dic[@"时间"]];
            [weakself.activityList setObject:weakSelftimeLabel.text forKey:@"时间"];
            [weakSelfpicktimeV disMissView];
            
            if([NSString stringWithFormat:@"%@",[weakself.activityList objectForKey:@"时间"]].length != 0 && [NSString stringWithFormat:@"%@",[weakself.activityList objectForKey:@"红包"]].length != 0 && [NSString stringWithFormat:@"%@",[weakself.activityList objectForKey:@"备注"]].length != 0 && [NSString stringWithFormat:@"%@",[weakself.activityList objectForKey:@"地点"]].length != 0 && [NSString stringWithFormat:@"%@",[weakself.activityList objectForKey:@"城市"]].length != 0  )
            {
                [weakSelffooterButton setBackgroundColor:[Utility colorWithHexString:@"#FFD632" alpha:1.0f]];
                weakSelffooterButton.enabled = YES;
            }
            
            
        };
    }
    else if(indexPath.row == 6)
    {
        pickpgV = [[MY_XTPickRedPackageView alloc]init];
        pickpgV.number = personNumtextfield.text.intValue;
        [pickpgV showInView:self.tableView];
        __weak typeof(redpgLabel) weakSelfredpgLabel = redpgLabel;
        __weak typeof(pickpgV) weakSelfpickpgV = pickpgV;
        pickpgV.returnRedPBlock = ^(NSDictionary *dic) {
//            NSLog(@"%@",dic);
            [weakSelfpickpgV disMissView];
            weakSelfredpgLabel.text = [NSString stringWithFormat:@"%@",dic[@"type"]];
            [weakself.activityList setObject:dic forKey:@"红包"];
            
            
            if([NSString stringWithFormat:@"%@",[weakself.activityList objectForKey:@"时间"]].length != 0 && [NSString stringWithFormat:@"%@",[weakself.activityList objectForKey:@"红包"]].length != 0 && [NSString stringWithFormat:@"%@",[weakself.activityList objectForKey:@"备注"]].length != 0 && [NSString stringWithFormat:@"%@",[weakself.activityList objectForKey:@"地点"]].length != 0 && [NSString stringWithFormat:@"%@",[weakself.activityList objectForKey:@"城市"]].length != 0  )
            {
                [weakSelffooterButton setBackgroundColor:[Utility colorWithHexString:@"#FFD632" alpha:1.0f]];
                weakSelffooterButton.enabled = YES;
            }
            
            

        };
    }
}

-(void)gettime
{
    
}

#pragma mark - 代理用来接收点击的是第几个
-(void)ClickCooRow :(int)CellRow
{
    printf("\n点击的是==========%d\n",CellRow);
}

- (void) swChange:(UISwitch*) sw{
    
    if(sw.on==YES){
//        NSLog(@"开关被打开");
    }else{
//        NSLog(@"开关被关闭");
    }
}

-(void)tap:(UIButton *) sender
{
//    NSLog(@"\n点击的是==========%d\n",sender.tag);
//    self.lastSelectedButton = sender;
//
//    sender.selected = !sender.selected;
//
//    for (NSInteger j = 0; j < [self.btnArray count]; j++) {
//        UIButton *btn = self.btnArray[j] ;
//        if (sender.tag == j) {
//            btn.selected = sender.selected;
//        } else {
//            btn.selected = NO;
//        }
//        [btn setBackgroundImage:[UIImage imageNamed:@""] forState:UIControlStateNormal];
//        btn.layer.borderWidth = 0.5 ;
//    }
//
//    UIButton *btn = self.btnArray[sender.tag];
//    if (btn.selected) {
//        [btn setBackgroundImage:[UIImage imageNamed:@"roundedrectangle_selected"] forState:UIControlStateNormal];
//        btn.layer.borderWidth = 0;
//    } else {
//        [btn setBackgroundImage:[UIImage imageNamed:@""] forState:UIControlStateNormal];
//        btn.layer.borderWidth = 0.5;
//    }
    if (!sender.isSelected) {
        self.lastSelectedButton.selected = !self.lastSelectedButton.selected;
        [self.lastSelectedButton setBackgroundImage:[UIImage imageNamed:@""] forState:UIControlStateNormal];
        self.lastSelectedButton.layer.borderWidth = 0.5;
        sender.selected = !sender.selected;
        [sender setBackgroundImage:[UIImage imageNamed:@"roundedrectangle_selected"] forState:UIControlStateNormal];
        sender.layer.borderWidth = 0;
        self.lastSelectedButton = sender;
    }
}

-(void)downoraddperson:(UIButton *)sender
{
        if(sender.tag == 10001)
        {
            _personnumber --;
            personNumtextfield.text = [NSString stringWithFormat:@"%ld",_personnumber];
            if(_personnumber <= 1)
            {
                downBtn.enabled = NO;
                [downBtn setImage:[UIImage imageNamed:@"minusperson"] forState:UIControlStateNormal];
                addBtn.enabled = YES;
                [addBtn setImage:[UIImage imageNamed:@"addperson_selected"] forState:UIControlStateNormal];
            }
            else if(_personnumber >1 && _personnumber <=50)
            {
                downBtn.enabled = YES;
                [downBtn setImage:[UIImage imageNamed:@"minusperson_selected"] forState:UIControlStateNormal];
                addBtn.enabled = YES;
                [addBtn setImage:[UIImage imageNamed:@"addperson_selected"] forState:UIControlStateNormal];
            }
            
        }
        else if(sender.tag == 10002)
        {
            _personnumber ++;
            personNumtextfield.text = [NSString stringWithFormat:@"%ld",_personnumber];
            if(_personnumber == 50)
            {
                addBtn.enabled = NO;
                [addBtn setImage:[UIImage imageNamed:@"addperson"] forState:UIControlStateNormal];
                downBtn.enabled = YES;
                [downBtn setImage:[UIImage imageNamed:@"minusperson_selected"] forState:UIControlStateNormal];
            }
            else if(_personnumber >1 && _personnumber <=50)
            {
                addBtn.enabled = YES;
                [addBtn setImage:[UIImage imageNamed:@"addperson_selected"] forState:UIControlStateNormal];
                downBtn.enabled = YES;
                [downBtn setImage:[UIImage imageNamed:@"minusperson_selected"] forState:UIControlStateNormal];
            }
        }
    
}

- (void)textFieldDidChange:(UITextField *)textField {
    if (textField == personNumtextfield) {
        if (personNumtextfield.text.integerValue < 50 && personNumtextfield.text.integerValue > 1) {
            _personnumber = personNumtextfield.text.integerValue;
            addBtn.enabled = YES;
            downBtn.enabled = YES;
            [addBtn setImage:[UIImage imageNamed:@"addperson_selected"] forState:UIControlStateNormal];
            [downBtn setImage:[UIImage imageNamed:@"minusperson_selected"] forState:UIControlStateNormal];
        } else  if (personNumtextfield.text.integerValue >= 50){
            personNumtextfield.text = [NSString stringWithFormat:@"%d",50];
            _personnumber = personNumtextfield.text.integerValue;
            [addBtn setImage:[UIImage imageNamed:@"addperson"] forState:UIControlStateNormal];
            addBtn.enabled = NO;
            downBtn.enabled = YES;
            [downBtn setImage:[UIImage imageNamed:@"minusperson_selected"] forState:UIControlStateNormal];
        }else if (personNumtextfield.text.integerValue <= 1)
        {
            personNumtextfield.text = [NSString stringWithFormat:@"%d",1];;
            _personnumber = personNumtextfield.text.integerValue;
            [addBtn setImage:[UIImage imageNamed:@"addperson_selected"] forState:UIControlStateNormal];
            addBtn.enabled = YES;
            downBtn.enabled = NO;
            [downBtn setImage:[UIImage imageNamed:@"minusperson"] forState:UIControlStateNormal];
        }
    }
    else if(textField == cityText)
    {
        [self.activityList setObject:cityText.text forKey:@"城市"];
        if([NSString stringWithFormat:@"%@",[self.activityList objectForKey:@"时间"]].length != 0 && [NSString stringWithFormat:@"%@",[self.activityList objectForKey:@"红包"]].length != 0 && [NSString stringWithFormat:@"%@",[self.activityList objectForKey:@"备注"]].length != 0 && [NSString stringWithFormat:@"%@",[self.activityList objectForKey:@"地点"]].length != 0 && [NSString stringWithFormat:@"%@",[self.activityList objectForKey:@"城市"]].length != 0  )
        {
            [footerButton setBackgroundColor:[Utility colorWithHexString:@"#FFD632" alpha:1.0f]];
            footerButton.enabled = YES;
        }
    }
    else if(textField == placeText)
    {
        [self.activityList setObject:placeText.text forKey:@"地点"];
        if([NSString stringWithFormat:@"%@",[self.activityList objectForKey:@"时间"]].length != 0 && [NSString stringWithFormat:@"%@",[self.activityList objectForKey:@"红包"]].length != 0 && [NSString stringWithFormat:@"%@",[self.activityList objectForKey:@"备注"]].length != 0 && [NSString stringWithFormat:@"%@",[self.activityList objectForKey:@"地点"]].length != 0 && [NSString stringWithFormat:@"%@",[self.activityList objectForKey:@"城市"]].length != 0  )
        {
            [footerButton setBackgroundColor:[Utility colorWithHexString:@"#FFD632" alpha:1.0f]];
            footerButton.enabled = YES;
        }
        
    }
    else if(textField == BeizhuText)
    {
        [self.activityList setObject:BeizhuText.text forKey:@"备注"];
        if([NSString stringWithFormat:@"%@",[self.activityList objectForKey:@"时间"]].length != 0 && [NSString stringWithFormat:@"%@",[self.activityList objectForKey:@"红包"]].length != 0 && [NSString stringWithFormat:@"%@",[self.activityList objectForKey:@"备注"]].length != 0 && [NSString stringWithFormat:@"%@",[self.activityList objectForKey:@"地点"]].length != 0 && [NSString stringWithFormat:@"%@",[self.activityList objectForKey:@"城市"]].length != 0  )
        {
            [footerButton setBackgroundColor:[Utility colorWithHexString:@"#FFD632" alpha:1.0f]];
            footerButton.enabled = YES;
        }
    }
}

-(void)StartAnActivity
{
//    NSLog(@"%@",self.activityList);
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
