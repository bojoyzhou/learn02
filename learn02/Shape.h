//
//  Shape.h
//  learn02
//
//  Created by 周明波 on 15/10/25.
//  Copyright © 2015年 周明波. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "BJRect.h"

@interface Shape : NSObject

@property int m_x, m_y, m_status;
@property NSArray * m_rects;
-(void)initWithX:(int)x initWithY:(int)y initWithSize:(int)size initWithView:(UIView *)view;
-(void)initWithSize:(int)size initWithView:(UIView *)view;
-(void)draw;
-(BOOL)moveUp;
-(BOOL)moveDown;
-(BOOL)moveLeft;
-(BOOL)moveRight;
-(BOOL)moveToX:(int)x moveToY:(int)y;
-(BOOL)deformation;

@end
