//
//  MY_GLWorldTVViewController.m
//  VTIME
//
//  Created by gll on 2017/10/13.
//  Copyright © 2017年 MadridLee. All rights reserved.
//

#import "MY_GLWorldTVViewController.h"
#import "MY_GLRedPacketView.h"
#import "MY_GLBaPingView.h"
#import "MY_GLBaPingExampleView.h"
#import "MY_TTLClubRedPackListViewController.h"

@interface MY_GLWorldTVViewController ()
{
    MY_GLBaPingView *_PopView;
    MY_GLBaPingExampleView *_PopView2;
}
@property (nonatomic, strong)UIButton * BaPingBtn;
@property (nonatomic, strong)UIButton * HongBaoBtn;
@property (strong, nonatomic) SXPickPhoto* pickPhoto;//相册类
@end

@implementation MY_GLWorldTVViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Do any additional setup after loading the view.
    
    [self.view addSubview:self.HongBaoBtn];
    self.HongBaoBtn.frame = CGRectMake(SCREEN_WIDTH - 12 - 51, SCREEN_HEIGHT - 49 - 20 - 51 - 49 , 51, 51);
    
    [self.view addSubview:self.BaPingBtn];
    self.BaPingBtn.frame = CGRectMake(SCREEN_WIDTH - 12 - 51, SCREEN_HEIGHT - 49 - 40 - 102 - 49 , 51, 51);
    
//    self.parentViewController.view.frame = CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT + 49);

}

///////////////////////////// /////////////////// /////////////////// /////////////////// /////////   以下 发红包


- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
	self.controllerView.tabBarController.tabBar.hidden = YES;
    
    
    [[NSNotificationCenter defaultCenter] postNotificationName:@"addheight" object:self userInfo:@{@"height":@(SCREEN_HEIGHT)}];
	[self.view setFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT)];

    UIButton * button = [UIButton buttonWithType:UIButtonTypeCustom];
    button.frame = CGRectMake(22, 80, 80, 80);
    [button setTitle:@"红包" forState:(UIControlStateNormal)];
    button.titleLabel.font = [UIFont systemFontOfSize:12];
    [button setTitleColor: [Utility colorWithHexString:@"3c3c3c" alpha:1.0] forState:(UIControlStateNormal)];
    button.imageEdgeInsets = UIEdgeInsetsMake(1, 0, 1,0);
    button.titleEdgeInsets = UIEdgeInsetsMake(0, 4, 0, 0);
    [button addTarget:self action:@selector(goToRechargeButtonClickMethod:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button];
    
//    MY_TTLClubRedPackListViewController
    
    UIButton * redInfoButton = [UIButton buttonWithType:UIButtonTypeCustom];
    redInfoButton.frame = CGRectMake(22, 180, 80, 80);
    [redInfoButton setTitle:@"红包详情" forState:(UIControlStateNormal)];
    redInfoButton.titleLabel.font = [UIFont systemFontOfSize:12];
    [redInfoButton setTitleColor: [Utility colorWithHexString:@"3c3c3c" alpha:1.0] forState:(UIControlStateNormal)];
    redInfoButton.imageEdgeInsets = UIEdgeInsetsMake(1, 0, 1,0);
    redInfoButton.titleEdgeInsets = UIEdgeInsetsMake(0, 4, 0, 0);
    [redInfoButton addTarget:self action:@selector(goToRedInfoClickMethod:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:redInfoButton];
}

-(void)goToRechargeButtonClickMethod:(UIButton*)sender{
    
    
    MY_GLRedPacketView * redView = [[MY_GLRedPacketView alloc]initWithFrame:self.view.frame];
    redView.backClickMethod = ^(MY_GLRedPacketView *redPacketView, BOOL isGoToCharge) {
      
        if (isGoToCharge) {
            
        }else{
            
            [UIView animateWithDuration:0.2 animations:^{
                
                CGRect rect = redPacketView.frame;
                rect.origin.y = SCREEN_HEIGHT;
                redPacketView.frame = rect;
                
            } completion:^(BOOL finished) {
                
                [redPacketView removeFromSuperview];
            }];
        }
    };
    
    [self.view addSubview:redView];
    
}

-(void)goToRedInfoClickMethod:(UIButton*)sender{

    MY_TTLClubRedPackListViewController * clubVc = [[MY_TTLClubRedPackListViewController alloc]init];
    [self.controllerView.navigationController pushViewController:clubVc animated:YES];
}

///////////////////////////// /////////////////// /////////////////// /////////////////// /////////   以下 霸屏

#pragma mark ## 红包按钮加载
- (UIButton *)HongBaoBtn {
    if (!_HongBaoBtn) {
        
        _HongBaoBtn = [UIButton buttonWithType:(UIButtonTypeCustom)];
        
        [_HongBaoBtn setImage:[UIImage imageNamed:@"home_addStatus"] forState:UIControlStateNormal];
        
        [_HongBaoBtn addTarget:self action:@selector(addHongbaoBtnButtonClick:) forControlEvents:UIControlEventTouchUpInside];
        
    }
    return _HongBaoBtn;
}

#pragma mark ## 霸屏按钮加载
- (UIButton *)BaPingBtn {
    if (!_BaPingBtn) {
        
        _BaPingBtn = [UIButton buttonWithType:(UIButtonTypeCustom)];
        
        [_BaPingBtn setImage:[UIImage imageNamed:@"home_addStatus"] forState:UIControlStateNormal];
        
        [_BaPingBtn addTarget:self action:@selector(BPBtnButtonClick:) forControlEvents:UIControlEventTouchUpInside];
        
    }
    return _BaPingBtn;
}

- (void)BPBtnButtonClick:(id)sender
{
    
    _PopView = [[MY_GLBaPingView alloc]init];
    [_PopView showInView:self.view];
    
    __weak typeof(self) weakSelf = self;
    __weak typeof(_PopView) __PopView = _PopView;
    
    [_PopView addButtonAction:^(id sender) {
        [weakSelf usePhonePhotoAndCamera];
    }];
    [_PopView addButtonAction1:^(id sender) {
        
        [__PopView disMissView];
        
        [weakSelf addBaP];
        
    }];
    
}

-(void)addBaP
{
    _PopView2 = [[MY_GLBaPingExampleView alloc]init];
    [_PopView2 showInView:self.view];
}

- (void)addHongbaoBtnButtonClick:(id)sender
{
    
}

#pragma mark - 调用手机相机和相册
- (void)usePhonePhotoAndCamera {
    //    _photos = 10;
    UIAlertAction * act1 = [UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {
        //        _photos = 1;
    }];
    
    //拍照：
    UIAlertAction * act2 = [UIAlertAction actionWithTitle:@"拍照" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        //打开相机
        _pickPhoto.picker.allowsEditing = YES;
        [_pickPhoto ShowTakePhotoWithController:self withIsEdit:1 andWithBlock:^(NSObject *Data) {
            //            if (_arrayPage.count != 0) {
            //                [_arrayPage removeAllObjects];
            //            }
            //            _arrayPage = [NSMutableArray arrayWithObject:UIImageJPEGRepresentation((UIImage *)Data, 0.7)];
            //            [_btnImage setBackgroundImage:[UIImage imageWithData:_arrayPage[0]] forState:UIControlStateNormal];
            
            //            [self imageArray:_arrayPage withIsViedo:0];
            //            [self imageArray:_arrayPage];
            //            NSIndexPath *indexPath=[NSIndexPath indexPathForRow:0 inSection:0];
            //            [self.myTableView reloadRowsAtIndexPaths:[NSArray arrayWithObjects:indexPath,nil] withRowAnimation:UITableViewRowAnimationNone];
        }];
    }];
    //相册
    UIAlertAction * act3 = [UIAlertAction actionWithTitle:@"相册" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        //打开相册
        _pickPhoto.picker.allowsEditing = YES;
        [_pickPhoto SHowLocalPhotoWithController:self withIsEdit:1 andWithBlock:^(NSObject *Data) {
            //            if (_arrayPage.count != 0) {
            //                [_arrayPage removeAllObjects];
            //            }
            //            _arrayPage = [NSMutableArray arrayWithObject:UIImageJPEGRepresentation((UIImage *)Data, 0.7)];
            //            [_btnImage setBackgroundImage:[UIImage imageWithData:_arrayPage[0]] forState:UIControlStateNormal];
            
            //            [self imageArray:_arrayPage withIsViedo:0];
            //            [self imageArray:_arrayPage];
            //
            //
            //            NSIndexPath *indexPath=[NSIndexPath indexPathForRow:0 inSection:0];
            //            [self.myTableView reloadRowsAtIndexPaths:[NSArray arrayWithObjects:indexPath,nil] withRowAnimation:UITableViewRowAnimationNone];
        }];
        
    }];
    
    UIAlertController * aleVC = [UIAlertController alertControllerWithTitle:@"提示" message:@"选择图片" preferredStyle:UIAlertControllerStyleActionSheet];
    [aleVC addAction:act1];
    [aleVC addAction:act2];
    [aleVC addAction:act3];
    [self presentViewController:aleVC animated:YES completion:nil];
}





- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
    
    self.controllerView.tabBarController.tabBar.hidden = NO;

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
