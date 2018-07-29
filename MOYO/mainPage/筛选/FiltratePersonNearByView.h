//
//  FiltratePersonNearByView.h
//  TogetherLu
//
//  Created by gll on 2017/6/20.
//  Copyright © 2017年 TogetherLu. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface FiltratePersonNearByView : UIView

@property (copy, nonatomic) void (^blockFiltrate)(NSDictionary * selectParmeter);

-(void)addWindowForView;
@end
