//
//  ViewController.m
//  动画
//
//  Created by 曾觉新 on 2018/7/12.
//  Copyright © 2018年 曾觉新. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
}

- (void)test
{
    [[self.view.layer sublayers] makeObjectsPerformSelector:@selector(removeFromSuperlayer)];
    
    
    UIBezierPath *path = [UIBezierPath bezierPath];
    [path moveToPoint:CGPointMake(15, 200)];
    [path addCurveToPoint:CGPointMake(300, 200) controlPoint1:CGPointMake(150, 100) controlPoint2:CGPointMake(200, 300)];
    
    CAShapeLayer *lineLayer = [CAShapeLayer layer];
    lineLayer.fillColor = nil;
    lineLayer.lineWidth = 2;
    lineLayer.strokeColor = [UIColor redColor].CGColor;
    lineLayer.path = path.CGPath;
    [self.view.layer addSublayer:lineLayer];
    
    
    CALayer *moveLayer = [CALayer layer];
    moveLayer.contents = (__bridge id)[UIImage imageNamed:@"58*58"].CGImage;
    moveLayer.frame = CGRectMake(15, 200, 20, 20);
    moveLayer.backgroundColor = [UIColor yellowColor].CGColor;
    moveLayer.anchorPoint = CGPointMake(0.5, 0.8);
    [self.view.layer addSublayer:moveLayer];
    
    CAKeyframeAnimation *anim1 = [CAKeyframeAnimation animation];
    anim1.keyPath = @"position";
    anim1.path = path.CGPath;
    anim1.rotationMode = kCAAnimationRotateAuto;
    
    
    CABasicAnimation *anim2 = [CABasicAnimation animation];
    anim2.keyPath = @"backgroundColor";
    anim2.toValue = (__bridge id)[UIColor grayColor].CGColor;
    
    CABasicAnimation *anim3 = [CABasicAnimation animation];
    anim3.keyPath = @"transform.scale";
    anim3.toValue = @0.5;
    
    
    CAAnimationGroup *groupAnim = [CAAnimationGroup animation];
    groupAnim.duration = 4;
    groupAnim.removedOnCompletion = NO;
    groupAnim.fillMode = kCAFillModeForwards;
    groupAnim.animations = @[anim1, anim2, anim3];
    
    [moveLayer addAnimation:groupAnim forKey:nil];
}
- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    [self test];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
