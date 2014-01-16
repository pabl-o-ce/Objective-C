//
//  CountryAnnotation.m
//  WorldCountries
//
//  Created by Pablo Roberto Carrera Estrada on 11/30/13.
//  Copyright (c) 2013 Pablo Roberto Carrera Estrada. All rights reserved.
//

#import "CountryAnnotation.h"

@implementation CountryAnnotation
@synthesize title, subtitle, coordinate, flagName;

-(id)initWithTittle:(NSString*)titulo Andsub:(NSString*)subtitulo And:(CLLocationCoordinate2D)coo and:(NSString*)flags{
    self = [super init];
    if (self) {
        //coordinate = coord;
        title=titulo;
        subtitle=subtitulo;
        coordinate = coo;
        flagName = flags;
        
    }
    return self;
}
- (UIImage *)thumbnail
{
    return [UIImage imageWithData:[NSData dataWithContentsOfURL:[NSURL URLWithString:self.flagName]]];
}
@end
