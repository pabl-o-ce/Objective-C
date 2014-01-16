//
//  _EnRayaViewController.m
//  Tres-en-Raya
//
//  Created by Pablo Roberto Carrera Estrada on 9/11/13.
//  Copyright (c) 2013 Pablo Roberto Carrera Estrada. All rights reserved.
//

#import "_EnRayaViewController.h"
#import "Jogo.h"
#import "Cuadro.h"
#import "JogoResult.h"
@interface _EnRayaViewController ()
@property (strong, nonatomic) IBOutletCollection(UIButton) NSArray *cuadros;
@property (strong, nonatomic) IBOutlet UILabel *contadorGanados;
@property (weak, nonatomic) IBOutlet UILabel *player;
@property (weak, nonatomic) IBOutlet UILabel *ios;
@property (weak, nonatomic) IBOutlet UILabel *contadorPerdidos;
@property (nonatomic) int indexUserPlay;
@property (strong, nonatomic)Jogo *jogo;
@property (weak, nonatomic) IBOutlet UILabel *mensaje;
@property (weak, nonatomic) IBOutlet UIBarButtonItem *resetButton;
@property (strong, nonatomic)JogoResult *jogoResult;

@end

@implementation _EnRayaViewController
-(JogoResult *)jogoResult{
    if (!_jogoResult) {
        _jogoResult = [[JogoResult alloc]init];
    }
    return _jogoResult;
}
-(Jogo*)jogo{
    if (!_jogo) _jogo = [[Jogo alloc]init];
    return _jogo;
}
- (IBAction)reset:(UIBarButtonItem *)sender {
    [self resetdisplay];
}
-(void)resetdisplay{
    for (UIButton *cuadro in _cuadros) {
        [cuadro setEnabled:YES];
        [cuadro setTitle:@"" forState:UIControlStateDisabled];
    }
    [self.jogo resetJogo];
    _indexUserPlay=0;
    //self.jogoResult=nil;
    self.mensaje.text = [NSString stringWithFormat:@" %@", self.jogo.mens];
}
-(void)setCuadros:(NSArray *)cuadros{
    _cuadros = cuadros;
    [self updateUI];
}
- (void) updateUI
{
    for(UIButton *cuadroButton in self.cuadros){
        NSString *num = [cuadroButton titleForState:UIControlStateSelected];
        int n = [num intValue];
        Cuadro *cuadro = [self.jogo getCuadroAtIndex:n];
        [cuadroButton setTitle:cuadro.contenido forState:UIControlStateDisabled];
        [cuadroButton setTitle:cuadro.contenido forState:UIControlStateDisabled|UIControlStateDisabled];
        cuadroButton.enabled = cuadro.sinjogar;
    }
    self.mensaje.text = [NSString stringWithFormat:@" %@", self.jogo.mens];
    if ([self.jogo ganoJ]==YES) {
        [_resetButton setEnabled:YES];
        self.jogoResult.ganados = self.jogo.ganados;
        self.jogoResult.perdidos = self.jogo.perdidos;
        [self block];
    }else if([self.jogo ganoJ]==NO && [self.jogo turnos]==8){
        [self.jogo jogoDeuce];
        [_resetButton setEnabled:YES];
    }else{
        [_resetButton setEnabled:NO];
    }
    
    self.contadorGanados.text = [NSString stringWithFormat:@"Ganados : %d",self.jogo.ganados];
    self.contadorPerdidos.text = [NSString stringWithFormat:@"Perdidos : %d",self.jogo.perdidos];
}
- (IBAction)turnoJogador:(UIButton *)sender {
    //sender.selected = !sender.isSelected;
    if (sender.isSelected) {
        [sender setTitle:@"" forState:UIControlStateDisabled];
    }else{
        NSString *num = [sender titleForState:UIControlStateSelected];
        _indexUserPlay = [num intValue];
        [self movimientosJogador];
        
    }
}
-(void)movimientosJogador{
    if ([self.jogo turnos]==0) {
        [self.jogo setAquienleTocaWithContador:[self.jogo turnos]];
        [self.jogo setCampoCuadroWithNumButton:_indexUserPlay];
        [self.jogo setMovimientosJugador:_indexUserPlay];
        [self.jogo setTurnos];
        [self.jogo setAquienleTocaWithContador:[self.jogo turnos]];
        [self movimientosIOS];
        
    }else if([self.jogo turnos]==2){
        [self.jogo setAquienleTocaWithContador:[self.jogo turnos]];
        [self.jogo setCampoCuadroWithNumButton:_indexUserPlay];
        [self.jogo setMovimientosJugador:_indexUserPlay];
        [self.jogo setTurnos];
        [self.jogo setAquienleTocaWithContador:[self.jogo turnos]];
        [self movimientosIOS];
    }else if([self.jogo turnos]==4){
        [self.jogo setAquienleTocaWithContador:[self.jogo turnos]];
        [self.jogo setCampoCuadroWithNumButton:_indexUserPlay];
        [self.jogo setMovimientosJugador:_indexUserPlay];
        [self.jogo jogoGanador];
        if ([self.jogo ganoJ]==NO) {
            [self.jogo setTurnos];
            [self.jogo setAquienleTocaWithContador:[self.jogo turnos]];
            [self movimientosIOS];
        }else{
            [self updateUI];
        }
    }else if([self.jogo turnos]==6){
        [self.jogo setAquienleTocaWithContador:[self.jogo turnos]];
        [self.jogo setCampoCuadroWithNumButton:_indexUserPlay];
        [self.jogo setMovimientosJugador:_indexUserPlay];
        [self.jogo jogoGanador];
        if ([self.jogo ganoJ]==NO) {
            [self.jogo setTurnos];
            [self.jogo setAquienleTocaWithContador:[self.jogo turnos]];
            [self movimientosIOS];
        }else{
            [self updateUI];
        }
    }else if([self.jogo turnos]==8){
        [self.jogo setAquienleTocaWithContador:[self.jogo turnos]];
        [self.jogo setCampoCuadroWithNumButton:_indexUserPlay];
        [self.jogo setMovimientosJugador:_indexUserPlay];
        [self.jogo jogoGanador];
        if ([self.jogo ganoJ]==NO) {
            [self.jogo jogoDeuce];
            [self updateUI];
        }else{
            [self updateUI];
        }
    }
}
-(void)movimientosIOS{
    if ([self.jogo turnos]==1) {
        _indexUserPlay = [self.jogo movimientosIOSWithContador];
        [self.jogo setCampoCuadroWithNumButton:_indexUserPlay];
        [self.jogo setTurnos];
        [self updateUI];
    }else if([self.jogo turnos]==3){
        _indexUserPlay = [self.jogo movimientosIOSWithContador];
        [self.jogo setCampoCuadroWithNumButton:_indexUserPlay];
        [self.jogo setTurnos];
        [self updateUI];
    }else if([self.jogo turnos]==5){
        _indexUserPlay = [self.jogo movimientosIOSWithContador];
        [self.jogo setCampoCuadroWithNumButton:_indexUserPlay];
        [self.jogo jogoPerdedor];
        if ([self.jogo ganoJ]==NO) {
            [self.jogo setTurnos];
            [self updateUI];
        }else{
            [self updateUI];
        }
    }else if([self.jogo turnos]==7){
        _indexUserPlay = [self.jogo movimientosIOSWithContador];
        [self.jogo setCampoCuadroWithNumButton:_indexUserPlay];
        [self.jogo jogoPerdedor];
        if ([self.jogo ganoJ]==NO) {
            [self.jogo setTurnos];
            [self updateUI];
        }else{
            [self updateUI];
        }
    }else{
        [self updateUI];
    }
}
-(void)block{
    for (UIButton *cuadro in _cuadros) {
        [cuadro setEnabled:NO];
    }
}

@end
