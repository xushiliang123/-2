//
//  ShareMenuItem.h
//  TogetherLu
//
//  Created by Louie on 17/1/9.
//  Copyright © 2017年 TogetherLu. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ShareMenuItem : UIControl

@property (strong, nonatomic) UIImageView * logoImageView;

@property (strong, nonatomic) UILabel * platformNameLabel;

@property (nonatomic, assign) NSInteger index;

- (void)reloadDataWithImage:(UIImage *)image platformName:(NSString *)platformName;

@end
