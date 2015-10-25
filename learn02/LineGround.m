//
//  LineGround.m
//  learn02
//
//  Created by 周明波 on 15/10/25.
//  Copyright © 2015年 周明波. All rights reserved.
//

#import "LineGround.h"

@implementation LineGround

@synthesize size, view, width, height;

+(LineGround *) initWithSize:(int)size initWithView:(UIView *)view initWithWidth:(int)width initWithHeight:(int)height {
    LineGround * lg = [LineGround new];
    lg.size = size;
    lg.view = view;
    lg.width = width;
    lg.height = height;
    return lg;
}

-(void)draw {
    int i = 0;
    int y = 0;
    int det = self.size;
    CGPoint startPoint, endPoint;
    for (i = 0; i <= 10; i++) {
        startPoint = CGPointMake(i * det, 0);
        endPoint = CGPointMake(i * det, self.height);
        [self makeLine:startPoint endWith:endPoint];
    }
    for (y = self.height; y >= 0; y -= det) {
        startPoint = CGPointMake(0, y);
        endPoint = CGPointMake(self.width, y);
        [self makeLine:startPoint endWith:endPoint];
    }
}

-(void)makeLine:(CGPoint) startPoint endWith:(CGPoint) endPoint {
    CAShapeLayer * layer = [CAShapeLayer layer];
    layer.fillColor = [UIColor colorWithRed:0 green:0 blue:0 alpha:0.2].CGColor;
    layer.strokeColor = [UIColor colorWithRed:1 green:0 blue:0 alpha:0.5].CGColor;
    layer.frame = self.view.frame;
    layer.lineWidth = 1;
    
    UIBezierPath * path = [UIBezierPath bezierPath];
    [path moveToPoint:startPoint];
    [path addLineToPoint:endPoint];
    
    layer.path = path.CGPath;
    
    [self.view.layer addSublayer:layer];
//    NSLog(@"add sub layer startPoint [%f, %f] endPoint [%f, %f]", startPoint.x, startPoint.y, endPoint.x, endPoint.y);
}
@end
