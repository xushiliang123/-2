//
//  Banner.h
//  SXtext
//
//  Created by i51Star on 15/9/28.
//  Copyright (c) 2015年 i51Star. All rights reserved.
//


#import <Foundation/Foundation.h>

/*
 {
 "info": [
 {
 "createTime": 1514016126000,
 "id": 1,
 "remark": "fc2",
 "url": "http://www.tingting365.com/images/lolImg.png",
 "webUrl": "https://www.bilibili.com"
 }
 ],
 "msg": "",
 "ret": 0
 }
 */
@interface Banner : BaseModel
@property (strong, nonatomic) NSNumber* bannerId;
@property (strong, nonatomic) NSString *url;
@property (strong, nonatomic) NSString *webUrl;
@property (strong, nonatomic) NSString *remark;
@property (strong, nonatomic) NSNumber *createTime;


@end
