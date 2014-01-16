//
//  ResultadoImageViewController.m
//  Bandera
//
//  Created by Pablo Roberto Carrera Estrada on 10/15/13.
//  Copyright (c) 2013 Pablo Roberto Carrera Estrada. All rights reserved.
//

#import "ResultadoImageViewController.h"
#import "Imagen.h"

@interface ResultadoImageViewController ()
@property (nonatomic)UIImage *si;
@property (nonatomic)UIImage *no;
@property (weak, nonatomic) IBOutlet Imagen *img;

@end

@implementation ResultadoImageViewController


- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    self.img.adivino = self.adivino;
}


@end
