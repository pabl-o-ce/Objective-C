//
//  MapViewController.h
//  WorldCountries
//
//  Created by Pablo Roberto Carrera Estrada on 12/1/13.
//  Copyright (c) 2013 Pablo Roberto Carrera Estrada. All rights reserved.
//

#import <UIKit/UIKit.h>
@interface MapViewController : UIViewController<MKMapViewDelegate>
@property (nonatomic, strong) IBOutlet MKMapView *mapView;


@end
