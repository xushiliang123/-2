//
//  MAClusterAnnotationView.m
//  officialDemo2D
//
//  Created by Jason-autonavi on 15/3/13.
//  Copyright (c) 2015年 AutoNavi. All rights reserved.
//

#import "MAClusterAnnotationView.h"

#define kPortraitWidth  48.f
#define kPortraitHeight 63.f


CGPoint MARectCenter(CGRect rect)
{
    return CGPointMake(CGRectGetMidX(rect), CGRectGetMidY(rect));
}

CGRect MACenterRect(CGRect rect, CGPoint center)
{
    CGRect r = CGRectMake(center.x - rect.size.width/2.0,
                          center.y - rect.size.height/2.0,
                          rect.size.width,
                          rect.size.height);
    return r;
}

static CGFloat const MAScaleFactorAlpha = 0.3;
static CGFloat const MAScaleFactorBeta = 0.4;

//CGFloat MAScaledValueForValue(CGFloat value)
//{
//    return 1.0 / (1.0 + expf(-1 * MAScaleFactorAlpha * powf(value, MAScaleFactorBeta)));
//}


@interface MAClusterAnnotationView ()

@property (nonatomic, strong) UIImageView *bgImgV;

@property (nonatomic, strong) UIImageView *portraitImageView;

@property (nonatomic, strong) UILabel *countLabel;

@end

@implementation MAClusterAnnotationView

#pragma mark - Init
- (instancetype)initWithAnnotation:(id<MAAnnotation>)annotation reuseIdentifier:(NSString *)reuseIdentifier
{
    if (self = [super initWithAnnotation:annotation reuseIdentifier:reuseIdentifier]) {
        _count        = 1;
//        _clusterColor = [UIColor colorWithRed:255.0/255.0 green:95/255.0 blue:42/255.0 alpha:1.0];
        _textColor    = UIColor.whiteColor;
        self.backgroundColor = UIColor.clearColor;
        [self setupLabel];
    }
    
    return self;
}
- (UIImage *)portrait
{
    return self.portraitImageView.image;
}

- (void)setPortrait:(NSString *)portrait{
    
    [self.portraitImageView sd_setImageWithURL:[NSURL URLWithString:portrait] placeholderImage:[UIImage imageNamed:@"占位图"] options:SDWebImageAllowInvalidSSLCertificates];
}

- (void)setupLabel
{
    self.bounds = CGRectMake(0.f, 0.f, 48, 63);
    self.backgroundColor = [UIColor clearColor];
    
    _bgImgV = [[UIImageView alloc] init];
    _bgImgV.image = [UIImage imageNamed:@"MissPoint"];
    [self addSubview:_bgImgV];
    
    [_bgImgV mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.edges.equalTo(self);
    }];
    
    self.portraitImageView = [[UIImageView alloc] init];
    self.portraitImageView.layer.masksToBounds = YES;
    self.portraitImageView.layer.cornerRadius = kPortraitWidth / 2;
    [self addSubview:self.portraitImageView];
    
    //  96
    [self.portraitImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.top.equalTo(self.bgImgV.mas_top).mas_offset(2);
        make.left.equalTo(self.bgImgV.mas_left).mas_offset(2);
        make.width.height.mas_equalTo(44);
    }];
    
    _countLabel = [[UILabel alloc] init];
    _countLabel.backgroundColor = [UIColor clearColor];
    _countLabel.textColor = self.textColor;
    _countLabel.textAlignment = NSTextAlignmentCenter;
//    _countLabel.shadowColor = [UIColor whiteColor];
//    _countLabel.shadowOffset = CGSizeMake(0, -1);
//    _countLabel.adjustsFontSizeToFitWidth = YES;
    _countLabel.numberOfLines = 1;
    _countLabel.font = [UIFont systemFontOfSize:10];
//    _countLabel.baselineAdjustment = UIBaselineAdjustmentAlignCenters;
    [self addSubview:_countLabel];
    
    [_countLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.bottom.equalTo(self.mas_bottom).mas_offset(-5);
        make.centerX.equalTo(self.portraitImageView.mas_centerX);
        make.height.mas_equalTo(9);
        make.width.mas_equalTo(20);
    }];
}

- (void)setAnnot:(MAAnnotationCluster *)annot {
    _annot = annot;
    
    NSInteger sex = _annot.sex.integerValue;
    switch (sex) {
        case 0:
            _bgImgV.image = [UIImage imageNamed:@"MissPoint"];
            break;
        case 1:
            _bgImgV.image = [UIImage imageNamed:@"MrPoint"];
            break;
        case 8:
            _bgImgV.image = [UIImage imageNamed:@"map_7"];
            break;
        default:
            _bgImgV.image = [UIImage imageNamed:@"MissPoint"];
            break;
    }
}

#pragma mark - Setter 
- (void)setCount:(NSUInteger)count
{
    _count = count;
    
//    CGRect newBounds = CGRectMake(0, 0, roundf(44 * MAScaledValueForValue(count)), roundf(44 * MAScaledValueForValue(count)));
//    self.frame = MACenterRect(newBounds, self.center);
    
//    CGRect newLabelBounds = CGRectMake(0, 0, newBounds.size.width / 1.3, newBounds.size.height / 1.3);
//    self.countLabel.frame = MACenterRect(newLabelBounds, MARectCenter(newBounds));
    self.countLabel.text = [@(_count) stringValue];
    
//    [self setNeedsDisplay];
}



#pragma mark - Drawing

//- (void)drawRect:(CGRect)rect
//{
//    CGContextRef context = UIGraphicsGetCurrentContext();
//    
//    CGContextSetAllowsAntialiasing(context, true);
//    
//    UIColor *outerCircleStrokeColor = [UIColor colorWithWhite:0 alpha:0.25];
//    UIColor *innerCircleStrokeColor = [UIColor whiteColor];
//    UIColor *innerCircleFillColor = self.clusterColor;
//    
//    CGRect circleFrame = CGRectInset(rect, 4, 4);
//    
//    [outerCircleStrokeColor setStroke];
//    CGContextSetLineWidth(context, 5.0);
//    CGContextStrokeEllipseInRect(context, circleFrame);
//    
//    [innerCircleStrokeColor setStroke];
//    CGContextSetLineWidth(context, 4);
//    CGContextStrokeEllipseInRect(context, circleFrame);
//    
//    [innerCircleFillColor setFill];
//    CGContextFillEllipseInRect(context, circleFrame);
//    
//}


#pragma mark - Reuse

- (void)prepareForReuse
{
    [super prepareForReuse];
}




@end
