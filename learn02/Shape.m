//
//  Shape.m
//  learn02
//
//  Created by 周明波 on 15/10/25.
//  Copyright © 2015年 周明波. All rights reserved.
//

#import "Shape.h"
#import "LineGround.h"

@implementation Shape

@synthesize m_x, m_y, m_rects;


-(void)initWithX:(int)x initWithY:(int)y initWithSize:(int)size initWithView:(UIView *)view{
    
}
-(void)initWithSize:(int)size initWithView:(UIView *)view {
    [self initWithX:0 initWithY:0 initWithSize:size initWithView:view];
}
-(void)draw {
    for (BJRect * r in self.m_rects) {
        [r draw];
    }
}

-(BOOL)moveUp {
    for (BJRect * r in self.m_rects) {
        r.m_y--;
    }
    if([LineGround canLocate:self] == NO){
        for (BJRect * r in self.m_rects) {
            r.m_y++;
        }
        return NO;
    }else{
        for (BJRect * r in self.m_rects) {
            [r draw];
        }
        return YES;
    }
}
-(BOOL)moveDown {
    for (BJRect * r in self.m_rects) {
        r.m_y++;
    }
    if([LineGround canLocate:self] == NO){
        for (BJRect * r in self.m_rects) {
            r.m_y--;
        }
        return NO;
    }else{
        for (BJRect * r in self.m_rects) {
            [r draw];
        }
        return YES;
    }
}
-(BOOL)moveLeft {
    for (BJRect * r in self.m_rects) {
        r.m_x--;
    }
    if([LineGround canLocate:self] == NO){
        for (BJRect * r in self.m_rects) {
            r.m_x++;
        }
        return NO;
    }else{
        for (BJRect * r in self.m_rects) {
            [r draw];
        }
        return YES;
    }
}
-(BOOL)moveRight {
    for (BJRect * r in self.m_rects) {
        r.m_x++;
    }
    if([LineGround canLocate:self] == NO){
        for (BJRect * r in self.m_rects) {
            r.m_x--;
        }
        return NO;
    }else{
        for (BJRect * r in self.m_rects) {
            [r draw];
        }
        return YES;
    }
}
-(BOOL)moveToX:(int)x moveToY:(int)y{
    for (BJRect * r in self.m_rects) {
        r.m_x += x;
        r.m_y += y;
    }
    if([LineGround canLocate:self] == NO){
        for (BJRect * r in self.m_rects) {
            r.m_x -= x;
            r.m_y -= y;
        }
        return NO;
    }else{
        for (BJRect * r in self.m_rects) {
            [r draw];
        }
        return YES;
    }

}
-(BOOL)deformation {
    return NO;
}

@end
