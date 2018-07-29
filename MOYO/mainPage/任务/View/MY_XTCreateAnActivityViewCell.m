//
//  MY_XTCreateAnActivityViewCell.m
//  VTIME
//
//  Created by Allen on 2017/12/16.
//  Copyright © 2017年 MadridLee. All rights reserved.
//

#import "MY_XTCreateAnActivityViewCell.h"

@implementation MY_XTCreateAnActivityViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    self.textV.delegate = self;
}
- (void)textViewDidBeginEditing:(UITextView *)textView
{
    if ([textView.text isEqualToString:@"发布色情，反动等文字将会被封号处理"]) {
        textView.text = nil;
    }
    
}
- (void)textViewDidChange:(UITextView *)textView
{
    if (textView.text.length > 50) {
        self.textL.text = @"(50/50)";
        textView.text = [textView.text substringToIndex:50];
    }else{
        self.textL.text = [NSString stringWithFormat:@"(%ld/50)",textView.text.length];
    }
}
- (void)textViewDidEndEditing:(UITextView *)textView
{
    if ([textView.text isEqualToString:@""]) {
        textView.text = @"发布色情，反动等文字将会被封号处理";
        self.textL.text = @"(0/50)";
    }else{
        if (self.textBlock) {
            self.textBlock(textView.text);
        }
    }
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
