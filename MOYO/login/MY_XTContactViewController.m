//
//  MY_XTContactViewController.m
//  VTIME
//
//  Created by tingting on 2017/10/30.
//  Copyright © 2017年 MadridLee. All rights reserved.
//

#import "MY_XTContactViewController.h"
#import "MY_XTCopyLabel.h"

@interface MY_XTContactViewController ()
@property (nonatomic, strong) UIAlertView * myAlertView;
@property (nonatomic, strong) UIAlertView * myAlertView2;

@end

@implementation MY_XTContactViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.title = @"联系客服";
    self.view.backgroundColor = [Utility colorWithHexString:@"#EFEFEF" alpha:1.0f];
    
    UIView *backgroundVforL = [[UIView alloc]initWithFrame:CGRectMake(0, 1, SCREEN_WIDTH, 50)];
    backgroundVforL.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:backgroundVforL];
    
    UILabel *contactL = [[UILabel alloc]init];
    contactL.textColor = [Utility colorWithHexString:@"#3C3C3C" alpha:1.0f];
    contactL.backgroundColor = [UIColor clearColor];
    contactL.font = [UIFont systemFontOfSize:16];
    contactL.textAlignment = NSTextAlignmentLeft;
    contactL.text = @"联系客服";
    [backgroundVforL addSubview:contactL];
    
    [contactL mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(backgroundVforL).with.insets(UIEdgeInsetsMake(17, 17, 17, 17));
    }];
    
    MY_XTCopyLabel *contactLabel = [[MY_XTCopyLabel alloc]init];
    contactLabel.textColor = [Utility colorWithHexString:@"#3C3C3C" alpha:1.0f];
    contactLabel.backgroundColor = [UIColor clearColor];
    contactLabel.font = [UIFont systemFontOfSize:16];
    contactLabel.textAlignment = NSTextAlignmentLeft;
    contactLabel.text = @"客服微信号：vshidai2017";
    [self.view addSubview:contactLabel];
    [contactLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.top.equalTo(backgroundVforL.mas_bottom).mas_offset(17);
        make.left.equalTo(self.view.mas_left).mas_offset(16);
        make.right.equalTo(self.view.mas_right).mas_offset(-168);
        make.height.mas_equalTo(16);
    }];
    
    UIImageView *contactEWM = [[UIImageView alloc]init];
    contactEWM.image = [UIImage imageNamed:@"erweima"];
    [self.view addSubview:contactEWM];
    [contactEWM mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.top.equalTo(contactLabel.mas_bottom).mas_offset(17);
        make.left.equalTo(self.view.mas_left).mas_offset((SCREEN_WIDTH-115)/2);
        make.right.equalTo(self.view.mas_right).mas_offset(-(SCREEN_WIDTH-115)/2);
        make.height.mas_equalTo(115);
    }];
    
    
    UILongPressGestureRecognizer *longTap = [[UILongPressGestureRecognizer alloc] initWithTarget:self action:@selector(longTapClick:)];
    
    contactEWM.userInteractionEnabled = YES;
    
    [contactEWM addGestureRecognizer:longTap];
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)longTapClick:(UILongPressGestureRecognizer *)longPress{
    // 手势的状态
    if (longPress.state == UIGestureRecognizerStateBegan) {
        // 当手势的状态处于刚开始的状态
        
        self.myAlertView = [[UIAlertView alloc] initWithTitle:@"提示" message:@"您要保存当前图片到相册中吗？" delegate:self cancelButtonTitle:@"取消" otherButtonTitles:@"保存", nil];
        [self.myAlertView show];
    }
    
}


- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex
{
    if (buttonIndex == 1) {
        // 保存照片
        UIImageView *myImageView = (UIImageView *)[self.view viewWithTag:10001];
        UIImageWriteToSavedPhotosAlbum(myImageView.image, self, @selector(image:didFinshSavingWithError:contextInfo:), nil);
    }
}

// 保存图片错误提示方法
- (void)image:(UIImage *)image didFinshSavingWithError:(NSError *)error contextInfo:(void *)contextInfo
{
    NSString *mes = nil;
    if (error != nil) {
        mes = @"保存图片失败";
    } else {
        mes = @"保存图片成功";
    }
    self.myAlertView2 = [[UIAlertView alloc] initWithTitle:@"提示" message:mes delegate:self cancelButtonTitle:nil otherButtonTitles:nil];
    [self.myAlertView2 show];
    
    [NSTimer scheduledTimerWithTimeInterval:0.8f target:self selector:@selector(performDismiss:) userInfo:nil repeats:NO];
}

- (void)performDismiss:(NSTimer *)timer
{
    [self.myAlertView2 dismissWithClickedButtonIndex:0 animated:YES];
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
