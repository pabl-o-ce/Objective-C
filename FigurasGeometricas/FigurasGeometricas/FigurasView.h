//
//  FigurasView.h
//  FigurasGeometricas
//
//  Created by Pablo Roberto Carrera Estrada on 9/28/13.
//  Copyright (c) 2013 Pablo Roberto Carrera Estrada. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface FigurasView : UIView
@property (nonatomic)int tipoFigura;
@property (strong, nonatomic)UIColor *colorFondo;
@property (strong, nonatomic)UIColor *colorRelleno;
@property (strong, nonatomic)UIColor *colorBorde;
@property (nonatomic)UIBezierPath *path;

-(void)setColorFondos:(int)color;
-(void)setColorRellenos:(int)color;
-(void)setColorBordes:(int)color;
-(void)setTipoFigura:(int)tipoFigura;
-(void)figura;
@end
