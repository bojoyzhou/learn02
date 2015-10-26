//
//  BJRect.h
//  learn02
//
//  Created by 周明波 on 15/10/25.
//  Copyright © 2015年 周明波. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <SpriteKit/SpriteKit.h>

@interface BJRect : NSObject

@property int m_x, m_y, m_size;
@property UIView *m_view;
@property CAShapeLayer *m_layer;

+(BJRect *)initWithSize: (int) size initWithX:(int) x initWithY:(int) y initWithView:(UIView *)view;
-(void)draw;
-(void)remove;

@end
