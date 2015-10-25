//
//  Shape1.m
//  learn02
//
//  Created by 周明波 on 15/10/25.
//  Copyright © 2015年 周明波. All rights reserved.
//

#import "Shape1.h"
#import "LineGround.h"

@implementation Shape1

@synthesize x, y, rects;

-(void) initWithX:(int)_x initWithY:(int)_y initWithSize:(int)size initWithView:(UIView *)view{
    self.x = _x;
    self.y = _y;
    
    BJRect * r1 = [BJRect initWithSize:size initWithX:0 initWithY:0 initWithView:view];
    BJRect * r2 = [BJRect initWithSize:size initWithX:0 initWithY:1 initWithView:view];
    BJRect * r3 = [BJRect initWithSize:size initWithX:1 initWithY:0 initWithView:view];
    BJRect * r4 = [BJRect initWithSize:size initWithX:1 initWithY:1 initWithView:view];
    self.rects = [NSArray arrayWithObjects:r1, r2, r3, r4, nil];
}

-(void)draw {
    for (BJRect * r in self.rects) {
        [r draw];
    }
}

-(void)moveUp {
    if([LineGround canLocate:self] == NO){
        for (BJRect * r in self.rects) {
            r.y++;
        }
    }else{
        for (BJRect * r in self.rects) {
            [r draw];
        }
    }
}
-(void)moveDown {
    if([LineGround canLocate:self] == NO){
        for (BJRect * r in self.rects) {
            r.y--;
        }
    }else{
        for (BJRect * r in self.rects) {
            [r draw];
        }
    }
}
-(void)moveLeft {
    if([LineGround canLocate:self] == NO){
        for (BJRect * r in self.rects) {
            r.x--;
        }
    }else{
        for (BJRect * r in self.rects) {
            [r draw];
        }
    }
}
-(void)moveRight {
    if([LineGround canLocate:self] == NO){
        for (BJRect * r in self.rects) {
            r.x++;
        }
    }else{
        for (BJRect * r in self.rects) {
            [r draw];
        }
    }
}

@end
