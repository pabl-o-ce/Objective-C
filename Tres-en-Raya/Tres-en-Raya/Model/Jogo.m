//
//  Jogo.m
//  Tres-en-Raya
//
//  Created by Pablo Roberto Carrera Estrada on 9/14/13.
//  Copyright (c) 2013 Pablo Roberto Carrera Estrada. All rights reserved.
//

#import "Jogo.h"
@interface Jogo()
@end
@implementation Jogo

-(id)init{
    self = [super init];
    if(self){
        _campo = [[Field alloc]init];
        _aquienleToca = 0;
        _ganados=0;
        _perdidos=0;
        _ganoJ=NO;
        _mens=@"";
        _turnos=0;
        _movimientosJugador = [[NSMutableArray alloc]init];
        _movimientosIOS = [[NSMutableArray alloc]init];
    }
    return self;
}
-(void)setTurnos{
    _turnos++;
}
-(void)setAquienleTocaWithContador:(int)contador{
    _aquienleToca = contador%2;
}
-(void)setCampoCuadroWithNumButton:(int)posicion{
    if(_aquienleToca == 0){
        Cuadro *cuadroPorOcupar = [[Cuadro alloc]init];
        [cuadroPorOcupar setCuadroWithJogador:_aquienleToca];
        switch (posicion) {
            case 1:
                [_campo setCuadro1:cuadroPorOcupar];
                break;
            case 2:
                [_campo setCuadro2:cuadroPorOcupar];
                break;
            case 3:
                [_campo setCuadro3:cuadroPorOcupar];
                break;
            case 4:
                [_campo setCuadro4:cuadroPorOcupar];
                break;
            case 5:
                [_campo setCuadro5:cuadroPorOcupar];
                break;
            case 6:
                [_campo setCuadro6:cuadroPorOcupar];
                break;
            case 7:
                [_campo setCuadro7:cuadroPorOcupar];
                break;
            case 8:
                [_campo setCuadro8:cuadroPorOcupar];
                break;
            case 9:
                [_campo setCuadro9:cuadroPorOcupar];
                break;
                
            default:
                break;
        }
    }
    if(_aquienleToca == 1){
        Cuadro *cuadroPorOcupar = [[Cuadro alloc]init];
        [cuadroPorOcupar setCuadroWithJogador:_aquienleToca];
        switch (posicion) {
            case 1:
                [_campo setCuadro1:cuadroPorOcupar];
                break;
            case 2:
                [_campo setCuadro2:cuadroPorOcupar];
                break;
            case 3:
                [_campo setCuadro3:cuadroPorOcupar];
                break;
            case 4:
                [_campo setCuadro4:cuadroPorOcupar];
                break;
            case 5:
                [_campo setCuadro5:cuadroPorOcupar];
                break;
            case 6:
                [_campo setCuadro6:cuadroPorOcupar];
                break;
            case 7:
                [_campo setCuadro7:cuadroPorOcupar];
                break;
            case 8:
                [_campo setCuadro8:cuadroPorOcupar];
                break;
            case 9:
                [_campo setCuadro9:cuadroPorOcupar];
                break;
                
            default:
                break;
        }
    }
}
-(Cuadro*)getCuadroAtIndex:(int)index{
    Cuadro *cuadro = [[Cuadro alloc]init];
    switch (index) {
        case 1:
            cuadro = _campo.cuadro1;
            break;
        case 2:
            cuadro = _campo.cuadro2;
            break;
        case 3:
            cuadro = _campo.cuadro3;
            break;
        case 4:
            cuadro = _campo.cuadro4;
            break;
        case 5:
            cuadro = _campo.cuadro5;
            break;
        case 6:
            cuadro = _campo.cuadro6;
            break;
        case 7:
            cuadro = _campo.cuadro7;
            break;
        case 8:
            cuadro = _campo.cuadro8;
            break;
        case 9:
            cuadro = _campo.cuadro9;
            break;
        default:
            cuadro = nil;
            break;
    }
    return cuadro;
}
-(void)resetJogo{
    [_campo reset];
    _aquienleToca=0;
    _ganoJ=NO;
    _mens=@"";
    _turnos=0;
}
-(void)jogoGanador{
    if ([_campo comparacionJWithCuadroN:_campo.cuadro1 AndCuadroM:_campo.cuadro2 AndCuadroO:_campo.cuadro3]==YES) {
        _ganados++;
        _ganoJ = YES;
        _mens = @"Ganaste";
    }else if([_campo comparacionJWithCuadroN:_campo.cuadro1 AndCuadroM:_campo.cuadro5 AndCuadroO:_campo.cuadro9]==YES){
        _ganados++;
        _ganoJ = YES;
        _mens = @"Ganaste";
    }else if([_campo comparacionJWithCuadroN:_campo.cuadro1 AndCuadroM:_campo.cuadro4 AndCuadroO:_campo.cuadro7]==YES){
        _ganados++;
        _ganoJ = YES;
        _mens = @"Ganaste";
    }else if([_campo comparacionJWithCuadroN:_campo.cuadro2 AndCuadroM:_campo.cuadro5 AndCuadroO:_campo.cuadro8]==YES){
        _ganados++;
        _ganoJ = YES;
        _mens = @"Ganaste";
    }else if([_campo comparacionJWithCuadroN:_campo.cuadro3 AndCuadroM:_campo.cuadro5 AndCuadroO:_campo.cuadro7]==YES){
        _ganados++;
        _ganoJ = YES;
        _mens = @"Ganaste";
    }else if([_campo comparacionJWithCuadroN:_campo.cuadro4 AndCuadroM:_campo.cuadro5 AndCuadroO:_campo.cuadro6]==YES){
        _ganados++;
        _ganoJ = YES;
        _mens = @"Ganaste";
    }else if([_campo comparacionJWithCuadroN:_campo.cuadro7 AndCuadroM:_campo.cuadro8 AndCuadroO:_campo.cuadro9]==YES){
        _ganados++;
        _ganoJ = YES;
        _mens = @"Ganaste";
    }else if([_campo comparacionJWithCuadroN:_campo.cuadro3 AndCuadroM:_campo.cuadro6 AndCuadroO:_campo.cuadro9]==YES){
        _ganados++;
        _ganoJ = YES;
        _mens = @"Ganaste";
    }
}
-(void)jogoPerdedor{
    if ([_campo comparacionIWithCuadroN:_campo.cuadro1 AndCuadroM:_campo.cuadro2 AndCuadroO:_campo.cuadro3]==YES) {
        _perdidos++;
        _ganoJ = YES;
        _mens = @"Perdiste";
    }else if([_campo comparacionIWithCuadroN:_campo.cuadro1 AndCuadroM:_campo.cuadro5 AndCuadroO:_campo.cuadro9]==YES){
        _perdidos++;
        _ganoJ = YES;
        _mens = @"Perdiste";
    }else if([_campo comparacionIWithCuadroN:_campo.cuadro1 AndCuadroM:_campo.cuadro4 AndCuadroO:_campo.cuadro7]==YES){
        _perdidos++;
        _ganoJ = YES;
        _mens = @"Perdiste";
    }else if([_campo comparacionIWithCuadroN:_campo.cuadro2 AndCuadroM:_campo.cuadro5 AndCuadroO:_campo.cuadro8]==YES){
        _perdidos++;
        _ganoJ = YES;
        _mens = @"Perdiste";
    }else if([_campo comparacionIWithCuadroN:_campo.cuadro3 AndCuadroM:_campo.cuadro5 AndCuadroO:_campo.cuadro7]==YES){
        _perdidos++;
        _ganoJ = YES;
        _mens = @"Perdiste";
    }else if([_campo comparacionIWithCuadroN:_campo.cuadro4 AndCuadroM:_campo.cuadro5 AndCuadroO:_campo.cuadro6]==YES){
        _perdidos++;
        _ganoJ = YES;
        _mens = @"Perdiste";
    }else if([_campo comparacionIWithCuadroN:_campo.cuadro7 AndCuadroM:_campo.cuadro8 AndCuadroO:_campo.cuadro9]==YES){
        _perdidos++;
        _ganoJ = YES;
        _mens = @"Perdiste";
    }else if([_campo comparacionIWithCuadroN:_campo.cuadro3 AndCuadroM:_campo.cuadro6 AndCuadroO:_campo.cuadro9]==YES){
        _perdidos++;
        _ganoJ = YES;
        _mens = @"Perdiste";
    }
}
-(void)jogoDeuce{
    [self jogoGanador];
    if (_turnos==8 && _ganoJ==NO) {
        _mens = @"Empate";
    }
}
-(void)setMovimientosJugador:(int)movJugador{
    [_movimientosJugador addObject:[NSNumber numberWithInt:movJugador]];
}
-(bool)busquedaMovimientoJ:(int)posicion{
    BOOL esIgual;
    for (int i=0; i>[_movimientosJugador count]; i++) {
        if([[_movimientosJugador objectAtIndex:i]intValue]==posicion){
            esIgual=YES;
        }else{
            esIgual=NO;
        }
    }
    return esIgual;
}
-(bool)busquedaMovimientoI:(int)posicion{
    BOOL esIgual;
    for (int i=0; i>[_movimientosIOS count]; i++) {
        if([[_movimientosIOS objectAtIndex:i]intValue]==posicion){
            esIgual=YES;
        }else{
            esIgual=NO;
        }
    }
    return esIgual;

}
-(int)movimientosIOSWithContador{
    int posicion=0;
    if (_turnos==1) {
        if ([_campo cuadroSinUsarWithPosicion:5]==YES) {
            posicion=5;
            [_movimientosIOS addObject:[NSNumber numberWithInt:posicion]];
        }else{
            NSArray *posiciones = @[@1, @3, @7, @9];
            unsigned index = (arc4random() % 3);
            posicion = [posiciones[index]intValue];
            [_movimientosIOS addObject:[NSNumber numberWithInt:posicion]];
        }
    }else if (_turnos==3){
        posicion = [self salvar];
    }else{
        do {
            unsigned index = (arc4random() % 9)+1;
            posicion = index;
        } while ([_campo cuadroSelectedWithPosicion:posicion]!=NO);
        
    }
    
    return posicion;
}
-(int) salvar{
    int posicionSalvadora=0;
    if(_turnos==3){
        if ([self busquedaMovimientoJ:5]==YES) {
            if ([self busquedaMovimientoJ:1]==YES) {
                if ([self busquedaMovimientoI:9]==NO) {
                    posicionSalvadora=9;
                    [_movimientosIOS addObject:[NSNumber numberWithInt:posicionSalvadora]];
                }else if ([self  busquedaMovimientoI:9]==YES){
                    
                    posicionSalvadora = [self ataque];
                }
            }else if([self busquedaMovimientoJ:3]==YES){
                if ([self busquedaMovimientoI:7]==NO) {
                    posicionSalvadora=7;
                    [_movimientosIOS addObject:[NSNumber numberWithInt:posicionSalvadora]];
                }else if ([self  busquedaMovimientoI:7]==YES){
                    
                    posicionSalvadora = [self ataque];
                }
            }else if([self busquedaMovimientoJ:7]==YES){
                if ([self busquedaMovimientoI:3]==NO) {
                    posicionSalvadora=3;
                    [_movimientosIOS addObject:[NSNumber numberWithInt:posicionSalvadora]];
                }else if ([self  busquedaMovimientoI:3]==YES){
                    
                    posicionSalvadora = [self ataque];
                }
            }else if([self busquedaMovimientoJ:9]==YES){
                if ([self busquedaMovimientoI:1]==NO) {
                    posicionSalvadora=1;
                    [_movimientosIOS addObject:[NSNumber numberWithInt:posicionSalvadora]];
                }else if ([self  busquedaMovimientoI:1]==YES){
                    
                    posicionSalvadora = [self ataque];
                }
            }else if([self busquedaMovimientoJ:6]==YES){
                if ([self busquedaMovimientoI:4]==NO) {
                    posicionSalvadora=4;
                    [_movimientosIOS addObject:[NSNumber numberWithInt:posicionSalvadora]];
                }else if ([self  busquedaMovimientoI:4]==YES){
                    
                    posicionSalvadora = [self ataque];
                }
            }else if([self busquedaMovimientoJ:4]==YES){
                if ([self busquedaMovimientoI:6]==NO) {
                    posicionSalvadora=6;
                    [_movimientosIOS addObject:[NSNumber numberWithInt:posicionSalvadora]];
                }else if ([self  busquedaMovimientoI:6]==YES){
                    
                    posicionSalvadora = [self ataque];
                }
            }else if([self busquedaMovimientoJ:2]==YES){
                if ([self busquedaMovimientoI:8]==NO) {
                    posicionSalvadora=8;
                    [_movimientosIOS addObject:[NSNumber numberWithInt:posicionSalvadora]];
                }else if ([self  busquedaMovimientoI:8]==YES){
                    
                    posicionSalvadora = [self ataque];
                }
            }else if([self busquedaMovimientoJ:8]==YES){
                if ([self busquedaMovimientoI:2]==NO) {
                    posicionSalvadora=2;
                    [_movimientosIOS addObject:[NSNumber numberWithInt:posicionSalvadora]];
                }else if ([self  busquedaMovimientoI:2]==YES){
                    
                    posicionSalvadora = [self ataque];
                }
            }
        }else if ([self busquedaMovimientoJ:1]){
            if ([self busquedaMovimientoJ:2]==YES) {
                if ([self busquedaMovimientoI:3]==NO) {
                    posicionSalvadora=3;
                    [_movimientosIOS addObject:[NSNumber numberWithInt:posicionSalvadora]];
                }else if ([self  busquedaMovimientoI:3]==YES){
                    
                    posicionSalvadora = [self ataque];
                }
            }else if([self busquedaMovimientoJ:3]==YES){
                if ([self busquedaMovimientoI:2]==NO) {
                    posicionSalvadora=2;
                    [_movimientosIOS addObject:[NSNumber numberWithInt:posicionSalvadora]];
                }else if ([self  busquedaMovimientoI:2]==YES){
                    
                    posicionSalvadora = [self ataque];
                }
            }else if([self busquedaMovimientoJ:4]==YES){
                if ([self busquedaMovimientoI:7]==NO) {
                    posicionSalvadora=7;
                    [_movimientosIOS addObject:[NSNumber numberWithInt:posicionSalvadora]];
                }else if ([self  busquedaMovimientoI:7]==YES){
                    
                    posicionSalvadora = [self ataque];
                }
            }else if([self busquedaMovimientoJ:5]==YES){
                if ([self busquedaMovimientoI:9]==NO) {
                    posicionSalvadora=9;
                    [_movimientosIOS addObject:[NSNumber numberWithInt:posicionSalvadora]];
                }else if ([self  busquedaMovimientoI:9]==YES){
                    
                    posicionSalvadora = [self ataque];
                }
            }else if([self busquedaMovimientoJ:6]==YES){
                
                posicionSalvadora = [self ataque];
                
            }else if([self busquedaMovimientoJ:7]==YES){
                if ([self busquedaMovimientoI:4]==NO) {
                    posicionSalvadora=4;
                    [_movimientosIOS addObject:[NSNumber numberWithInt:posicionSalvadora]];
                }else if ([self  busquedaMovimientoI:4]==YES){
                    
                    posicionSalvadora = [self ataque];
                }
            }else if([self busquedaMovimientoJ:8]==YES){
                
                posicionSalvadora = [self ataque];
                
            }else if([self busquedaMovimientoJ:9]==YES){
                if ([self busquedaMovimientoI:5]==NO) {
                    posicionSalvadora=5;
                    [_movimientosIOS addObject:[NSNumber numberWithInt:posicionSalvadora]];
                }else if ([self  busquedaMovimientoI:5]==YES){
                    
                    posicionSalvadora = [self ataque];
                }
            }
        }else if ([self busquedaMovimientoJ:2]){
            if ([self busquedaMovimientoJ:1]==YES) {
                if ([self busquedaMovimientoI:3]==NO) {
                    posicionSalvadora=3;
                    [_movimientosIOS addObject:[NSNumber numberWithInt:posicionSalvadora]];
                }else if ([self  busquedaMovimientoI:3]==YES){
                    
                    posicionSalvadora = [self ataque];
                }
            }else if([self busquedaMovimientoJ:3]==YES){
                if ([self busquedaMovimientoI:1]==NO) {
                    posicionSalvadora=1;
                    [_movimientosIOS addObject:[NSNumber numberWithInt:posicionSalvadora]];
                }else if ([self  busquedaMovimientoI:1]==YES){
                    
                    posicionSalvadora = [self ataque];
                }
            }else if([self busquedaMovimientoJ:4]==YES){
                
                    posicionSalvadora = [self ataque];
                
            }else if([self busquedaMovimientoJ:5]==YES){
                if ([self busquedaMovimientoI:8]==NO) {
                    posicionSalvadora=8;
                    [_movimientosIOS addObject:[NSNumber numberWithInt:posicionSalvadora]];
                }else if ([self  busquedaMovimientoI:8]==YES){
                    
                    posicionSalvadora = [self ataque];
                }
            }else if([self busquedaMovimientoJ:6]==YES){
                
                posicionSalvadora = [self ataque];
                
            }else if([self busquedaMovimientoJ:7]==YES){
                
                posicionSalvadora = [self ataque];
                
            }else if([self busquedaMovimientoJ:8]==YES){
                if ([self busquedaMovimientoI:5]==NO) {
                    posicionSalvadora=5;
                    [_movimientosIOS addObject:[NSNumber numberWithInt:posicionSalvadora]];
                }else if ([self  busquedaMovimientoI:5]==YES){
                    
                    posicionSalvadora = [self ataque];
                }
            }else if([self busquedaMovimientoJ:9]==YES){
                
                posicionSalvadora = [self ataque];
                
            }
        }else if ([self busquedaMovimientoJ:3]){//el tres
            if ([self busquedaMovimientoJ:1]==YES) {
                if ([self busquedaMovimientoI:2]==NO) {
                    posicionSalvadora=2;
                    [_movimientosIOS addObject:[NSNumber numberWithInt:posicionSalvadora]];
                }else if ([self  busquedaMovimientoI:2]==YES){
                    
                    posicionSalvadora = [self ataque];
                }
            }else if([self busquedaMovimientoJ:2]==YES){
                if ([self busquedaMovimientoI:1]==NO) {
                    posicionSalvadora=1;
                    [_movimientosIOS addObject:[NSNumber numberWithInt:posicionSalvadora]];
                }else if ([self  busquedaMovimientoI:1]==YES){
                    
                    posicionSalvadora = [self ataque];
                }
            }else if([self busquedaMovimientoJ:4]==YES){
                 
                posicionSalvadora = [self ataque];
                
            }else if([self busquedaMovimientoJ:5]==YES){
                if ([self busquedaMovimientoI:7]==NO) {
                    posicionSalvadora=7;
                    [_movimientosIOS addObject:[NSNumber numberWithInt:posicionSalvadora]];
                }else if ([self  busquedaMovimientoI:7]==YES){
                    
                    posicionSalvadora = [self ataque];
                }
            }else if([self busquedaMovimientoJ:6]==YES){
                if ([self busquedaMovimientoI:9]==NO) {
                    posicionSalvadora=9;
                    [_movimientosIOS addObject:[NSNumber numberWithInt:posicionSalvadora]];
                }else if ([self  busquedaMovimientoI:9]==YES){
                    
                    posicionSalvadora = [self ataque];
                }
            }else if([self busquedaMovimientoJ:7]==YES){
                if ([self busquedaMovimientoI:5]==NO) {
                    posicionSalvadora=5;
                    [_movimientosIOS addObject:[NSNumber numberWithInt:posicionSalvadora]];
                }else if ([self  busquedaMovimientoI:5]==YES){
                    
                    posicionSalvadora = [self ataque];
                }
            }else if([self busquedaMovimientoJ:8]==YES){
                
                posicionSalvadora = [self ataque];
                
            }else if([self busquedaMovimientoJ:9]==YES){
                if ([self busquedaMovimientoI:6]==NO) {
                    posicionSalvadora=6;
                    [_movimientosIOS addObject:[NSNumber numberWithInt:posicionSalvadora]];
                }else if ([self  busquedaMovimientoI:6]==YES){
                    
                    posicionSalvadora = [self ataque];
                }
            }
            
        }else if ([self busquedaMovimientoJ:4]){//el cuatro
            if ([self busquedaMovimientoJ:1]==YES) {
                if ([self busquedaMovimientoI:7]==NO) {
                    posicionSalvadora=7;
                    [_movimientosIOS addObject:[NSNumber numberWithInt:posicionSalvadora]];
                }else if ([self  busquedaMovimientoI:7]==YES){
                    
                    posicionSalvadora = [self ataque];
                }
            }else if([self busquedaMovimientoJ:2]==YES){
                 
                posicionSalvadora = [self ataque];
                
            }else if([self busquedaMovimientoJ:3]==YES){
                 
                posicionSalvadora = [self ataque];
                
            }else if([self busquedaMovimientoJ:5]==YES){
                if ([self busquedaMovimientoI:6]==NO) {
                    posicionSalvadora=6;
                    [_movimientosIOS addObject:[NSNumber numberWithInt:posicionSalvadora]];
                }else if ([self  busquedaMovimientoI:6]==YES){
                    
                    posicionSalvadora = [self ataque];
                }
            }else if([self busquedaMovimientoJ:6]==YES){
                if ([self busquedaMovimientoI:5]==NO) {
                    posicionSalvadora=5;
                    [_movimientosIOS addObject:[NSNumber numberWithInt:posicionSalvadora]];
                }else if ([self  busquedaMovimientoI:5]==YES){
                    
                    posicionSalvadora = [self ataque];
                }
            }else if([self busquedaMovimientoJ:7]==YES){
                if ([self busquedaMovimientoI:1]==NO) {
                    posicionSalvadora=1;
                    [_movimientosIOS addObject:[NSNumber numberWithInt:posicionSalvadora]];
                }else if ([self  busquedaMovimientoI:1]==YES){
                    
                    posicionSalvadora = [self ataque];
                }
            }else if([self busquedaMovimientoJ:8]==YES){
                
                posicionSalvadora = [self ataque];
                
            }else if([self busquedaMovimientoJ:9]==YES){
                  
                posicionSalvadora = [self ataque];
                
            }
            
        }else if ([self busquedaMovimientoJ:6]){//el seis
            if ([self busquedaMovimientoJ:1]==YES) {
                
                posicionSalvadora = [self ataque];
                
            }else if([self busquedaMovimientoJ:2]==YES){
                  
                posicionSalvadora = [self ataque];
                
            }else if([self busquedaMovimientoJ:3]==YES){
                if ([self busquedaMovimientoI:9]==NO) {
                    posicionSalvadora=9;
                    [_movimientosIOS addObject:[NSNumber numberWithInt:posicionSalvadora]];
                }else if ([self  busquedaMovimientoI:9]==YES){
                    
                    posicionSalvadora = [self ataque];
                }
            }else if([self busquedaMovimientoJ:4]==YES){
                if ([self busquedaMovimientoI:5]==NO) {
                    posicionSalvadora=5;
                    [_movimientosIOS addObject:[NSNumber numberWithInt:posicionSalvadora]];
                }else if ([self  busquedaMovimientoI:5]==YES){
                    
                    posicionSalvadora = [self ataque];
                }
            }else if([self busquedaMovimientoJ:5]==YES){
                if ([self busquedaMovimientoI:4]==NO) {
                    posicionSalvadora=4;
                    [_movimientosIOS addObject:[NSNumber numberWithInt:posicionSalvadora]];
                }else if ([self  busquedaMovimientoI:4]==YES){
                    
                    posicionSalvadora = [self ataque];
                }
            }else if([self busquedaMovimientoJ:7]==YES){
                
                posicionSalvadora = [self ataque];
                
            }else if([self busquedaMovimientoJ:8]==YES){
                
                posicionSalvadora = [self ataque];
                
            }else if([self busquedaMovimientoJ:9]==YES){
                if ([self busquedaMovimientoI:3]==NO) {
                    posicionSalvadora=3;
                    [_movimientosIOS addObject:[NSNumber numberWithInt:posicionSalvadora]];
                }else if ([self  busquedaMovimientoI:3]==YES){
                    
                    posicionSalvadora = [self ataque];
                }
            }
            
        }else if ([self busquedaMovimientoJ:7]){//el siete
            if ([self busquedaMovimientoJ:1]==YES) {
                if ([self busquedaMovimientoI:4]==NO) {
                    posicionSalvadora=4;
                    [_movimientosIOS addObject:[NSNumber numberWithInt:posicionSalvadora]];
                }else if ([self  busquedaMovimientoI:4]==YES){
                    
                    posicionSalvadora = [self ataque];
                }
            }else if([self busquedaMovimientoJ:2]==YES){
                 
                    posicionSalvadora = [self ataque];
                
            }else if([self busquedaMovimientoJ:3]==YES){
                if ([self busquedaMovimientoI:5]==NO) {
                    posicionSalvadora=5;
                    [_movimientosIOS addObject:[NSNumber numberWithInt:posicionSalvadora]];
                }else if ([self  busquedaMovimientoI:5]==YES){
                    
                    posicionSalvadora = [self ataque];
                }
            }else if([self busquedaMovimientoJ:4]==YES){
                if ([self busquedaMovimientoI:1]==NO) {
                    posicionSalvadora=1;
                    [_movimientosIOS addObject:[NSNumber numberWithInt:posicionSalvadora]];
                }else if ([self  busquedaMovimientoI:1]==YES){
                    
                    posicionSalvadora = [self ataque];
                }
            }else if([self busquedaMovimientoJ:5]==YES){
                if ([self busquedaMovimientoI:3]==NO) {
                    posicionSalvadora=3;
                    [_movimientosIOS addObject:[NSNumber numberWithInt:posicionSalvadora]];
                }else if ([self  busquedaMovimientoI:3]==YES){
                    
                    posicionSalvadora = [self ataque];
                }
            }else if([self busquedaMovimientoJ:6]==YES){
                
                posicionSalvadora = [self ataque];
                
            }else if([self busquedaMovimientoJ:8]==YES){
                if ([self busquedaMovimientoI:9]==NO) {
                    posicionSalvadora=9;
                    [_movimientosIOS addObject:[NSNumber numberWithInt:posicionSalvadora]];
                }else if ([self  busquedaMovimientoI:9]==YES){
                    
                    posicionSalvadora = [self ataque];
                }
            }else if([self busquedaMovimientoJ:9]==YES){
                if ([self busquedaMovimientoI:8]==NO) {
                    posicionSalvadora=8;
                    [_movimientosIOS addObject:[NSNumber numberWithInt:posicionSalvadora]];
                }else if ([self  busquedaMovimientoI:8]==YES){
                    
                    posicionSalvadora = [self ataque];
                }
            }
            
        }else if ([self busquedaMovimientoJ:8]){//el ocho
            if ([self busquedaMovimientoJ:1]==YES) {
                
                    posicionSalvadora = [self ataque];
                
            }else if([self busquedaMovimientoJ:2]==YES){
                if ([self busquedaMovimientoI:5]==NO) {
                    posicionSalvadora=5;
                    [_movimientosIOS addObject:[NSNumber numberWithInt:posicionSalvadora]];
                }else if ([self  busquedaMovimientoI:5]==YES){
                    
                    posicionSalvadora = [self ataque];
                }
            }else if([self busquedaMovimientoJ:3]==YES){
                
                posicionSalvadora = [self ataque];
                
            }else if([self busquedaMovimientoJ:4]==YES){
                
                    posicionSalvadora = [self ataque];
                
            }else if([self busquedaMovimientoJ:5]==YES){
                if ([self busquedaMovimientoI:2]==NO) {
                    posicionSalvadora=2;
                    [_movimientosIOS addObject:[NSNumber numberWithInt:posicionSalvadora]];
                }else if ([self  busquedaMovimientoI:2]==YES){
                    
                    posicionSalvadora = [self ataque];
                }
            }else if([self busquedaMovimientoJ:6]==YES){
                
                posicionSalvadora = [self ataque];
                
            }else if([self busquedaMovimientoJ:7]==YES){
                if ([self busquedaMovimientoI:9]==NO) {
                    posicionSalvadora=9;
                    [_movimientosIOS addObject:[NSNumber numberWithInt:posicionSalvadora]];
                }else if ([self  busquedaMovimientoI:9]==YES){
                    
                    posicionSalvadora = [self ataque];
                }
            }else if([self busquedaMovimientoJ:9]==YES){
                if ([self busquedaMovimientoI:7]==NO) {
                    posicionSalvadora=7;
                    [_movimientosIOS addObject:[NSNumber numberWithInt:posicionSalvadora]];
                }else if ([self  busquedaMovimientoI:7]==YES){
                    
                    posicionSalvadora = [self ataque];
                }
            }
            
        }else if ([self busquedaMovimientoJ:9]){//el nueve
            if ([self busquedaMovimientoJ:1]==YES) {
                if ([self busquedaMovimientoI:5]==NO) {
                    posicionSalvadora=5;
                    [_movimientosIOS addObject:[NSNumber numberWithInt:posicionSalvadora]];
                }else if ([self  busquedaMovimientoI:5]==YES){
                    
                    posicionSalvadora = [self ataque];
                }
            }else if([self busquedaMovimientoJ:2]==YES){
                
                posicionSalvadora = [self ataque];
                
            }else if([self busquedaMovimientoJ:3]==YES){
                if ([self busquedaMovimientoI:6]==NO) {
                    posicionSalvadora=6;
                    [_movimientosIOS addObject:[NSNumber numberWithInt:posicionSalvadora]];
                }else if ([self  busquedaMovimientoI:6]==YES){
                    
                    posicionSalvadora = [self ataque];
                }
            }else if([self busquedaMovimientoJ:4]==YES){
                
                posicionSalvadora = [self ataque];
                
            }else if([self busquedaMovimientoJ:5]==YES){
                if ([self busquedaMovimientoI:1]==NO) {
                    posicionSalvadora=1;
                    [_movimientosIOS addObject:[NSNumber numberWithInt:posicionSalvadora]];
                }else if ([self  busquedaMovimientoI:1]==YES){
                    
                    posicionSalvadora = [self ataque];
                }
            }else if([self busquedaMovimientoJ:6]==YES){
                if ([self busquedaMovimientoI:3]==NO) {
                    posicionSalvadora=3;
                    [_movimientosIOS addObject:[NSNumber numberWithInt:posicionSalvadora]];
                }else if ([self  busquedaMovimientoI:3]==YES){
                    
                    posicionSalvadora = [self ataque];
                }
            }else if([self busquedaMovimientoJ:7]==YES){
                if ([self busquedaMovimientoI:8]==NO) {
                    posicionSalvadora=8;
                    [_movimientosIOS addObject:[NSNumber numberWithInt:posicionSalvadora]];
                }else if ([self  busquedaMovimientoI:8]==YES){
                    
                    posicionSalvadora = [self ataque];
                }
            }else if([self busquedaMovimientoJ:8]==YES){
                if ([self busquedaMovimientoI:7]==NO) {
                    posicionSalvadora=7;
                    [_movimientosIOS addObject:[NSNumber numberWithInt:posicionSalvadora]];
                }else if ([self  busquedaMovimientoI:7]==YES){
                    
                    posicionSalvadora = [self ataque];
                }
            }
        }
    }
    return posicionSalvadora;
}
-(int)ataque{
    int ataque=0;
    do {
        unsigned index = (arc4random() % 9)+1;
        ataque = index;
    } while ([_campo cuadroSelectedWithPosicion:ataque]!=NO);
    return ataque;
}
-(NSString*)elGanador{
    if (_ganoJ==YES) {
        return _mens;
    }
    return @"";
}
@end
