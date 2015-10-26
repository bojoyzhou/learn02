//
//  LineGround.m
//  learn02
//
//  Created by 周明波 on 15/10/25.
//  Copyright © 2015年 周明波. All rights reserved.
//

#import "LineGround.h"
#import "BJRect.h"


@implementation LineGround

@synthesize m_view;

static int s_size = 0, s_width = 0, s_height = 0, s_column = 0, s_rows = 0;
static bool pixmap[15][20];

+(LineGround *) initWithSize:(int)size initWithView:(UIView *)view initWithWidth:(int)width initWithHeight:(int)height {
    LineGround * lg = [LineGround new];
    lg.m_view = view;
    
    s_size = size;
    s_width = width;
    s_height = height;
    s_column = width/size;
    s_rows = height/size;
    memset(pixmap, 0, sizeof(pixmap));
    return lg;
}

+(BOOL) canLocate:(Shape *)shape {
    for (BJRect * r in shape.m_rects) {
        if([LineGround canLocateRect:r] == NO) {
            return NO;
        }
    }
    return YES;
}

+(BOOL) canLocateRect:(BJRect *)r {
    if(r.m_x < 0 || r.m_x >= s_column){
        return NO;
    }
    if(r.m_y >= s_rows){
        return NO;
    }
    int x, y;
    x = r.m_x;
    y = r.m_y;
    if(pixmap[x][y]){
        return NO;
    }
    return YES;
}

+(BOOL)locateShape:(Shape *)shape {
    int x, y;
    for (BJRect *r in shape.m_rects) {
        x = r.m_x;
        y = r.m_y;
        pixmap[x][y] = 1;
    }
    return YES;
}

-(void)draw {
    int i = 0;
    int y = 0;
    int det = s_size;
    CGPoint startPoint, endPoint;
    for (i = 0; i <= 10; i++) {
        startPoint = CGPointMake(i * det, 0);
        endPoint = CGPointMake(i * det, s_height);
        [self makeLine:startPoint endWith:endPoint];
    }
    for (y = s_height; y >= 0; y -= det) {
        startPoint = CGPointMake(0, y);
        endPoint = CGPointMake(s_width, y);
        [self makeLine:startPoint endWith:endPoint];
    }
}

-(void)makeLine:(CGPoint) startPoint endWith:(CGPoint) endPoint {
    CAShapeLayer * layer = [CAShapeLayer layer];
    layer.fillColor = [UIColor colorWithRed:0 green:0 blue:0 alpha:0.2].CGColor;
    layer.strokeColor = [UIColor colorWithRed:1 green:0 blue:0 alpha:0.5].CGColor;
    layer.frame = self.m_view.frame;
    layer.lineWidth = 1;
    
    UIBezierPath * path = [UIBezierPath bezierPath];
    [path moveToPoint:startPoint];
    [path addLineToPoint:endPoint];
    
    layer.path = path.CGPath;
    
    [self.m_view.layer addSublayer:layer];
    NSLog(@"add sub layer startPoint [%f, %f] endPoint [%f, %f]", startPoint.x, startPoint.y, endPoint.x, endPoint.y);
}
@end
