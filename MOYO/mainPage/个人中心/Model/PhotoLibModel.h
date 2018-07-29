//
//  PhotoLibModel.h
//  VTIME
//
//  Created by gll on 2017/9/15.
//  Copyright © 2017年 MadridLee. All rights reserved.
//

#import "MY_GLHomeModel.h"

/* 个人中心相册 */

@interface PhotoLibModel : BaseModel
/*
 
 createTime = 1510054802000;
 photoType = 0;
 photoUrl = "http://123.59.69.252/upload/images/2120486-39614654482444003481510054802561.png";
 smallPhotoUrl = "http://123.59.69.252/upload/images/sm_2120486-39614654482444003481510054802561.png";
 userId = 2120486;
 videoHeight = 0;
 videoLength = 0;
 videoWidth = 0;
 videoUrl
*/

@property (strong, nonatomic) NSNumber * photoId;       // 图片ID

@property (strong, nonatomic) NSString* smallPhotoUrl;  // 小图地址，预留地址，为空这使用photoUrl
@property (strong, nonatomic) NSString* photoUrl;      // 图片地址
@property (strong, nonatomic) NSNumber* photoType;      //图片的类型，0为图片，1为视频截图图片

@property (strong, nonatomic) NSString* videoUrl;       // 视频地址

@property (assign, nonatomic)BOOL playStatue;       // 是否可以播放
@property (assign, nonatomic)BOOL isVideo;       // 是否是视频
@property (assign, nonatomic)NSMutableDictionary *isLoadingVideo;
@property (strong, nonatomic)EMMessage *message;


@end
