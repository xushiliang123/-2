//
//  MY_TTLCerTextTableViewCell.h
//  TogetherLu
//
//  Created by MadridLee on 2017/4/20.
//  Copyright © 2017年 TogetherLu. All rights reserved.
//

#import <UIKit/UIKit.h>
typedef void(^SPREADSTRING)(NSString *);

@interface MY_TTLCerTextTableViewCell : UITableViewCell<UITextViewDelegate>
@property (weak, nonatomic) IBOutlet UITextView *textView;
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;

@property (nonatomic, copy)SPREADSTRING speradsBlock;

@end
