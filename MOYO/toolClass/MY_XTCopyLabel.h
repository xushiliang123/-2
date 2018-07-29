//
//  MY_XTCopyLabel.h
//  VTIME
//
//  Created by tingting on 2017/10/30.
//  Copyright © 2017年 MadridLee. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSInteger,CopyLabelStatus)
{
    COPY_PASTE_LABEL,//复制黏贴
    COPY_LABEL //复制
};

@interface MY_XTCopyLabel : UILabel

@property(nonatomic,assign) CopyLabelStatus labelType;

@end
