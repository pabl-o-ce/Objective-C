//
//  CountryFlagViewController.h
//  TableCoreData
//
//  Created by Pablo Roberto Carrera Estrada on 11/15/13.
//  Copyright (c) 2013 Pablo Roberto Carrera Estrada. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CountryFlagViewController : UIViewController
@property (weak, nonatomic) NSString *name;
@property (nonatomic,strong) NSURL *imageURL;
@end
