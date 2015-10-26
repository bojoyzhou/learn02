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

-(void) initWithX:(int)x initWithY:(int)y initWithSize:(int)size initWithView:(UIView *)view{
    self.m_x = x;
    self.m_y = y;
    
    BJRect * r1 = [BJRect initWithSize:size initWithX:0 initWithY:0 initWithView:view];
    BJRect * r2 = [BJRect initWithSize:size initWithX:0 initWithY:1 initWithView:view];
    BJRect * r3 = [BJRect initWithSize:size initWithX:1 initWithY:0 initWithView:view];
    BJRect * r4 = [BJRect initWithSize:size initWithX:1 initWithY:1 initWithView:view];
    self.m_rects = [NSArray arrayWithObjects:r1, r2, r3, r4, nil];
    [self moveToX:x moveToY:y];
}

@end
