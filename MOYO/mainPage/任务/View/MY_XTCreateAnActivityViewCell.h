//
//  MY_XTCreateAnActivityViewCell.h
//  VTIME
//
//  Created by Allen on 2017/12/16.
//  Copyright © 2017年 MadridLee. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MY_XTCreateAnActivityViewCell : UITableViewCell<UITextViewDelegate>
@property (weak, nonatomic) IBOutlet UILabel *nameL;
@property (weak, nonatomic) IBOutlet UITextView *textV;
@property (weak, nonatomic) IBOutlet UILabel *textL;

@property (nonatomic, copy) void(^textBlock)(NSString *text);

@end
