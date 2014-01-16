//
//  WorldViewController.h
//  WorldCountries
//
//  Created by Pablo Roberto Carrera Estrada on 11/29/13.
//  Copyright (c) 2013 Pablo Roberto Carrera Estrada. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface WorldViewController : UIViewController<MKMapViewDelegate>
@property (nonatomic,strong)NSMutableArray *display;
@property (nonatomic, strong) IBOutlet MKMapView *mapView;

@end
