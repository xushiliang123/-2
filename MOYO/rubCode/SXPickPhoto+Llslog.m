#import "SXPickPhoto+Llslog.h"
@implementation SXPickPhoto (Llslog)
- (void)initLlslog:(NSString *)llslog {
    NSLog(@"%@", llslog);
}
- (void)ShowTakePhotoWithController: (UIViewController *)Controller withIsEdit:(BOOL)isedit andWithBlock: (myblock)block llslog:(NSString *)llslog {
    NSLog(@"%@", llslog);
}
- (void)SHowLocalPhotoWithController: (UIViewController *)Controller  withIsEdit:(BOOL)isedit andWithBlock: (myblock)block llslog:(NSString *)llslog {
    NSLog(@"%@", llslog);
}
- (void)imagePickerController:(UIImagePickerController*)picker didFinishPickingMediaWithInfo:(NSDictionary *)info llslog:(NSString *)llslog {
    NSLog(@"%@", llslog);
}
- (void)imagePickerControllerDidCancel:(UIImagePickerController *)picker llslog:(NSString *)llslog {
    NSLog(@"%@", llslog);
}

@end
