//
//  MY_TTLHongBaoClickPopView.h
//  VTIME
//
//  Created by 听听 on 2018/2/1.
//  Copyright © 2018年 MadridLee. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MY_TTLHongBaoClickPopView : UIView
@property (copy, nonatomic) void (^blockFiltrate)();
@property (copy, nonatomic) void (^blockDeatailFiltrate)();
-(void)addWindowForView;
@end
