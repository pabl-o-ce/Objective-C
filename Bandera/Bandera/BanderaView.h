//
//  BanderaView.h
//  Bandera
//
//  Created by Pablo Roberto Carrera Estrada on 10/15/13.
//  Copyright (c) 2013 Pablo Roberto Carrera Estrada. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BanderaView : UIView

@property (strong, nonatomic) NSString *nombrePais;
@property (strong, nonatomic)UIImage *bd;
-(void)setNombrePais:(NSString *)Pais;
@end
