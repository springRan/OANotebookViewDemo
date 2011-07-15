//
//  OANotebookView.h
//  Notebook
//
//  Created by afrael on 7/13/11.
//  Copyright 2011 Obelisk Apps. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <QuartzCore/QuartzCore.h>

@interface OANotebookView : UIView{
    
}

- (UIImage *) patternImageOfSize:(CGSize) size;
- (void) setBackgroundTexture;
- (void) drawHorizonalBlueLines: (CGContextRef) ctx;
- (void) drawVerticalMarginLine: (CGContextRef) ctx;

@end
