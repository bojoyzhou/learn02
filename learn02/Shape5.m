//
//  Shape5.m
//  learn02
//
//  Created by 周明波 on 15/10/26.
//  Copyright © 2015年 周明波. All rights reserved.
//

#import "Shape5.h"

@implementation Shape5

//0...
//12..
//.3..
//....

//.03.
//12..
//....
//....

-(void) initWithX:(int)x initWithY:(int)y initWithSize:(int)size initWithView:(UIView *)view{
    self.m_x = x;
    self.m_y = y;
    
    BJRect * r1 = [BJRect initWithSize:size initWithX:0 initWithY:0 initWithView:view];
    BJRect * r2 = [BJRect initWithSize:size initWithX:0 initWithY:1 initWithView:view];
    BJRect * r3 = [BJRect initWithSize:size initWithX:1 initWithY:1 initWithView:view];
    BJRect * r4 = [BJRect initWithSize:size initWithX:1 initWithY:2 initWithView:view];
    self.m_rects = [NSArray arrayWithObjects:r1, r2, r3, r4, nil];
    [self moveToX:x moveToY:y];
}

-(BOOL)deformation {
    BJRect *r;
    if(self.m_status == 0){
        r = self.m_rects[0];
        r.m_x += 1;
        r = self.m_rects[3];
        r.m_x += 1;
        r.m_y -= 2;
        self.m_status = 1;
    }else if(self.m_status == 1){
        r = self.m_rects[0];
        r.m_x -= 1;
        r = self.m_rects[3];
        r.m_x -= 1;
        r.m_y += 2;
        self.m_status = 0;
    }
    [self draw];
    return YES;
}

@end
