//
//  MY_TTLSyncSinaViewController.m
//  TogetherLu
//
//  Created by MadridLee on 2017/4/20.
//  Copyright © 2017年 TogetherLu. All rights reserved.
//

#import "MY_TTLApplyImmedViewController.h"
#import "MY_TTLCerTitleTableViewCell.h"
#import "MY_TTLCerTextTableViewCell.h"
#import "MY_TTLCerMetailTableViewCell.h"
#import "SXPickPhoto.h"
@interface MY_TTLApplyImmedViewController ()<UITextFieldDelegate>
{
    NSString* _strExplain;   //说明
    NSMutableArray* _arrImage;   //保存图片的数组
    NSString* _strFid;
}
@property (nonatomic, strong)  SXPickPhoto * pickPhoto;//相册类

@end

@implementation MY_TTLApplyImmedViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.title = @"申请认证";
    
    _arrImage = [[NSMutableArray alloc]init];
    self.pickPhoto = [[SXPickPhoto alloc]init];
    [self createTableView];
    [self createFootView];
    [self uiConfig];
    
//    [self.tableView registerNib:[UINib nibWithNibName:@"MY_TTLCerTitleTableViewCell" bundle:nil] forCellReuseIdentifier:@"MY_TTLCerTitleTableViewCell"];
    [self.tableView registerNib:[UINib nibWithNibName:@"MY_TTLCerTextTableViewCell" bundle:nil] forCellReuseIdentifier:@"MY_TTLCerTextTableViewCell"];
    [self.tableView registerNib:[UINib nibWithNibName:@"MY_TTLCerMetailTableViewCell" bundle:nil] forCellReuseIdentifier:@"MY_TTLCerMetailTableViewCell"];
    self.tableView.backgroundColor = [Utility colorWithHexString:@"f8f8f8" alpha:1];
    if ([self.tableView respondsToSelector:@selector(setSeparatorInset:)]) {
        [self.tableView setSeparatorInset:UIEdgeInsetsMake(0,0,0,0)];
    }
    if ([self.tableView respondsToSelector:@selector(setLayoutMargins:)]) {
        [self.tableView setLayoutMargins:UIEdgeInsetsMake(0,0,0,0)];
    }
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(hideImagePicker) name:@"hideImagePicker" object:nil];
}
//  当实时通话时，关闭UIImagePickerController
- (void)hideImagePicker
{
    if (_pickPhoto.picker && [EaseSDKHelper shareHelper].isShowingimagePicker) {
        [_pickPhoto.picker dismissViewControllerAnimated:NO completion:nil];
    }
}

- (void)dealloc {
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}
-(void)createFootView
{
    UIView* view = [[UIView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 170)];
    
    UILabel* label = [[UILabel alloc]initWithFrame:CGRectMake(10, 10, SCREEN_WIDTH - 20, 12)];
    label.text = @"可以同时认证多个种类，但是需要上传多个材料";
    label.font = [UIFont systemFontOfSize:12];
    label.textColor = [Utility colorWithHexString:@"999999" alpha:1];
    [view addSubview:label];
    
    self.tableView.tableFooterView = view;
    
}

-(void)uiConfig
{
    UIButton* btnSync = [UIButton buttonWithType:UIButtonTypeCustom];
    btnSync.frame = CGRectMake(15, SCREEN_HEIGHT - 65 - StatusHeight - 44, SCREEN_WIDTH - 30, 50);
    [btnSync setTitle:@"提交" forState:UIControlStateNormal];
    btnSync.titleLabel.font = [UIFont systemFontOfSize:18];
    [btnSync setBackgroundColor:GOLDCOLOR];
    [btnSync setTitleColor:[Utility colorWithHexString:@"ffffff" alpha:1] forState:UIControlStateNormal];
    btnSync.layer.cornerRadius = 5;
    btnSync.layer.masksToBounds = YES;
    [self.view addSubview:btnSync];
    [btnSync addTarget:self action:@selector(addClick:) forControlEvents:UIControlEventTouchUpInside];
}
#pragma mark --提交
-(void)addClick:(UIButton *)btn
{
    [self.view endEditing:YES];
    if (_arrImage.count == 0) {
        [LQProgressHud showMessage:@"您还未上传图片"];
        return;
    }
    if ([Utility isBlankString:_strExplain]) {
        [LQProgressHud showMessage:@"您还未填写认证材料"];
        return;
    }
    if (_strExplain.length > 40) {
        [LQProgressHud showMessage:@"认证材料最多输入40个字"];
        return;
    }
    
   
    btn.userInteractionEnabled = NO;
    [MBProgressHUD showHUDAddedTo:self.view animated:YES];
    for (int i = 0; i < _arrImage.count; i++) {
        [TLHTTPRequest MY_postDataAndImageRequest:UploadFileURL parameters:nil imageDataArr:_arrImage[i] success:^(NSURLSessionDataTask * _Nonnull task, NSDictionary * _Nonnull data) {
            
            if ([[data objectForKey:@"ret"] integerValue] == 0) {
                if (i == 0) {
                    if (![Utility isBlankString:_strFid]) {
                        _strFid = @"";
                    }
                    _strFid = [NSString stringWithFormat:@"%@",[[data objectForKey:@"info"] objectForKey:@"fid"]];
                }else{
                    _strFid = [NSString stringWithFormat:@"%@,%@",_strFid,[[data objectForKey:@"info"] objectForKey:@"fid"]];
                }
                NSLog(@"_strFid ===   ======    %@",_strFid);
                if (i == _arrImage.count - 1) {
                    NSMutableDictionary* dict = [[NSMutableDictionary alloc]init];
                    [dict setObject:_strExplain forKey:@"explain"];
                    [dict setObject:_strFid forKey:@"fids"];
                    [TLHTTPRequest MY_postWithBaseUrl:vaddVarifyUrl parameters:dict success:^(NSURLSessionDataTask * _Nonnull task, NSDictionary * _Nonnull data) {
                        btn.userInteractionEnabled = YES;
                        [MBProgressHUD hideHUDForView:self.view animated:YES];
                        if ([[data objectForKey:@"ret"] integerValue] == 0) {
                            [LQProgressHud showMessage:@"上传成功"];
                            [self.navigationController popToRootViewControllerAnimated:YES];
                        }
                        else{
                            if ([data objectForKey:@"msg"]) {
                                [LQProgressHud showMessage:[data objectForKey:@"msg"]];
                            }
                        }
                    } failure:^(NSURLSessionDataTask * _Nonnull task, NSError * _Nonnull error) {
                        [MBProgressHUD hideHUDForView:self.view animated:YES];
                        btn.userInteractionEnabled = YES;
                    }];
                }
            }
            else{
                btn.userInteractionEnabled = YES;
                [MBProgressHUD hideHUDForView:self.view animated:YES];
                if ([data objectForKey:@"msg"]) {
                    [LQProgressHud showMessage:[data objectForKey:@"msg"]];
                }
            }
        } failure:^(NSURLSessionDataTask * _Nonnull task, NSError * _Nonnull error) {
            [MBProgressHUD hideHUDForView:self.view animated:YES];
            [LQProgressHud showMessage:@"请求失败"];
            btn.userInteractionEnabled = YES;
        }];
    }
    
    
}



#pragma mark - tableView代理方法
-(void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if ([cell respondsToSelector:@selector(setSeparatorInset:)]) {
        [cell setSeparatorInset:UIEdgeInsetsZero];
    }
    
    if ([cell respondsToSelector:@selector(setLayoutMargins:)]) {
        [cell setLayoutMargins:UIEdgeInsetsZero];
    }
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    return 1;
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 2;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.section == 0)
    {
        return 110;
    }
    else{
        return 129;
    }
    
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 32;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    if (indexPath.section == 0)
    {
        static NSString * cellId = @"MY_TTLCerTextTableViewCell";
        MY_TTLCerTextTableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:cellId forIndexPath:indexPath];
        cell.speradsBlock = ^(NSString *str){
            _strExplain = str;
        };
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        return cell;
    }
    else{
        static NSString * cellId = @"MY_TTLCerMetailTableViewCell";
        MY_TTLCerMetailTableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:cellId forIndexPath:indexPath];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        cell.btnIcon1.tag = 100;
        cell.btnIcon2.tag = 101;
        cell.btnIcon3.tag = 102;
        cell.btnIcon4.tag = 103;
        [cell.btnIcon1 addTarget:self action:@selector(btnClick1:) forControlEvents:UIControlEventTouchUpInside];
        [cell.btnIcon2 addTarget:self action:@selector(btnClick2:) forControlEvents:UIControlEventTouchUpInside];
        [cell.btnIcon3 addTarget:self action:@selector(btnClick3:) forControlEvents:UIControlEventTouchUpInside];
        [cell.btnIcon4 addTarget:self action:@selector(btnClick4:) forControlEvents:UIControlEventTouchUpInside];
        if (_arrImage.count == 0) {
            cell.btnIcon1.hidden = NO;
            cell.btnIcon2.hidden = YES;
            cell.btnIcon3.hidden = YES;
            cell.btnIcon4.hidden = YES;
            [cell.btnIcon1 setImage:[UIImage imageNamed:@"AlbumAddBtn"] forState:UIControlStateNormal];
            [cell.btnIcon2 setImage:[UIImage imageNamed:@"AlbumAddBtn"] forState:UIControlStateNormal];
            [cell.btnIcon3 setImage:[UIImage imageNamed:@"AlbumAddBtn"] forState:UIControlStateNormal];
            [cell.btnIcon4 setImage:[UIImage imageNamed:@"AlbumAddBtn"] forState:UIControlStateNormal];
        }
        else if (_arrImage.count == 1){
            cell.btnIcon1.hidden = NO;
            cell.btnIcon2.hidden = NO;
            cell.btnIcon3.hidden = YES;
            cell.btnIcon4.hidden = YES;
//            [cell.btnIcon1 sd_setImageWithURL:[NSURL URLWithString:_arrImage[0]] forState:UIControlStateNormal placeholderImage:[UIImage imageNamed:@"AlbumAddBtn"] options:SDWebImageAllowInvalidSSLCertificates];
            [cell.btnIcon1 setImage:[UIImage imageWithData:_arrImage[0][0]] forState:UIControlStateNormal];
            [cell.btnIcon2 setImage:[UIImage imageNamed:@"AlbumAddBtn"] forState:UIControlStateNormal];
            [cell.btnIcon3 setImage:[UIImage imageNamed:@"AlbumAddBtn"] forState:UIControlStateNormal];
            [cell.btnIcon4 setImage:[UIImage imageNamed:@"AlbumAddBtn"] forState:UIControlStateNormal];
        }
        else if (_arrImage.count == 2){
            cell.btnIcon1.hidden = NO;
            cell.btnIcon2.hidden = NO;
            cell.btnIcon3.hidden = NO;
            cell.btnIcon4.hidden = YES;
            [cell.btnIcon1 setImage:[UIImage imageWithData:_arrImage[0][0]] forState:UIControlStateNormal];
            [cell.btnIcon2 setImage:[UIImage imageWithData:_arrImage[1][0]] forState:UIControlStateNormal];
            [cell.btnIcon3 setImage:[UIImage imageNamed:@"AlbumAddBtn"] forState:UIControlStateNormal];
            [cell.btnIcon4 setImage:[UIImage imageNamed:@"AlbumAddBtn"] forState:UIControlStateNormal];
        }
        else if (_arrImage.count == 3){
            cell.btnIcon1.hidden = NO;
            cell.btnIcon2.hidden = NO;
            cell.btnIcon3.hidden = NO;
            cell.btnIcon4.hidden = NO;
            [cell.btnIcon1 setImage:[UIImage imageWithData:_arrImage[0][0]] forState:UIControlStateNormal];
            [cell.btnIcon2 setImage:[UIImage imageWithData:_arrImage[1][0]] forState:UIControlStateNormal];
            [cell.btnIcon3 setImage:[UIImage imageWithData:_arrImage[2][0]] forState:UIControlStateNormal];
            [cell.btnIcon4 setImage:[UIImage imageNamed:@"AlbumAddBtn"] forState:UIControlStateNormal];
        }
        else if (_arrImage.count == 4){
            cell.btnIcon1.hidden = NO;
            cell.btnIcon2.hidden = NO;
            cell.btnIcon3.hidden = NO;
            cell.btnIcon4.hidden = NO;
            [cell.btnIcon1 setImage:[UIImage imageWithData:_arrImage[0][0]] forState:UIControlStateNormal];
            [cell.btnIcon2 setImage:[UIImage imageWithData:_arrImage[1][0]] forState:UIControlStateNormal];
            [cell.btnIcon3 setImage:[UIImage imageWithData:_arrImage[2][0]] forState:UIControlStateNormal];
            [cell.btnIcon4 setImage:[UIImage imageWithData:_arrImage[3][0]] forState:UIControlStateNormal];
        }
        else{
            cell.btnIcon1.hidden = NO;
            cell.btnIcon2.hidden = YES;
            cell.btnIcon3.hidden = YES;
            cell.btnIcon4.hidden = YES;
            [cell.btnIcon1 setImage:[UIImage imageNamed:@"AlbumAddBtn"] forState:UIControlStateNormal];
            [cell.btnIcon2 setImage:[UIImage imageNamed:@"AlbumAddBtn"] forState:UIControlStateNormal];
            [cell.btnIcon3 setImage:[UIImage imageNamed:@"AlbumAddBtn"] forState:UIControlStateNormal];
            [cell.btnIcon4 setImage:[UIImage imageNamed:@"AlbumAddBtn"] forState:UIControlStateNormal];
        }
        return cell;
    }
}
#pragma mark --图片按钮点击事件
-(void)btnClick1:(UIButton  *)btn
{
    if (_arrImage.count == 0) {//数组为0，添加新图片
        [self addImage];
    }
    else{//否则删除数组第一个元素
        [self deleteImage:btn.tag - 100];
    }
}
-(void)btnClick2:(UIButton  *)btn
{
    if (_arrImage.count == 1) {//数组为0，添加新图片
        [self addImage];
    }
    else{//否则删除数组第二个元素
        [self deleteImage:btn.tag - 100];
    }
}
-(void)btnClick3:(UIButton  *)btn
{
    if (_arrImage.count == 2) {//数组为0，添加新图片
        [self addImage];
    }
    else{//否则删除数组第三个元素
        [self deleteImage:btn.tag - 100];
    }
}
-(void)btnClick4:(UIButton  *)btn
{
    if (_arrImage.count == 3) {//数组为0，添加新图片
        [self addImage];
    }
    else{//否则删除数组第四个元素
        [self deleteImage:btn.tag - 100];
    }
}

#pragma mark --删除新图片
-(void)deleteImage:(NSInteger)tag
{
    //    _photos = 10;
    UIAlertAction * act1 = [UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {
    }];
    
    //拍照：
    UIAlertAction * act2 = [UIAlertAction actionWithTitle:@"删除图片" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        [_arrImage removeObjectAtIndex:tag];
        NSIndexSet *indexSet=[[NSIndexSet alloc]initWithIndex:1];
        [self.tableView reloadSections:indexSet withRowAnimation:UITableViewRowAnimationAutomatic];
    }];

    UIAlertController * aleVC = [UIAlertController alertControllerWithTitle:@"提示" message:@"删除图片" preferredStyle:UIAlertControllerStyleActionSheet];
    [aleVC addAction:act1];
    [aleVC addAction:act2];
    [self presentViewController:aleVC animated:YES completion:nil];
}


#pragma mark --添加新图片
-(void)addImage
{
    //    _photos = 10;
    UIAlertAction * act1 = [UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {
    }];
    
    //拍照：
    UIAlertAction * act2 = [UIAlertAction actionWithTitle:@"拍照" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        //打开相机
        _pickPhoto.picker.allowsEditing = NO;
        [_pickPhoto ShowTakePhotoWithController:self withIsEdit:0 andWithBlock:^(NSObject *Data) {
            NSMutableArray* array = [NSMutableArray arrayWithObject:UIImageJPEGRepresentation((UIImage *)Data, 0.7)];
            [self postPhoto:array withInteger:1];
        }];
    }];
    //相册
    UIAlertAction * act3 = [UIAlertAction actionWithTitle:@"相册" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        //打开相册
        _pickPhoto.picker.allowsEditing = NO;
        [_pickPhoto SHowLocalPhotoWithController:self withIsEdit:0 andWithBlock:^(NSObject *Data) {
            NSMutableArray* array = [NSMutableArray arrayWithObject:UIImageJPEGRepresentation((UIImage *)Data, 0.7)];
            [self postPhoto:array withInteger:1];
        }];
        
    }];
    
    UIAlertController * aleVC = [UIAlertController alertControllerWithTitle:@"提示" message:@"选择图片" preferredStyle:UIAlertControllerStyleActionSheet];
    [aleVC addAction:act1];
    [aleVC addAction:act2];
    [aleVC addAction:act3];
    [self presentViewController:aleVC animated:YES completion:nil];
}


-(void)postPhoto:(NSMutableArray *)array withInteger:(NSInteger)indexType;
{
    [_arrImage addObject:array];
    NSIndexSet *indexSet=[[NSIndexSet alloc]initWithIndex:1];
    [self.tableView reloadSections:indexSet withRowAnimation:UITableViewRowAnimationAutomatic];
    
    
    
//    UIButton* btn = [self.view viewWithTag:indexType + 100];
//    btn.userInteractionEnabled = NO;
//    NSMutableDictionary* dictData = [[NSMutableDictionary alloc]init];
//    [dictData setObject:USERKEY forKey:@"key"];
//    __weak typeof (self) weakSelf = self;
//    [TLHTTPRequest MY_postDataAndImageRequest:UploadFlie parameters:dictData imageDataArr:array success:^(NSURLSessionDataTask * _Nonnull task, NSDictionary * _Nonnull data) {
//        btn.userInteractionEnabled = YES;
//        if ([[data objectForKey:@"ret"] boolValue] == 0) {
//            if ([data objectForKey:@"info"]) {
//                NSString* strImg = [[data objectForKey:@"info"] objectForKey:@"furl"];
//                [_arrImage addObject:strImg];
//                NSIndexSet *indexSet=[[NSIndexSet alloc]initWithIndex:1];
//                [weakSelf.tableView reloadSections:indexSet withRowAnimation:UITableViewRowAnimationAutomatic];
//            }
//        }
//        else{
//            if ([data objectForKey:@"msg"]) {
//                [LQProgressHud showMessage:[data objectForKey:@"msg"]];
//            }
//        }
//    } failure:^(NSURLSessionDataTask * _Nonnull task, NSError * _Nonnull error) {
//        NSLog(@"2323232323232");
//        btn.userInteractionEnabled = YES;
//    }];
    
}


- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    
    UIView * headerView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 32)];
    headerView.backgroundColor = [Utility colorWithHexString:@"f8f8f8" alpha:1];
    
    UILabel * headerLabel = [[UILabel alloc] initWithFrame:CGRectMake(10, 0, SCREEN_WIDTH - 20, 32)];
    if (section == 1) {
        headerLabel.text = @"认证说明";
    }
    else{
        headerLabel.text = @"认证材料";
    }
    headerLabel.font = [UIFont systemFontOfSize:12];
    headerLabel.textColor = [Utility colorWithHexString:@"999999" alpha:1];
    [headerView addSubview:headerLabel];
    return headerView;
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
