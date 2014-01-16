//
//  BanderasViewController.m
//  Bandera
//
//  Created by Pablo Roberto Carrera Estrada on 1/1/01.
//  Copyright (c) 2001 Pablo Roberto Carrera Estrada. All rights reserved.
//

#import "BanderasViewController.h"
#import "ResultadoImageViewController.h"
#import "BanderaCollectionViewCell.h"
#import "BanderaView.h"
#import "Juego.h"

@interface BanderasViewController () <UICollectionViewDataSource, UICollectionViewDelegate>
@property (weak, nonatomic) IBOutlet UILabel *adivinados;
@property (weak, nonatomic) IBOutlet UILabel *numIntentos;
@property (strong, nonatomic) IBOutlet UILabel *nomPais;
@property (weak, nonatomic) IBOutlet UICollectionView *banderitasCollectionView;
@property (nonatomic)BOOL adi;
@property (nonatomic)int ladivinados;
@property (nonatomic)int intentos;
@property (nonatomic,strong)Juego *banderitas;
@end

@implementation BanderasViewController
- (void) prepareForSegue:(UIStoryboardSegue *)segue
                  sender:(BanderaCollectionViewCell*)sender{
    if ([segue.identifier isEqualToString:@"Bandera"]) {
        if ([segue.destinationViewController isKindOfClass:[ResultadoImageViewController class]]) {
            ResultadoImageViewController *cdvc = (ResultadoImageViewController *)segue.destinationViewController;
            if ([sender isKindOfClass:[BanderaCollectionViewCell class]]){
                self.adi=[self.banderitas adivinoWithPais:sender.banderaView.nombrePais];
            }
            cdvc.adivino = self.adi;
            [self contador];
            [self.banderitas restart];
        }
    }
}
-(void)contador{
    _intentos++;
    if(self.adi){
        _ladivinados++;
    }
    [self updateUI];
}
-(Juego *)banderitas{
    if (!_banderitas) _banderitas = [[Juego alloc] init];
    return _banderitas;
}
- (IBAction)Reset:(UIButton *)sender {
    self.ladivinados=0;
    self.intentos=0;
    [self.banderitas restart];
    [self updateUI];
}
-(void) updateUI{
    self.adivinados.text = [NSString stringWithFormat:@"Adivinados: %d", self.ladivinados];
    self.numIntentos.text = [NSString stringWithFormat:@"Intentos: %d", self.intentos];
    self.nomPais.text = [self.banderitas elPais];
    for (UICollectionViewCell *cell in [self.banderitasCollectionView visibleCells]){
        NSIndexPath *indexPath = [self.banderitasCollectionView indexPathForCell:cell];
        NSString *banderinlla = [self.banderitas getPaisWithIndex:indexPath.item];
        [self updateCell:cell usingJuego:banderinlla];
    }
    
}
-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    [self updateUI];
}
-(void)setup{
    [self updateUI];
    
}
-(void) awakeFromNib{
    [self setup];
}
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    [self setup];
    return self;
}

-(NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView{
    return 1;
}

-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return [self.banderitas.paisesJugado count];
}


-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    UICollectionViewCell *cell = [self.banderitasCollectionView dequeueReusableCellWithReuseIdentifier:@"Bandera" forIndexPath:indexPath];
    NSString *bd=[self.banderitas getPaisWithIndex:indexPath.item];
    [self updateCell:cell usingJuego:bd];
    return cell;
}
-(void) updateCell:(UICollectionViewCell *)cell usingJuego:(NSString*)bp{
    if ([cell isKindOfClass:[BanderaCollectionViewCell class]]){
        BanderaView *banderacell = ((BanderaCollectionViewCell *) cell).banderaView;
            banderacell.nombrePais = bp;
    }
}
@end
