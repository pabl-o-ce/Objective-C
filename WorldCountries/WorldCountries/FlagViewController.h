//
//  FlagViewController.h
//  WorldCountries
//
//  Created by Pablo Roberto Carrera Estrada on 12/1/13.
//  Copyright (c) 2013 Pablo Roberto Carrera Estrada. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CountryAnnotation.h"
@interface FlagViewController : UIViewController

@property (nonatomic, strong) NSString *imageName;
@property (nonatomic,strong) CountryAnnotation *local;
- (void)setLocal:(CountryAnnotation *)local;
@end
