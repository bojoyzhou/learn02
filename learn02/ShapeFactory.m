//
//  ShapeFactory.m
//  learn02
//
//  Created by 周明波 on 15/10/26.
//  Copyright © 2015年 周明波. All rights reserved.
//

#import "ShapeFactory.h"
#import "Shape1.h"
#import "Shape2.h"
#import "Shape3.h"
#import "Shape4.h"
#import "Shape5.h"

static int s_size, s_width, s_height;
static UIView * s_view;
static ShapeFactory * s_self = nil;

@implementation ShapeFactory
+(ShapeFactory *)initWithWidth:(int)width initWithHeight:(int)height initWithSize:(int)size initWithView:(UIView *)view {
    if(s_self != nil){
    	return s_self;
    }

    s_size = size;
    s_width = width;
    s_height = height;
    s_view = view;
    s_self = [ShapeFactory new];
    return s_self;
}
-(Shape *)getInstance:(NSString *)classname {
    Shape * shape = [NSClassFromString(classname) new];
    [shape initWithSize:s_size initWithView:s_view];
    return shape;
}
@end
