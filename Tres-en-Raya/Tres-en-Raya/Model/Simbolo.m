//
//  Simbolo.m
//  Tres-en-Raya
//
//  Created by Pablo Roberto Carrera Estrada on 9/14/13.
//  Copyright (c) 2013 Pablo Roberto Carrera Estrada. All rights reserved.
//

#import "Simbolo.h"

@implementation Simbolo
-(id)init{
    self = [super init];
    if(self){
    _simboloJogador = @"☤";
    _simboloIos = @"⚛";
    _simboloNada = @"";
    }
    return self;
}
@end
