//
//  BJRect.m
//  learn02
//
//  Created by 周明波 on 15/10/25.
//  Copyright © 2015年 周明波. All rights reserved.
//

#import "BJRect.h"

@implementation BJRect

@synthesize x, y, size, layer;

+(BJRect *)initWithSize: (int) size initWithX:(int) x initWithY:(int) y initWithLayer:(CAShapeLayer *)layer {
    BJRect * bjrect = [BJRect new];
    bjrect.layer = layer;
    bjrect.size = size;
    bjrect.x = x;
    bjrect.y = y;
    return bjrect;
}

-(void)draw {
    
    NSLog(@"bjrect draw");
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
    self.layer.path = path.CGPath;
}

@end
