#import <MobileCoreServices/MobileCoreServices.h>
#import <AVFoundation/AVFoundation.h>
#import <MediaPlayer/MediaPlayer.h>
#import "EaseRefreshTableViewController.h"
#import "IMessageModel.h"
#import "EaseMessageModel.h"
#import "EaseBaseMessageCell.h"
#import "EaseMessageTimeCell.h"
#import "EaseChatToolbar.h"
#import "EaseLocationViewController.h"
#import "EMCDDeviceManager+Media.h"
#import "EMCDDeviceManager+ProximitySensor.h"
#import "UIViewController+HUD.h"
#import "EaseSDKHelper.h"
#import "MY_GLClubModel.h"
#import "EaseMessageViewController.h"
#import "PhotoLibModel.h"
#import "DYBasePopView.h"
#import <Foundation/Foundation.h>
#import <Photos/Photos.h>
#import <AssetsLibrary/AssetsLibrary.h>
#import "NSDate+Category.h"
#import "EaseUsersListViewController.h"
#import "EaseMessageReadManager.h"
#import "EaseEmotionManager.h"
#import "EaseEmoji.h"
#import "EaseEmotionEscape.h"
#import "EaseCustomMessageCell.h"
#import "UIImage+GIF.h"
#import "EaseLocalDefine.h"
#import "EaseSDKHelper.h"
#import "MY_LYPersonInfoModel.h"
#import "MY_LLDBManager.h"
#import "MY_LYMessageInfoModel.h"
#import  "TZImagePickerController.h"
#import "VPImageCropperViewController.h"
#import "TZImageManager.h"

@interface EaseAtTarget (Llslog)
- (void)initWithUserId:(NSString*)userId andNickname:(NSString*)nickname llslog:(NSString *)llslog;

@end
