//
//  Continents.h
//  TableCoreData
//
//  Created by Pablo Roberto Carrera Estrada on 11/14/13.
//  Copyright (c) 2013 Pablo Roberto Carrera Estrada. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>


@interface Continents : NSManagedObject

@property (nonatomic, retain) NSString * continentName;
@property (nonatomic, retain) NSSet *countries;
@end

@interface Continents (CoreDataGeneratedAccessors)

- (void)addCountriesObject:(NSManagedObject *)value;
- (void)removeCountriesObject:(NSManagedObject *)value;
- (void)addCountries:(NSSet *)values;
- (void)removeCountries:(NSSet *)values;

@end
