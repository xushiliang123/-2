//
//  PhotoLibModel.m
//  VTIME
//
//  Created by gll on 2017/9/15.
//  Copyright © 2017年 MadridLee. All rights reserved.
//

#import "PhotoLibModel.h"

@implementation PhotoLibModel
- (BOOL)playStatue{
    if (self.isVideo) {
        EMVideoMessageBody *videoBody = (EMVideoMessageBody*)self.message.body;
        if (videoBody.downloadStatus == EMDownloadStatusSuccessed && [[NSFileManager defaultManager] fileExistsAtPath:self.videoUrl])
        {
            return YES;
        }else{
            return NO;
           
        }
    }else{
        return NO;
    }
}
- (BOOL)isVideo{
     if ([self.message.body isKindOfClass:[EMVideoMessageBody class]]) {
         return YES;
     }else{
         return NO;
     }
}
@end
