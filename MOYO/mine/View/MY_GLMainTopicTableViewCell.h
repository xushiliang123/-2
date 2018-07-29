//
//  MY_GLMainTopicTableViewCell.h
//  VTIME
//
//  Created by gll on 2018/1/12.
//  Copyright © 2018年 MadridLee. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface MY_GLMainTopicTableViewCell : UITableViewCell

@property (nonatomic, copy)void(^buttonClick)(NSInteger) ;

- (void)setUIWithArray:(NSArray *)imageArray;


@end
