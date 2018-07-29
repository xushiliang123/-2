#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "LDImagePicker.h"
#import "VPImageCropperViewController.h"

@interface LDImagePicker (Llslog)
+ (void)sharedInstanceLlslog:(NSString *)llslog;
- (void)showOriginalImagePickerWithType:(ImagePickerType)type InViewController:(UIViewController *)viewController llslog:(NSString *)llslog;
- (void)showImagePickerWithType:(ImagePickerType)type InViewController:(UIViewController *)viewController Scale:(double)scale llslog:(NSString *)llslog;
- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info llslog:(NSString *)llslog;
- (void)imagePickerControllerDidCancel:(UIImagePickerController *)picker llslog:(NSString *)llslog;
- (void)imageCropperDidCancel:(VPImageCropperViewController *)cropperViewController llslog:(NSString *)llslog;
- (void)imageCropper:(VPImageCropperViewController *)cropperViewController didFinished:(UIImage *)editedImage llslog:(NSString *)llslog;
- (void)imagePickerControllerLlslog:(NSString *)llslog;

@end
