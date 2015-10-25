//
//  LineGround.h
//  learn02
//
//  Created by 周明波 on 15/10/25.
//  Copyright © 2015年 周明波. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <SpriteKit/SpriteKit.h>

@interface LineGround : NSObject

+(LineGround *) initWithSize:(int)size initWithView:(UIView *)view;
-(void)draw;

@end
