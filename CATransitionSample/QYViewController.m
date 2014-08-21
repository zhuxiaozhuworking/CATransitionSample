//
//  QYViewController.m
//  CATransitionSample
//
//  Created by zhangsf on 14-4-27.
//  Copyright (c) 2014年 zhangsf. All rights reserved.
//

#import "QYViewController.h"
//#import <QuartzCore/QuartzCore.h>

@interface QYViewController ()
@property (nonatomic, weak) IBOutlet UIView *mainView;
@property (nonatomic, weak) IBOutlet UIView *yellowView;
@property (nonatomic, weak) IBOutlet UIView *blueView;
@end

@implementation QYViewController
{
    CALayer *myLayer;
}
- (void)viewDidLoad
{
    [super viewDidLoad];
//    self.view.backgroundColor = [UIColor lightGrayColor];
//    UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake(30, 50, 260, 200)];
//    imageView.image = [UIImage imageNamed:@"2-3"];
//    imageView.layer.shadowColor = [UIColor orangeColor].CGColor;
//    imageView.layer.shadowOffset = CGSizeMake(10, 10);
//    imageView.layer.shadowOpacity = 1.0f;
//    [self.view addSubview:imageView];
    
    myLayer = [CALayer layer];
    myLayer.bounds = CGRectMake(0, 0, 10, 10);
    myLayer.position = CGPointMake(50, 50);
    myLayer.backgroundColor = [UIColor orangeColor].CGColor;
    myLayer.cornerRadius = 5.0;
//    myLayer.anchorPoint = CGPointMake(0, 1);
//    myLayer.anchorPoint = CGPointMake(1, 0);
//    myLayer.anchorPoint = CGPointMake(1, 1);
    myLayer.anchorPoint = CGPointMake(0, 0);
    [self.view.layer addSublayer:myLayer];
    

}


- (IBAction)animation:(id)sender {
    // create a CGPath that implements two arcs (a bounce)
    CGMutablePathRef thePath = CGPathCreateMutable();
    
//    将画笔移动到（x:20,y:20)这一个点
    CGPathMoveToPoint(thePath,NULL,50.0,50.0);
    
    CGPathAddCurveToPoint(thePath,NULL,40.0,400.0,
                          100.0,400.0,
                          300.0,50);
    
//    CGPathAddCurveToPoint(thePath,NULL,300.0,0.0,
//                          300.0,200.0,
//                          300.0,74.0);
    
    CAKeyframeAnimation * theAnimation;
    
    // Create the animation object, specifying the position property as the key path.
    theAnimation=[CAKeyframeAnimation animationWithKeyPath:@"position"];
    theAnimation.path=thePath;
//    是动画持续的时间
    theAnimation.duration=10.0;
    
    // Add the animation to the layer
//    设置通过改变哪个属性来达到移动视图 KVC
    [myLayer addAnimation:theAnimation forKey:@"position"];
     
    
////    设置动画属性， 用于改变CALayer的opacity值来实现渐隐渐现的动画效果
//    CABasicAnimation* fadeAnim = [CABasicAnimation animationWithKeyPath:@"opacity"];
////    将opacity从1.0的值进行改变
//    fadeAnim.fromValue = [NSNumber numberWithFloat:1.0];
////    改变成0.0
//    fadeAnim.toValue = [NSNumber numberWithFloat:0.0];
//    fadeAnim.duration = 3.0;
//    [myLayer addAnimation:fadeAnim forKey:@"opacity"];
//    
//    // Change the actual data value in the layer to the final value.
//    myLayer.opacity = 1.0;

}


//- (IBAction)animation:(id)sender {
//    CATransition *animation = [CATransition animation];
//    animation.delegate = self;
//    animation.duration = 1.0f;
//    animation.timingFunction = UIViewAnimationCurveEaseInOut;
//    
//    
//    animation.type = kCATransitionPush;
//    animation.subtype = kCATransitionFromTop;
//    
//    NSInteger yellowIndex1 = [self.mainView.subviews indexOfObject:self.yellowView];
//    NSInteger blueIndex = [self.mainView.subviews indexOfObject:self.blueView];
//    [self.mainView exchangeSubviewAtIndex:yellowIndex1 withSubviewAtIndex:blueIndex];
//    [self.mainView.layer addAnimation:animation forKey:@"animation"];
//
//}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
