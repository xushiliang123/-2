//
//  MY_TTLClubInputChatView.m
//  VTIME
//
//  Created by 听听 on 2017/10/17.
//  Copyright © 2017年 MadridLee. All rights reserved.
//

#import "MY_TTLClubInputChatView.h"


@interface MY_TTLClubInputChatView()


@end

@implementation MY_TTLClubInputChatView

- (instancetype)initWithFrame:(CGRect)frame
                         type:(EMChatToolbarType)type
{
    
    self = [super initWithFrame:frame horizontalPadding:11 verticalPadding:5 inputViewMinHeight:36 inputViewMaxHeight:150 type:type];
//    self = [super initWithFrame:frame type:type];
    if (self) {
//        self.backgroundImage = [UIImage imageNamed:@"clubMoney"];
        [self setupMySubviews];
    }
    return self;
}


#pragma mark - setup subviews

/*!
 @method
 @brief 加载视图
 @discussion
 @result
 */
- (void)setupMySubviews
{
 
    
    self.backgroundImage = [Utility createImageWithColor:[Utility colorWithHexString:@"262626" alpha:1.0]];
    //拍照
    UIButton *photoButton = [[UIButton alloc] init];
    photoButton.accessibilityIdentifier = @"photo";
    photoButton.autoresizingMask = UIViewAutoresizingFlexibleTopMargin;
    [photoButton setImage:[UIImage imageNamed:@"Camera"] forState:UIControlStateNormal];
    [photoButton setImage:[UIImage imageNamed:@"Camera"] forState:UIControlStateHighlighted];
    [photoButton setImage:[UIImage imageNamed:@"Camera"] forState:UIControlStateSelected];
    [photoButton addTarget:self action:@selector(photoButtonAction:) forControlEvents:UIControlEventTouchUpInside];
    EaseChatToolbarItem *photoItem = [[EaseChatToolbarItem alloc] initWithButton:photoButton withView:nil];
    
    //emoji
    UIButton *faceButton = [[UIButton alloc] init];
    faceButton.accessibilityIdentifier = @"face";
    faceButton.autoresizingMask = UIViewAutoresizingFlexibleTopMargin;
    [faceButton setImage:[UIImage imageNamed:@"emoji"] forState:UIControlStateNormal];
    [faceButton setImage:[UIImage imageNamed:@"emoji"] forState:UIControlStateHighlighted];
    [faceButton setImage:[UIImage imageNamed:@"emoji"] forState:UIControlStateSelected];
    [faceButton addTarget:self action:@selector(faceButtonAction:) forControlEvents:UIControlEventTouchUpInside];
    EaseChatToolbarItem *faceItem = [[EaseChatToolbarItem alloc] initWithButton:faceButton withView:self.faceView];
    [self setInputViewLeftItems:@[photoItem,faceItem]];
    
//    UIButton *messButton = [[UIButton alloc] init];
//    messButton.accessibilityIdentifier = @"mess";
//    messButton.autoresizingMask = UIViewAutoresizingFlexibleTopMargin;
//    [messButton setImage:[UIImage imageNamed:@"EaseUIResource.bundle/chatBar_face"] forState:UIControlStateNormal];
//    [messButton setImage:[UIImage imageNamed:@"EaseUIResource.bundle/chatBar_faceSelected"] forState:UIControlStateHighlighted];
//    [messButton setImage:[UIImage imageNamed:@"EaseUIResource.bundle/chatBar_keyboard"] forState:UIControlStateSelected];
//    [messButton addTarget:self action:@selector(messButtonAction:) forControlEvents:UIControlEventTouchUpInside];
//    EaseChatToolbarItem *messItem = [[EaseChatToolbarItem alloc] initWithButton:messButton withView:nil];
    [self setInputViewRightItems:nil];
    self.inputTextView.layer.cornerRadius = 16;
    self.inputTextView.layer.masksToBounds = YES;
//    self.inputTextView.contentInset = UIEdgeInsetsMake(8, 12, 6, 8);
    self.inputTextView.textContainerInset = UIEdgeInsetsMake(8, 8, 6, 8);
//    //backgroundImageView

}
#pragma mark - 调用手机相机和相册
- (void)photoButtonAction:(UIButton*)sender{
    EaseChatBarMoreView* moreView = (EaseChatBarMoreView*)self.moreView;
    if (self.takePhoto) {
        self.takePhoto(moreView);
    }
}
-(void)messButtonAction:(UIButton*)sender{
}
- (void)faceButtonAction:(id)sender
{
    UIButton *button = (UIButton *)sender;
    button.selected = !button.selected;
    
    EaseChatToolbarItem *faceItem = nil;
    for (EaseChatToolbarItem *item in self.inputViewRightItems) {
        item.button.selected = NO;
    }
    
    for (EaseChatToolbarItem *item in self.inputViewLeftItems) {
        
        if (item.button == button){
            faceItem = item;
            continue;
        }
        
        item.button.selected = NO;
    }
    
    if (button.selected) {
        [self.inputTextView resignFirstResponder];
        
        [self willShowBottomView:faceItem.button2View];
        [UIView animateWithDuration:0.2 delay:0 options:UIViewAnimationOptionCurveEaseInOut animations:^{
//            self.recordButton.hidden = button.selected;
            self.inputTextView.hidden = !button.selected;
        } completion:^(BOOL finished) {
            
        }];
    } else {
        [self.inputTextView becomeFirstResponder];
    }
}

@end
