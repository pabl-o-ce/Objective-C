//
//  CountryAnnotation.h
//  WorldCountries
//
//  Created by Pablo Roberto Carrera Estrada on 11/30/13.
//  Copyright (c) 2013 Pablo Roberto Carrera Estrada. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CountryAnnotation : NSObject <MKAnnotation>


@property (nonatomic, readonly) CLLocationCoordinate2D coordinate;
@property (nonatomic, strong) NSString *flagName;
-(id)initWithTittle:(NSString*)titulo Andsub:(NSString*)subtitle And:(CLLocationCoordinate2D)coo and:(NSString*)flags;
- (UIImage *)thumbnail;  // blocks!

@end
