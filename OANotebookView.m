//
//  OANotebookView.m
//  Notebook
//
//  Created by afrael on 7/13/11.
//  Copyright 2011 Obelisk Apps. All rights reserved.
//

#import "OANotebookView.h"

@implementation OANotebookView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}


- (void)drawRect:(CGRect)rect
{        
    CGContextRef ctx = UIGraphicsGetCurrentContext();
    CGContextSetFillColorWithColor(ctx, [UIColor blackColor].CGColor);
    CGContextFillRect(ctx, self.bounds);
    UIBezierPath *path = [UIBezierPath bezierPathWithRoundedRect:self.bounds 
                                               byRoundingCorners:UIRectCornerAllCorners     
                                                     cornerRadii:CGSizeMake(8.0f, 8.0f)];
    [path addClip];
    [self setBackgroundTexture];
    [self drawHorizonalBlueLines: ctx];
    [self drawVerticalMarginLine];
    [super drawRect:rect];
}

- (UIImage *) patternImageOfSize:(CGSize) size{
    UIImage *image = [UIImage imageNamed:@"paper"];
    return image;
}

- (void) setBackgroundTexture{
    UIImage *paperPatternImage = [self patternImageOfSize:CGSizeMake(32.0, 32.0)];
    [[UIColor colorWithPatternImage:paperPatternImage] setFill];
    UIBezierPath *path = [UIBezierPath bezierPathWithRect:self.bounds];
    [path fill];
}

- (void) drawHorizonalBlueLines: (CGContextRef) ctx{
    CGContextSaveGState(ctx);
    CGRect screenRect = [[UIScreen mainScreen] bounds];
    CGFloat screenWidth = screenRect.size.width;    
    screenWidth -= 10;
    UIColor *lineColor = [UIColor colorWithRed:0/255.0 
                                         green:124.0/255.0
                                          blue:255.0/255.0 
                                         alpha:0.5];
    UIBezierPath *path = [UIBezierPath bezierPath];
    [path moveToPoint:CGPointMake(10, 40.5)];
    [path addLineToPoint:CGPointMake(screenWidth, 40.5)];
    [path setLineWidth:1.0];
    [lineColor setStroke];
    [path stroke];
    for (int i = 0; i < 9; i++) {
        CGContextTranslateCTM(ctx, 0.0, (40 + i));
        [path stroke];
    }
    CGContextRestoreGState(ctx);
}

- (void) drawVerticalMarginLine{
    CGRect screenRect = [[UIScreen mainScreen] bounds];
    CGFloat screenHeight = screenRect.size.height;    
    screenHeight -= 2;
    UIColor *lineColor = [UIColor colorWithRed:255.0/255.0 
                                         green:142.0/255.0
                                          blue:142.0/255.0 
                                         alpha:0.5];
    UIBezierPath *path = [UIBezierPath bezierPath];
    [path moveToPoint:CGPointMake(40.5, 2.0)];
    [path addLineToPoint:CGPointMake(40.5, (screenHeight -2))];
    [path setLineWidth:1.0];
    [lineColor setStroke];
    [path stroke];
    [path moveToPoint:CGPointMake(42.5, 2.0)];
    [path addLineToPoint:CGPointMake(42.5, (screenHeight -2))];
    [path stroke];
}

@end
