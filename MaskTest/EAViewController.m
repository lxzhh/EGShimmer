//
//  EAViewController.m
//  MaskTest
//
//  Created by lxzhh on 14-3-17.
//  Copyright (c) 2014年 lxzhh. All rights reserved.
//

#import "EAViewController.h"
#import <QuartzCore/QuartzCore.h>

#define kDarkColor [UIColor colorWithRed:0.022 green:0.434 blue:1.000 alpha:1.000]
#define kshimmerWidth 200
@interface EAViewController (){
    CATextLayer *textLayer;
    
    CALayer *backgroundLayer;
    
    CAGradientLayer *shimmerLayer;
    
}
@end

@implementation EAViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    textLayer = [CATextLayer layer];
    textLayer.bounds = CGRectMake(0, 0, 320, 38);
    textLayer.string = @"slide to unlock";
    textLayer.font = CFBridgingRetain([UIFont boldSystemFontOfSize:18].fontName);
    textLayer.wrapped = NO;
    textLayer.foregroundColor = [UIColor whiteColor].CGColor;
    textLayer.alignmentMode = kCAAlignmentCenter;
    textLayer.anchorPoint = CGPointMake(0.5, 0.0);
    textLayer.position = CGPointMake(160, 0);

    backgroundLayer = [CALayer layer];
    backgroundLayer.bounds = CGRectMake(0, 0, 320, 200);
    backgroundLayer.backgroundColor =kDarkColor.CGColor;
    backgroundLayer.anchorPoint = CGPointMake(0, 0);
    backgroundLayer.position = CGPointMake(0, 160);
    [self.view.layer addSublayer:backgroundLayer];
    backgroundLayer.mask = textLayer;
    
    
    shimmerLayer = [CAGradientLayer layer];
    shimmerLayer.colors = @[(id)kDarkColor.CGColor,
                         (id)[UIColor colorWithRed:0.923 green:0.923 blue:1.000 alpha:0.920].CGColor,
                         (id)kDarkColor.CGColor];
    shimmerLayer.locations = @[@(0),@(0.5),@(1.0)];
    shimmerLayer.startPoint = CGPointMake(0, 0.5);
    shimmerLayer.endPoint = CGPointMake(1, 0.5);
    shimmerLayer.bounds = CGRectMake(0, 0, 100, kshimmerWidth);
    shimmerLayer.anchorPoint = CGPointMake(0.5, 0.5);
    shimmerLayer.position = CGPointMake(-kshimmerWidth, 100);
    [backgroundLayer addSublayer:shimmerLayer];

}
- (IBAction)animationButton:(id)sender {
    CABasicAnimation *animation = [CABasicAnimation animationWithKeyPath:@"position.x"];
    animation.duration = 2.6;
    animation.repeatCount = INT16_MAX;
    animation.fromValue = @(-kshimmerWidth);
    animation.toValue = @(backgroundLayer.bounds.size.width + kshimmerWidth);
    [shimmerLayer addAnimation:animation forKey:@"shimmer animation"];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
