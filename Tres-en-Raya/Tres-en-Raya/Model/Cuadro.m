//
//  Cuadro.m
//  Tres-en-Raya
//
//  Created by Pablo Roberto Carrera Estrada on 9/14/13.
//  Copyright (c) 2013 Pablo Roberto Carrera Estrada. All rights reserved.
//

#import "Cuadro.h"

@implementation Cuadro
-(id)init{
    self = [super init];
    if(self){
        _contenido=nil;
        _selected=NO;
        _sinjogar=YES;
        _simbolo = [[Simbolo alloc]init];
    }
    return self;
}
-(void)setCuadroWithJogador:(int)quejogador{
    if(quejogador==1){
        _contenido = _simbolo.simboloIos;
        _selected = YES;
        _sinjogar = NO;
    }else if(quejogador==0){
        _contenido = _simbolo.simboloJogador;
        _selected = YES;
        _sinjogar = NO;
    }
}
-(void)setCuadroVacio{
    _contenido = _simbolo.simboloNada;
    _selected = NO;
    _sinjogar= YES;
}
@end
