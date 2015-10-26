//
//  BJRect.m
//  learn02
//
//  Created by 周明波 on 15/10/25.
//  Copyright © 2015年 周明波. All rights reserved.
//

#import "BJRect.h"

@implementation BJRect

@synthesize m_x, m_y, m_size, m_view, m_layer;

+(BJRect *)initWithSize: (int) size initWithX:(int) x initWithY:(int) y initWithView:(UIView *)view {
    BJRect * bjrect = [BJRect new];
    bjrect.m_view = view;
    bjrect.m_size = size;
    bjrect.m_x = x;
    bjrect.m_y = y;
    bjrect.m_layer = nil;
    return bjrect;
}

-(void)draw {
    [self.m_layer removeFromSuperlayer];
    UIBezierPath * path = [UIBezierPath bezierPath];
    CGPoint startPoint = CGPointMake(self.m_x * self.m_size, self.m_y * self.m_size);
    CGPoint endPoint = CGPointMake(startPoint.x + self.m_size, startPoint.y);
    [path moveToPoint:startPoint];
    [path addLineToPoint:endPoint];
    endPoint = CGPointMake(startPoint.x + self.m_size, startPoint.y + self.m_size);
    [path addLineToPoint:endPoint];
    endPoint = CGPointMake(startPoint.x, startPoint.y + self.m_size);
    [path addLineToPoint:endPoint];
    [path closePath];
    
    
    CAShapeLayer * _layer = [CAShapeLayer layer];
    _layer.fillColor = [UIColor colorWithRed:0 green:0 blue:0 alpha:0.2].CGColor;
    _layer.strokeColor = [UIColor colorWithRed:1 green:0 blue:0 alpha:0.5].CGColor;
    _layer.frame = self.m_view.frame;
    _layer.lineWidth = 1;
    
    _layer.path = path.CGPath;
    self.m_layer = _layer;
    [self.m_view.layer addSublayer:_layer];
}

-(void)remove {
    [self.m_layer removeFromSuperlayer];
}
@end
