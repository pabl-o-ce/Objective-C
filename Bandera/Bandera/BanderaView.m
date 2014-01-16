//
//  BanderaView.m
//  Bandera
//
//  Created by Pablo Roberto Carrera Estrada on 10/15/13.
//  Copyright (c) 2013 Pablo Roberto Carrera Estrada. All rights reserved.
//

#import "BanderaView.h"

@implementation BanderaView

-(void)setNombrePais:(NSString *)Pais
{
    _nombrePais = Pais;
    [self setNeedsDisplay];
}

#pragma mark - Initialization

-(void)setup
{
    
}

- (void)awakeFromNib
{
    [self setup];
}

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    [self setup];
    return self;
}


// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
    UIBezierPath *roundedRect = [UIBezierPath bezierPathWithRoundedRect:self.bounds cornerRadius:12.0];
    [roundedRect addClip];
    [[UIColor clearColor] setFill];
    UIRectFill(self.bounds);
    roundedRect.lineWidth=2.0;
    [[UIColor greenColor] setStroke];
    [roundedRect stroke];
    [self display];
    //NSString *imgName = [NSString stringWithFormat:@"%@.png",[self setNombrePais:@"Canada"]];
    //NSString *imgName = [NSString stringWithFormat:@"Brazil.png"];
    //[[UIImage imageNamed:self.nombrePais] drawInRect:self.bounds];
}
-(void)display{
    //self.bd = [UIImage imageNamed:[NSString stringWithFormat:@"%@.png",[self nombrePais]]];
    self.bd = [UIImage imageNamed:[NSString stringWithFormat:@"%@.png",self.nombrePais]];
    [self.bd drawInRect:self.bounds];
}

@end
