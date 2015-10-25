//
//  Shape1.h
//  learn02
//
//  Created by 周明波 on 15/10/25.
//  Copyright © 2015年 周明波. All rights reserved.
//

#import "Shape.h"
#import "BJRect.h"

@interface Shape1 : Shape

@property int x, y;
@property NSArray * rects;

-(void) initWithX:(int)_x initWithY:(int)_y initWithSize:(int)size initWithView:(UIView *)view;
-(void) draw;

@end
