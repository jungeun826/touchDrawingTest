//
//  DrawingView.m
//  touchDrawingTest
//
//  Created by SDT-1 on 2014. 1. 8..
//  Copyright (c) 2014년 SDT-1. All rights reserved.
//

#import "DrawingView.h"

@implementation DrawingView{
    UIBezierPath *myPath;
}

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        self.backgroundColor = [UIColor whiteColor];
        myPath = [[UIBezierPath alloc]init];
        myPath.lineWidth = 10.0f;
        [[UIColor blackColor] setStroke];
    }
    return self;
}
-(void)drawRect:(CGRect)rect{
    [myPath stroke];
}

#pragma mark - Touch Method
-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event{
    UITouch *mytouch = [[touches allObjects] objectAtIndex:0];
    CGPoint point = [mytouch locationInView:self];
    [myPath moveToPoint:point];
    NSLog(@"touch began : %@", NSStringFromCGPoint(point));
}
-(void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event{
    UITouch *mytouch = [[touches allObjects] objectAtIndex:0];
    CGPoint point = [mytouch locationInView:self];
    [myPath addLineToPoint:point];
    [self setNeedsDisplay];
    //NSLog(@"touch moved : %@", NSStringFromCGPoint(point));
}
-(void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event{
    
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

@end
