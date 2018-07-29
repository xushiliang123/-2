#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "SXPickPhoto.h"

@interface SXPickPhoto (Llslog)
- (void)initLlslog:(NSString *)llslog;
- (void)ShowTakePhotoWithController: (UIViewController *)Controller withIsEdit:(BOOL)isedit andWithBlock: (myblock)block llslog:(NSString *)llslog;
- (void)SHowLocalPhotoWithController: (UIViewController *)Controller  withIsEdit:(BOOL)isedit andWithBlock: (myblock)block llslog:(NSString *)llslog;
- (void)imagePickerController:(UIImagePickerController*)picker didFinishPickingMediaWithInfo:(NSDictionary *)info llslog:(NSString *)llslog;
- (void)imagePickerControllerDidCancel:(UIImagePickerController *)picker llslog:(NSString *)llslog;

@end
