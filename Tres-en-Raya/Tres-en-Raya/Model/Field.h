//
//  Field.h
//  Tres-en-Raya
//
//  Created by Pablo Roberto Carrera Estrada on 9/13/13.
//  Copyright (c) 2013 Pablo Roberto Carrera Estrada. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Cuadro.h"
#import "Simbolo.h"
@interface Field : NSObject
@property (strong, nonatomic) Cuadro *cuadro1;
@property (strong, nonatomic) Cuadro *cuadro2;
@property (strong, nonatomic) Cuadro *cuadro3;
@property (strong, nonatomic) Cuadro *cuadro4;
@property (strong, nonatomic) Cuadro *cuadro5;
@property (strong, nonatomic) Cuadro *cuadro6;
@property (strong, nonatomic) Cuadro *cuadro7;
@property (strong, nonatomic) Cuadro *cuadro8;
@property (strong, nonatomic) Cuadro *cuadro9;

-(BOOL)comparacionJWithCuadroN:(Cuadro*)cuadrox AndCuadroM:(Cuadro*)cuadroy AndCuadroO:(Cuadro*)cuadroz;
-(BOOL)comparacionIWithCuadroN:(Cuadro*)cuadrox AndCuadroM:(Cuadro*)cuadroy AndCuadroO:(Cuadro*)cuadroz;
-(void)reset;
-(BOOL)cuadroSelectedWithPosicion:(int)posicion;
-(BOOL)cuadroSinUsarWithPosicion:(int)posicion;
-(BOOL)comparacionJDosWithCuadroN:(Cuadro*)cuadrox AndCuadroM:(Cuadro*)cuadroy;
-(BOOL)cuadroEsDeJogador:(int)posicion;
-(BOOL)cuadroEsDeIOS:(int)posicion;
@end
