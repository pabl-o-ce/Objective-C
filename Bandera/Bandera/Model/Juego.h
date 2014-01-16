//
//  Juego.h
//  Bandera
//
//  Created by Pablo Roberto Carrera Estrada on 10/15/13.
//  Copyright (c) 2013 Pablo Roberto Carrera Estrada. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Juego : NSObject
@property (nonatomic, strong)NSMutableArray *np;
@property (nonatomic, strong)NSMutableArray *paisesJugado;
@property (nonatomic, weak)NSString *elPais;
-(id)init;
-(void)reparto;
-(BOOL)adivinoWithPais:(NSString *)pais;
-(void)SetPaisesJugadoWith:(NSString *)pais;
-(NSString*)getPaisWithIndex:(int)num;
-(void)restart;
@end