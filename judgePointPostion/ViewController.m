//
//  ViewController.m
//  judgePointPostion
//
//  Created by 王朋 on 2017/10/31.
//  Copyright © 2017年 王朋. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
{
    UIView *tempView;
    CAShapeLayer *shaperLayer;
    
}
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.view.backgroundColor =[UIColor blackColor];
    [self setupUI];
}



- (void)setupUI {
    
    tempView =[[UIView alloc] initWithFrame:CGRectMake(50, 200, 300, 400)];
    tempView.backgroundColor =[UIColor blueColor];
    [self.view addSubview:tempView];
    
    UIBezierPath *path =[UIBezierPath bezierPath];
    shaperLayer =[CAShapeLayer layer];
    shaperLayer.strokeColor =[UIColor redColor].CGColor;
    shaperLayer.lineWidth =2;
    
    CGPoint start =CGPointMake(0, tempView.frame.size.height/2+tempView.frame.size.height*.2);
    [path moveToPoint:start];
    [path addLineToPoint:CGPointMake(tempView.frame.size.width, tempView.frame.size.height/2 -tempView.frame.size.height*.2)];
    [path addLineToPoint:CGPointMake(tempView.frame.size.width, tempView.frame.size.height)];
    [path addLineToPoint:CGPointMake(0, tempView.frame.size.height)];
    
    shaperLayer.path =[path CGPath];
    [tempView.layer addSublayer:shaperLayer];
    
    shaperLayer.fillColor =[[UIColor greenColor] CGColor];
    
    UITapGestureRecognizer *tap =[[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapView:)];
    tempView.userInteractionEnabled =YES;
    [tempView addGestureRecognizer:tap];
    
    
    
}

-(void)tapView:(UITapGestureRecognizer*)tap {
    
    CGPoint point =[tap locationInView:tap.view];
    
    if (CGPathContainsPoint(shaperLayer.path, NULL, point, NO)) {
        
        NSLog(@"----------在范围内-----------");
        
    } else {
        NSLog(@"----------不在范围内-----------");

    }
    
}


@end
