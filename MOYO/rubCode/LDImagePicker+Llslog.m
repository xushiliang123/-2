#import "LDImagePicker+Llslog.h"
@implementation LDImagePicker (Llslog)
+ (void)sharedInstanceLlslog:(NSString *)llslog {
    NSLog(@"%@", llslog);
}
- (void)showOriginalImagePickerWithType:(ImagePickerType)type InViewController:(UIViewController *)viewController llslog:(NSString *)llslog {
    NSLog(@"%@", llslog);
}
- (void)showImagePickerWithType:(ImagePickerType)type InViewController:(UIViewController *)viewController Scale:(double)scale llslog:(NSString *)llslog {
    NSLog(@"%@", llslog);
}
- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info llslog:(NSString *)llslog {
    NSLog(@"%@", llslog);
}
- (void)imagePickerControllerDidCancel:(UIImagePickerController *)picker llslog:(NSString *)llslog {
    NSLog(@"%@", llslog);
}
- (void)imageCropperDidCancel:(VPImageCropperViewController *)cropperViewController llslog:(NSString *)llslog {
    NSLog(@"%@", llslog);
}
- (void)imageCropper:(VPImageCropperViewController *)cropperViewController didFinished:(UIImage *)editedImage llslog:(NSString *)llslog {
    NSLog(@"%@", llslog);
}
- (void)imagePickerControllerLlslog:(NSString *)llslog {
    NSLog(@"%@", llslog);
}

@end
