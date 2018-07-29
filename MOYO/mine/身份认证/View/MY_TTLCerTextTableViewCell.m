//
//  MY_TTLCerTextTableViewCell.m
//  TogetherLu
//
//  Created by MadridLee on 2017/4/20.
//  Copyright © 2017年 TogetherLu. All rights reserved.
//

#import "MY_TTLCerTextTableViewCell.h"

@implementation MY_TTLCerTextTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
    self.titleLabel.textColor = [Utility colorWithHexString:@"c9c9c9" alpha:1];
    
    self.textView.delegate = self;
}

#pragma textViewDelegate
-(void)textViewDidChange:(UITextView *)textView
{
    
    if (textView.text.length != 0) {
        self.titleLabel.text = @"";
        self.titleLabel.hidden = YES;
    }
    else{
        self.titleLabel.text = @"如：某某公司副总裁、保时捷911车主";
        self.titleLabel.hidden = NO;
    }
    
    
}
- (BOOL)textView:(UITextView *)textView shouldChangeTextInRange:(NSRange)range
 replacementText:(NSString *)text
{
    if ([@"\n" isEqualToString:text] == YES)
    {
        [textView resignFirstResponder];
        if (textView.text.length == 0)
        {
            self.titleLabel.text = @"如：某某公司副总裁、保时捷911车主";
            self.titleLabel.hidden = NO;
        }
        return NO;
    }
    
    return YES;
    
}

- (void)textViewDidEndEditing:(UITextView *)textView {
    
    if (![Utility isBlankString:textView.text]) {
        self.speradsBlock(textView.text);
    }
//    NSLog(@"%@", textView.text);
}


- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
