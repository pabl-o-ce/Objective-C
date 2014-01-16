//
//  CreateWorld.h
//  WorldCountries
//
//  Created by Pablo Roberto Carrera Estrada on 11/30/13.
//  Copyright (c) 2013 Pablo Roberto Carrera Estrada. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CreateWorld : NSObject

@property (nonatomic, strong) NSArray *continents;
@property (nonatomic, strong) NSArray *countries;
@property (nonatomic, strong) NSArray *longitude;
@property (nonatomic, strong) NSArray *latitude;

-(void)createNewWorldWithContinentAndCountries;
-(void)createNewContinentWith:(NSString*)continentName With:(NSArray*)countries With:(NSArray*)latitude With:(NSArray*)longitude;
-(void)deleteAllData;
-(void)godCreateCivilization;
@end
