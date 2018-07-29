//
//  MY_GLSheetView.h
//  VTIME
//
//  Created by gll on 2017/9/11.
//  Copyright © 2017年 MadridLee. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MY_GLSheetView : UIView
//  1 拍照 2 相册
@property(nonatomic,copy)void(^ShowPhotoLibraryBlock)(NSInteger index);

@end
