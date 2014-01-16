//
//  Jogo.h
//  Tres-en-Raya
//
//  Created by Pablo Roberto Carrera Estrada on 9/14/13.
//  Copyright (c) 2013 Pablo Roberto Carrera Estrada. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Field.h"
#import "Cuadro.h"
@interface Jogo : NSObject
@property (strong, nonatomic) Field *campo;
@property (nonatomic) int aquienleToca;
@property (nonatomic) int ganados;
@property (nonatomic) int perdidos;
@property (nonatomic) BOOL ganoJ;
@property (nonatomic) int turnos;
@property (strong, nonatomic)NSString *mens;
@property (nonatomic)NSMutableArray *movimientosIOS;
@property (nonatomic)NSMutableArray *movimientosJugador;
-(void)setAquienleTocaWithContador:(int)contador;
-(void)setCampoCuadroWithNumButton:(int)posicion;
-(void)resetJogo;
-(void)jogoGanador;
-(void)jogoPerdedor;
-(void)jogoDeuce;
-(int)movimientosIOSWithContador;
-(Cuadro*)getCuadroAtIndex:(int)index;
-(NSString*)elGanador;
-(void)setTurnos;
-(void)setMovimientosJugador:(int)movimientosJugador;
@end
