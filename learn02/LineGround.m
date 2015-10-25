//
//  LineGround.m
//  learn02
//
//  Created by 周明波 on 15/10/25.
//  Copyright © 2015年 周明波. All rights reserved.
//

#import "LineGround.h"
#import "BJRect.h"
static int _size, _width, _height, _column, _rows;
@implementation LineGround

@synthesize view;

+(LineGround *) initWithSize:(int)size initWithView:(UIView *)view initWithWidth:(int)width initWithHeight:(int)height {
    LineGround * lg = [LineGround new];
    lg.view = view;
    
    _size = size;
    _width = width;
    _height = height;
    _column = width/size;
    _rows = height/size;
    return lg;
}

+(BOOL) canLocate:(Shape *)s {
    for (BJRect * r in s.rects) {
        if([LineGround canLocateRect:r] == NO) {
            return NO;
        }
    }
    return YES;
}

+(BOOL) canLocateRect:(BJRect *)r {
    if(r.x < 0 || r.x >= _column){
        return NO;
    }
    if(r.y < 0 || r.y >= _rows){
        return NO;
    }
    return YES;
}

-(void)draw {
    int i = 0;
    int y = 0;
    int det = _size;
    CGPoint startPoint, endPoint;
    for (i = 0; i <= 10; i++) {
        startPoint = CGPointMake(i * det, 0);
        endPoint = CGPointMake(i * det, _height);
        [self makeLine:startPoint endWith:endPoint];
    }
    for (y = self.height; y >= 0; y -= det) {
        startPoint = CGPointMake(0, y);
        endPoint = CGPointMake(_width, y);
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
