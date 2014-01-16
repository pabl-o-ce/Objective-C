//
//  Field.m
//  Tres-en-Raya
//
//  Created by Pablo Roberto Carrera Estrada on 9/13/13.
//  Copyright (c) 2013 Pablo Roberto Carrera Estrada. All rights reserved.
//

#import "Field.h"
@interface Field()
@end

@implementation Field

-(id)init{
    self = [super init];
    if(self){
        _cuadro1 = [[Cuadro alloc]init];
        _cuadro2 = [[Cuadro alloc]init];
        _cuadro3 = [[Cuadro alloc]init];
        _cuadro4 = [[Cuadro alloc]init];
        _cuadro5 = [[Cuadro alloc]init];
        _cuadro6 = [[Cuadro alloc]init];
        _cuadro7 = [[Cuadro alloc]init];
        _cuadro8 = [[Cuadro alloc]init];
        _cuadro9 = [[Cuadro alloc]init];
    }
    return self;
}
-(BOOL)comparacionJWithCuadroN:(Cuadro *)cuadrox AndCuadroM:(Cuadro *)cuadroy AndCuadroO:(Cuadro*)cuadroz{
    if(cuadrox.selected == YES && cuadroy.selected == YES && cuadroz.selected == YES){
        if([cuadrox.contenido isEqualToString: @"☤"]){
            if ([cuadrox.contenido isEqualToString:cuadroy.contenido]&&[cuadrox.contenido isEqualToString:cuadroz.contenido]) {
                return YES;
            }else {
                return NO;
            }
        }
    }
    return NO;
}
-(BOOL)comparacionIWithCuadroN:(Cuadro *)cuadrox AndCuadroM:(Cuadro *)cuadroy AndCuadroO:(Cuadro*)cuadroz{
    if(cuadrox.selected == YES && cuadroy.selected == YES && cuadroz.selected == YES){
        if([cuadrox.contenido isEqualToString: @"⚛"]){
            if ([cuadrox.contenido isEqualToString:cuadroy.contenido]&&[cuadrox.contenido isEqualToString:cuadroz.contenido]) {
                return YES;
            }else {
                return NO;
            }
        }
    }
    return NO;
}
-(void)reset{
    [_cuadro1 setCuadroVacio];
    [_cuadro2 setCuadroVacio];
    [_cuadro3 setCuadroVacio];
    [_cuadro4 setCuadroVacio];
    [_cuadro5 setCuadroVacio];
    [_cuadro6 setCuadroVacio];
    [_cuadro7 setCuadroVacio];
    [_cuadro8 setCuadroVacio];
    [_cuadro9 setCuadroVacio];
    
}
-(BOOL)cuadroSelectedWithPosicion:(int)posicion{
    BOOL select;
    switch (posicion) {
        case 1:
            select=_cuadro1.selected;
            break;
        case 2:
            select=_cuadro2.selected;
            break;
        case 3:
            select=_cuadro3.selected;
            break;
        case 4:
            select=_cuadro4.selected;
            break;
        case 5:
            select=_cuadro5.selected;
            break;
        case 6:
            select=_cuadro6.selected;
            break;
        case 7:
            select=_cuadro7.selected;
            break;
        case 8:
            select=_cuadro8.selected;
            break;
        case 9:
            select=_cuadro9.selected;
            break;
    }
    return select;
}
-(BOOL)cuadroSinUsarWithPosicion:(int)posicion{
    BOOL sinusar;
    switch (posicion) {
        case 1:
            sinusar=_cuadro1.sinjogar;
            break;
        case 2:
            sinusar=_cuadro2.sinjogar;
            break;
        case 3:
            sinusar=_cuadro3.sinjogar;
            break;
        case 4:
            sinusar=_cuadro4.sinjogar;
            break;
        case 5:
            sinusar=_cuadro5.sinjogar;
            break;
        case 6:
            sinusar=_cuadro6.sinjogar;
            break;
        case 7:
            sinusar=_cuadro7.sinjogar;
            break;
        case 8:
            sinusar=_cuadro8.sinjogar;
            break;
        case 9:
            sinusar=_cuadro9.sinjogar;
            break;
    }
    return sinusar;
}
-(BOOL)comparacionJDosWithCuadroN:(Cuadro *)cuadrox AndCuadroM:(Cuadro *)cuadroy{
    if(cuadrox.selected == YES && cuadroy.selected == YES){
        if([cuadrox.contenido isEqualToString: @"☤"]){
            if ([cuadrox.contenido isEqualToString:cuadroy.contenido]) {
                return YES;
            }else {
                return NO;
            }
        }
    }
    return NO;
}
-(BOOL)cuadroEsDeJogador:(int)posicion{
    BOOL esJogador;
    switch (posicion) {
        case 1:
            if ([_cuadro1.contenido isEqualToString: @"☤"]) {
                esJogador=YES;
            }else{
                esJogador = NO;
            }
            break;
        case 2:
            if ([_cuadro2.contenido isEqualToString: @"☤"]) {
                esJogador=YES;
            }else{
                esJogador = NO;
            }
            break;
        case 3:
            if ([_cuadro3.contenido isEqualToString: @"☤"]) {
                esJogador=YES;
            }else{
                esJogador = NO;
            }
            break;
        case 4:
            if ([_cuadro4.contenido isEqualToString: @"☤"]) {
                esJogador=YES;
            }else{
                esJogador = NO;
            }
            break;
        case 5:
            if ([_cuadro5.contenido isEqualToString: @"☤"]) {
                esJogador=YES;
            }else{
                esJogador = NO;
            }
            break;
        case 6:
            if ([_cuadro6.contenido isEqualToString: @"☤"]) {
                esJogador=YES;
            }else{
                esJogador = NO;
            }
            break;
        case 7:
            if ([_cuadro7.contenido isEqualToString: @"☤"]) {
                esJogador=YES;
            }else{
                esJogador = NO;
            }
            break;
        case 8:
            if ([_cuadro8.contenido isEqualToString: @"☤"]) {
                esJogador=YES;
            }else{
                esJogador = NO;
            }
            break;
        case 9:
            if ([_cuadro9.contenido isEqualToString: @"☤"]) {
                esJogador=YES;
            }else{
                esJogador = NO;
            }
            break;
    }
    return esJogador;
}
-(BOOL)cuadroEsDeIOS:(int)posicion{
    BOOL esIOS;
    switch (posicion) {
        case 1:
            if ([_cuadro1.contenido isEqualToString: @"⚛"]) {
                esIOS=YES;
            }else{
                esIOS = NO;
            }
            break;
        case 2:
            if ([_cuadro2.contenido isEqualToString: @"⚛"]) {
                esIOS=YES;
            }else{
                esIOS = NO;
            }
            break;
        case 3:
            if ([_cuadro3.contenido isEqualToString: @"⚛"]) {
                esIOS=YES;
            }else{
                esIOS = NO;
            }
            break;
        case 4:
            if ([_cuadro4.contenido isEqualToString: @"⚛"]) {
                esIOS=YES;
            }else{
                esIOS = NO;
            }
            break;
        case 5:
            if ([_cuadro5.contenido isEqualToString: @"⚛"]) {
                esIOS=YES;
            }else{
                esIOS = NO;
            }
            break;
        case 6:
            if ([_cuadro6.contenido isEqualToString: @"⚛"]) {
                esIOS=YES;
            }else{
                esIOS = NO;
            }
            break;
        case 7:
            if ([_cuadro7.contenido isEqualToString: @"⚛"]) {
                esIOS=YES;
            }else{
                esIOS = NO;
            }
            break;
        case 8:
            if ([_cuadro8.contenido isEqualToString: @"⚛"]) {
                esIOS=YES;
            }else{
                esIOS = NO;
            }
            break;
        case 9:
            if ([_cuadro9.contenido isEqualToString: @"⚛"]) {
                esIOS=YES;
            }else{
                esIOS = NO;
            }
            break;
    }
    return esIOS;
}

@end
