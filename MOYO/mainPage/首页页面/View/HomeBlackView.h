//
//  HomeBlackView.h
//  VTIME
//
//  Created by Allen on 2017/12/15.
//  Copyright © 2017年 MadridLee. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface HomeBlackView : UIView

- (instancetype)initWithFrameHeight:(NSInteger)height leftHeight:(NSInteger)leftheight typeWith:(NSInteger)typeS isOne:(BOOL)yesNo;

- (void)show;
- (void)dismissAlert;
@end
