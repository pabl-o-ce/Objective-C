//
//  Juego.m
//  Bandera
//
//  Created by Pablo Roberto Carrera Estrada on 10/15/13.
//  Copyright (c) 2013 Pablo Roberto Carrera Estrada. All rights reserved.
//

#import "Juego.h"

@implementation Juego

-(id)init{
    self = [super init];
    if (self){
        NSArray *lp = @[@"Argentina",@"Australia",@"Brazil",@"Canada",@"Chile",@"China",@"France",@"Germany",@"Ghana",@"Iceland",@"India",@"Ireland",@"Italy",@"Japan",@"Kenya",@"Malta",@"Mexico",@"Mongolia",@"Morocco",@"Mozambique",@"New_Zealand",@"Poland",@"Russia",@"Rwanda",@"South_Africa",@"Spain",@"Sweden",@"Turkey",@"United_Kingdom",@"United_States"];
        _np = [[NSMutableArray alloc]initWithArray:lp];
        _paisesJugado = [[NSMutableArray alloc]init];
        _elPais = @"Choosen one!";
        [self reparto];
        
    }
    return self;
}

-(BOOL)adivinoWithPais:(NSString *)pais{
    BOOL adivino;
    if([self.elPais isEqualToString:pais]){
        adivino = TRUE;
    }else{
        adivino = FALSE;
    }
    return adivino;
}
-(void)reparto{
    unsigned index;
    for (int i=0; i<6; i++) {
        index = (arc4random() % [self.np count]);
        NSString *temp = self.np[index];
        [self.np removeObjectAtIndex:index];
        [self SetPaisesJugadoWith:temp];
    }
    index = (arc4random()%6);
    [self setElPais:self.paisesJugado[index]];
}
-(void)SetPaisesJugadoWith:(NSString *)pais{
    [_paisesJugado addObject:[NSString stringWithString:pais]];
}

-(NSString*)getPaisWithIndex:(int)num{
    return self.paisesJugado[num];
}
-(void)restart{
    [self.np addObjectsFromArray:self.paisesJugado];
    [self.paisesJugado removeAllObjects];
    [self setElPais:@""];
    [self reparto];
}
@end
