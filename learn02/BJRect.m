//
//  BJRect.m
//  learn02
//
//  Created by 周明波 on 15/10/25.
//  Copyright © 2015年 周明波. All rights reserved.
//

#import "BJRect.h"

@implementation BJRect

@synthesize x, y, size, view, layer;

+(BJRect *)initWithSize: (int) size initWithX:(int) x initWithY:(int) y initWithView:(UIView *)view {
    BJRect * bjrect = [BJRect new];
    bjrect.view = view;
    bjrect.size = size;
    bjrect.x = x;
    bjrect.y = y;
    bjrect.layer = nil;
    return bjrect;
}

-(void)draw {
    [self.layer removeFromSuperlayer];
    UIBezierPath * path = [UIBezierPath bezierPath];
    CGPoint startPoint = CGPointMake(self.x * self.size, self.y * self.size);
    CGPoint endPoint = CGPointMake(startPoint.x + self.size, startPoint.y);
    [path moveToPoint:startPoint];
    [path addLineToPoint:endPoint];
    endPoint = CGPointMake(startPoint.x + self.size, startPoint.y + self.size);
    [path addLineToPoint:endPoint];
    endPoint = CGPointMake(startPoint.x, startPoint.y + self.size);
    [path addLineToPoint:endPoint];
    [path closePath];
    
    
    CAShapeLayer * _layer = [CAShapeLayer layer];
    _layer.fillColor = [UIColor colorWithRed:0 green:0 blue:0 alpha:0.2].CGColor;
    _layer.strokeColor = [UIColor colorWithRed:1 green:0 blue:0 alpha:0.5].CGColor;
    _layer.frame = self.view.frame;
    _layer.lineWidth = 1;
    
    _layer.path = path.CGPath;
    self.layer = _layer;
    [self.view.layer addSublayer:_layer];
}

-(void)remove {
    [self.layer removeFromSuperlayer];
}
@end
