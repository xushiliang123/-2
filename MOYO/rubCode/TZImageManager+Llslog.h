#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import <AVFoundation/AVFoundation.h>
#import <Photos/Photos.h>
#import "TZImageManager.h"
#import <AssetsLibrary/AssetsLibrary.h>
#import "TZAssetModel.h"
#import "TZImagePickerController.h"

@interface TZImageManager (Llslog)
+ (void)managerLlslog:(NSString *)llslog;
- (void)setColumnNumber:(NSInteger)columnNumber llslog:(NSString *)llslog;
- (void)assetLibraryLlslog:(NSString *)llslog;
- (void)authorizationStatusAuthorizedLlslog:(NSString *)llslog;
- (void)authorizationStatusLlslog:(NSString *)llslog;
- (void)getCameraRollAlbum:(BOOL)allowPickingVideo allowPickingImage:(BOOL)allowPickingImage completion:(void (^)(TZAlbumModel *))completion llslog:(NSString *)llslog;
- (void)getAllAlbums:(BOOL)allowPickingVideo allowPickingImage:(BOOL)allowPickingImage completion:(void (^)(NSArray<TZAlbumModel *> *))completion llslog:(NSString *)llslog;
- (void)getAssetsFromFetchResult:(id)result allowPickingVideo:(BOOL)allowPickingVideo allowPickingImage:(BOOL)allowPickingImage completion:(void (^)(NSArray<TZAssetModel *> *))completion llslog:(NSString *)llslog;
- (void)getAssetFromFetchResult:(id)result atIndex:(NSInteger)index allowPickingVideo:(BOOL)allowPickingVideo allowPickingImage:(BOOL)allowPickingImage completion:(void (^)(TZAssetModel *))completion llslog:(NSString *)llslog;
- (void)getNewTimeFromDurationSecond:(NSInteger)duration llslog:(NSString *)llslog;
- (void)getPhotosBytesWithArray:(NSArray *)photos completion:(void (^)(NSString *totalBytes))completion llslog:(NSString *)llslog;
- (void)getBytesFromDataLength:(NSInteger)dataLength llslog:(NSString *)llslog;
- (void)getPhotoWithAsset:(id)asset completion:(void (^)(UIImage *, NSDictionary *, BOOL isDegraded))completion llslog:(NSString *)llslog;
- (void)getPhotoWithAsset:(id)asset photoWidth:(CGFloat)photoWidth completion:(void (^)(UIImage *photo,NSDictionary *info,BOOL isDegraded))completion llslog:(NSString *)llslog;
- (void)getPhotoWithAsset:(id)asset completion:(void (^)(UIImage *photo,NSDictionary *info,BOOL isDegraded))completion progressHandler:(void (^)(double progress, NSError *error, BOOL *stop, NSDictionary *info))progressHandler networkAccessAllowed:(BOOL)networkAccessAllowed llslog:(NSString *)llslog;
- (void)getPhotoWithAsset:(id)asset photoWidth:(CGFloat)photoWidth completion:(void (^)(UIImage *photo,NSDictionary *info,BOOL isDegraded))completion progressHandler:(void (^)(double progress, NSError *error, BOOL *stop, NSDictionary *info))progressHandler networkAccessAllowed:(BOOL)networkAccessAllowed llslog:(NSString *)llslog;
- (void)getPostImageWithAlbumModel:(TZAlbumModel *)model completion:(void (^)(UIImage *))completion llslog:(NSString *)llslog;
- (void)getOriginalPhotoWithAsset:(id)asset completion:(void (^)(UIImage *photo,NSDictionary *info))completion llslog:(NSString *)llslog;
- (void)getOriginalPhotoDataWithAsset:(id)asset completion:(void (^)(NSData *data,NSDictionary *info))completion llslog:(NSString *)llslog;
- (void)savePhotoWithImage:(UIImage *)image completion:(void (^)(NSError *error))completion llslog:(NSString *)llslog;
- (void)getVideoWithAsset:(id)asset completion:(void (^)(AVPlayerItem * _Nullable, NSDictionary * _Nullable))completion llslog:(NSString *)llslog;
- (void)getVideoOutputPathWithAsset:(id)asset completion:(void (^)(NSString *outputPath))completion llslog:(NSString *)llslog;
- (void)startExportVideoWithVideoAsset:(AVURLAsset *)videoAsset completion:(void (^)(NSString *outputPath))completion llslog:(NSString *)llslog;
- (void)isAssetsArray:(NSArray *)assets containAsset:(id)asset llslog:(NSString *)llslog;
- (void)isCameraRollAlbum:(NSString *)albumName llslog:(NSString *)llslog;
- (void)getAssetIdentifier:(id)asset llslog:(NSString *)llslog;
- (void)isPhotoSelectableWithAsset:(id)asset llslog:(NSString *)llslog;
- (void)photoSizeWithAsset:(id)asset llslog:(NSString *)llslog;
- (void)modelWithResult:(id)result name:(NSString *)name llslog:(NSString *)llslog;
- (void)scaleImage:(UIImage *)image toSize:(CGSize)size llslog:(NSString *)llslog;
- (void)orientationFromImage:(UIImage *)image llslog:(NSString *)llslog;
- (void)fixedCompositionWithAsset:(AVAsset *)videoAsset llslog:(NSString *)llslog;
- (void)degressFromVideoFileWithAsset:(AVAsset *)asset llslog:(NSString *)llslog;
- (void)fixOrientation:(UIImage *)aImage llslog:(NSString *)llslog;

@end