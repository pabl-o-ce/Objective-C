//
//  Imagen.m
//  Bandera
//
//  Created by Pablo Roberto Carrera Estrada on 10/16/13.
//  Copyright (c) 2013 Pablo Roberto Carrera Estrada. All rights reserved.
//

#import "Imagen.h"

@implementation Imagen
-(void)setAdivino:(BOOL)adivino{
    _adivino=adivino;
    [self setFoto];
    [self setNeedsDisplay];
}
-(void)setFoto{
    if (self.adivino==TRUE) {
        _foto=@"sip.png";
    }else _foto=@"no.png";
}

// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
    [[UIImage imageNamed:self.foto] drawInRect:self.bounds];
}


#pragma mark - Initialization

- (void)setup
{
    // do initialization here
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

@end
