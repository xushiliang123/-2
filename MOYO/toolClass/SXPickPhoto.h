//
//  SXPickPhoto.h
//  SXPickphotos
//
//  Created by ShaoPro on 15/12/25.
//  Copyright © 2015年 ShaoPro. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
/**
 *  回调Block
 *
 *  @param Data 返回值
 */
typedef void(^myblock)(NSObject * Data);

/**
 *  相册选择
 */
@interface SXPickPhoto : NSObject<UIImagePickerControllerDelegate,UINavigationControllerDelegate>

/**
 *  相册选择器
 */
@property (nonatomic,strong) UIImagePickerController *picker;

@property (nonatomic,assign) BOOL isedit;//1:编辑， 0不编辑

/**
 *  block
 */
@property (nonatomic,strong) myblock  myblock;

/**
 *  打开相机：
 *
 *  @param object2 控制器对象
 */
- (void)ShowTakePhotoWithController: (UIViewController *)Controller withIsEdit:(BOOL)isedit
                       andWithBlock: (myblock)block;

/**
 *  选择相册
 *
 *  @param Controller 控制器对象
 */

- (void)SHowLocalPhotoWithController: (UIViewController *)Controller  withIsEdit:(BOOL)isedit andWithBlock: (myblock)block;


@end
