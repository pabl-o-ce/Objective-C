//
//  SheepsView.m
//  SheepGame
//
//  Created by Pablo Roberto Carrera Estrada on 12/8/13.
//  Copyright (c) 2013 Pablo Roberto Carrera Estrada. All rights reserved.
//

#import "SheepsView.h"

@implementation SheepsView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.*/
- (void)drawRect:(CGRect)rect
{
    // Drawing code
    [self setMainBackground];
    
}
-(void)setMainBackground
{
  UIImage *background = [UIImage imageNamed:@"Starry-Night.png"];
  CGRect screenBounds = [[UIScreen mainScreen] bounds];
  
  [background drawInRect:CGRectMake(screenBounds.origin.x,
  screenBounds.origin.y,screenBounds.size.width,screenBounds.size.height)];
}

@end
