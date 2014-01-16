//
//  Cuadro.h
//  Tres-en-Raya
//
//  Created by Pablo Roberto Carrera Estrada on 9/14/13.
//  Copyright (c) 2013 Pablo Roberto Carrera Estrada. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Simbolo.h"
@interface Cuadro : NSObject
@property (strong, nonatomic) NSString *contenido;
@property (nonatomic, getter=isSelected) BOOL selected;
@property (nonatomic) BOOL sinjogar;
@property (strong, nonatomic) Simbolo *simbolo;

-(void)setCuadroWithJogador:(int) quejogador;
-(void)setCuadroVacio;
@end
