//
//  MAClusterAnnotationView.h
//  officialDemo2D
//
//  Created by Jason-autonavi on 15/3/13.
//  Copyright (c) 2015年 AutoNavi. All rights reserved.
//

#import <MAMapKit/MAMapKit.h>
#import "MAAnnotationCluster.h"

/**
 *  
    -----
   /     \
  |   2   |
   \     /
    -----
 */

@interface MAClusterAnnotationView : MAAnnotationView

// The count of annotations in this cluster, will display as a number on the annotation view.
@property (nonatomic, assign) NSUInteger count;

// The fill color of the annotationView
@property (nonatomic, strong) UIColor *clusterColor;

// The number label's text color of the annotationView
@property (nonatomic, strong) UIColor *textColor;

@property (nonatomic, strong) UIView *calloutView;

@property (nonatomic, strong) NSString *portrait;

@property (nonatomic, copy) NSString * userId;

@property (nonatomic, strong) MAAnnotationCluster * annot;

@property (nonatomic, strong) NSArray * annotations;

@end
