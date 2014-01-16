//
//  Countries.h
//  TableCoreData
//
//  Created by Pablo Roberto Carrera Estrada on 11/14/13.
//  Copyright (c) 2013 Pablo Roberto Carrera Estrada. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class Continents;

@interface Countries : NSManagedObject

@property (nonatomic, retain) NSString * countryName;
@property (nonatomic, retain) Continents *continents;

@end
