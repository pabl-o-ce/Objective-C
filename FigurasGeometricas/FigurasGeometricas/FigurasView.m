//
//  FigurasView.m
//  FigurasGeometricas
//
//  Created by Pablo Roberto Carrera Estrada on 9/28/13.
//  Copyright (c) 2013 Pablo Roberto Carrera Estrada. All rights reserved.
//

#import "FigurasView.h"

@implementation FigurasView
-(UIBezierPath *)path{
    if(!_path) _path=[[UIBezierPath alloc]init];
    return _path;
}
-(void)setTipoFigura:(int)tipoFigura{
    _tipoFigura=tipoFigura;
    [self setNeedsDisplay];
}
-(void)setColorFondos:(int)color {
    switch (color) {
        case 0:
            _colorFondo = [UIColor colorWithRed:255/255.0f green:256/255.0f blue:255/255.0f alpha:1.0f];
            break;
        case 1:
            _colorFondo=[UIColor colorWithRed:0/255.0f green:1/255.0f blue:0/255.0f alpha:1.0f];
            break;
        case 2:
            _colorFondo=[UIColor colorWithRed:160/255.0f green:236/255.0f blue:239/255.0f alpha:1.0f];
            break;
        case 3:
            _colorFondo=[UIColor colorWithRed:255/255.0f green:246/255.0f blue:0/255.0f alpha:1.0f];
            break;
        default:
            _colorFondo=[UIColor colorWithRed:255/255.0f green:256/255.0f blue:255/255.0f alpha:1.0f];
            break;
    }
    [self setNeedsDisplay];
}
-(void)setColorRellenos:(int)color {
    switch (color) {
        case 0:
            _colorRelleno=[UIColor colorWithRed:50/255.0f green:89/255.0f blue:218/255.0f alpha:1.0f];
            break;
        case 1:
            _colorRelleno=[UIColor colorWithRed:64/255.0f green:245/255.0f blue:9/255.0f alpha:1.0f];
            break;
        case 2:
            _colorRelleno=[UIColor colorWithRed:255/255.0f green:1/255.0f blue:0/255.0f alpha:1.0f];
            break;
        case 3:
            _colorRelleno=[UIColor colorWithRed:149/255.0f green:52/255.0f blue:255/255.0f alpha:1.0f];
            break;
        default:
            _colorRelleno=[UIColor colorWithRed:50/255.0f green:89/255.0f blue:218/255.0f alpha:1.0f];
            break;
    }
    [self setNeedsDisplay];
}
-(void)setColorBordes:(int)color {
    switch (color) {
        case 0:
            _colorBorde=[UIColor colorWithRed:50/255.0f green:89/255.0f blue:218/255.0f alpha:1.0f];
            break;
        case 1:
            _colorBorde=[UIColor colorWithRed:64/255.0f green:245/255.0f blue:9/255.0f alpha:1.0f];
            break;
        case 2:
            _colorBorde=[UIColor colorWithRed:255/255.0f green:1/255.0f blue:0/255.0f alpha:1.0f];
            break;
        case 3:
            _colorBorde=[UIColor colorWithRed:149/255.0f green:52/255.0f blue:255/255.0f alpha:1.0f];
            break;
        default:
            _colorBorde=[UIColor colorWithRed:50/255.0f green:89/255.0f blue:218/255.0f alpha:1.0f];
            break;
    }
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
    UIBezierPath *roundedRect = [UIBezierPath bezierPathWithRoundedRect:self.bounds cornerRadius:12.0];
    [self.colorFondo setFill];
    UIRectFill(self.bounds);
    [self figura];
    
    
}
-(void)figura{
    switch (self.tipoFigura) {
        case 0:
            [self.path removeAllPoints];
            [self.path moveToPoint:CGPointMake(70, 90)];
            [self.path addLineToPoint:CGPointMake(70, 250)];
            [self.path addLineToPoint:CGPointMake(230, 250)];
            [self.path addLineToPoint:CGPointMake(230, 90)];
            [self.path closePath];
            self.path.lineWidth =3.0;
            [self.colorRelleno setFill];
            [self.colorBorde setStroke];
            [self.path fill];
            [self.path stroke];
            break;
        case 1:
            [self.path removeAllPoints];
            [self.path moveToPoint:CGPointMake(150, 90)];
            [self.path addLineToPoint:CGPointMake(70, 250)];
            [self.path addLineToPoint:CGPointMake(230, 250)];
            [self.path closePath];
            self.path.lineWidth =3.0;
            [self.colorRelleno setFill];
            [self.colorBorde setStroke];
            [self.path fill];
            [self.path stroke];
            break;
        case 2:
            [self.path removeAllPoints];
            self.path = [UIBezierPath bezierPathWithOvalInRect:CGRectMake(45, 70, 200, 200)];
            self.path.lineWidth =3.0;
            [self.colorRelleno setFill];
            [self.colorBorde setStroke];
            [self.path fill];
            [self.path stroke];
            break;
            
        default:
            [self.path removeAllPoints];
            [self.path moveToPoint:CGPointMake(70, 90)];
            [self.path addLineToPoint:CGPointMake(70, 250)];
            [self.path addLineToPoint:CGPointMake(230, 250)];
            [self.path addLineToPoint:CGPointMake(230, 90)];
            [self.path closePath];
            self.path.lineWidth =3.0;
            [self.colorRelleno setFill];
            [self.colorBorde setStroke];
            [self.path fill];
            [self.path stroke];
            break;
    }
    
    
    
}


@end
