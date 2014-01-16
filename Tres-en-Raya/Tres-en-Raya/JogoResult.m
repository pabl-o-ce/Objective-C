//
//  JogoResult.m
//  Tres-en-Raya
//
//  Created by Pablo Roberto Carrera Estrada on 9/25/13.
//  Copyright (c) 2013 Pablo Roberto Carrera Estrada. All rights reserved.
//

#import "JogoResult.h"
@interface JogoResult()
@property (readwrite, nonatomic)NSDate *start;
@property (readwrite, nonatomic)NSDate *end;
@end
@implementation JogoResult
#define ALL_RESULTS_KEY @"JogoResult_All"
#define START_KEY @"StartDate"
#define END_KEY @"EndDate"
#define GANADOS_KEY @"Ganados"
#define PERDIDOS_KEY @"Perdidos"
+(NSArray *)allJogoResults{
    NSMutableArray *allJogoResults = [[NSMutableArray alloc]init];
    for (id plist in [[[NSUserDefaults standardUserDefaults]dictionaryForKey:ALL_RESULTS_KEY]allValues]) {
        JogoResult *result = [[JogoResult alloc]initFromPropertyList:plist];
        [allJogoResults addObject:result];
    }
    return allJogoResults;
}
-(id)initFromPropertyList:(id)plist{
    self = [self init];
    if (self) {
        if ([plist isKindOfClass:[NSDictionary class]]) {
            NSDictionary *resultDictionary = (NSDictionary *)plist;
            _start = resultDictionary[START_KEY];
            _end = resultDictionary[END_KEY];
            _ganados = [resultDictionary[GANADOS_KEY]intValue];
            _perdidos = [resultDictionary[PERDIDOS_KEY]intValue];
            if (!_start || !_end) {
                self = nil;
            }
        }
    }
    return self;
}
-(void)clearUserDefaultsData{
    NSString *appDomain = [[NSBundle mainBundle] bundleIdentifier];
    [[NSUserDefaults standardUserDefaults] removePersistentDomainForName:appDomain];
}
-(void)synchronize{
    NSMutableDictionary *mutableJogoResultsFromUserDefaults = [[[NSUserDefaults standardUserDefaults]dictionaryForKey:ALL_RESULTS_KEY]mutableCopy];
    if(!mutableJogoResultsFromUserDefaults) mutableJogoResultsFromUserDefaults = [[NSMutableDictionary alloc]init];
    mutableJogoResultsFromUserDefaults[[self.start description]] = [self asPropertyList];
    [[NSUserDefaults standardUserDefaults]setObject:mutableJogoResultsFromUserDefaults forKey:ALL_RESULTS_KEY];
    [[NSUserDefaults standardUserDefaults]synchronize];
}
-(id)asPropertyList{
    return @{START_KEY : self.start, END_KEY : self.end, GANADOS_KEY : @(self.ganados), PERDIDOS_KEY : @(self.perdidos)};
}
-(id)init
{
    self = [super init];
    if(self){
        _start = [NSDate date];
        _end = _start;
    }
    return self;
}
-(NSTimeInterval)duration{
    return [self.end timeIntervalSinceDate:self.start];
}
-(void)setGanados:(int)ganados{
    _ganados = ganados;
    self.end = [NSDate date];
    [self synchronize];
}
-(void)setPerdidos:(int)perdidos{
    _perdidos=perdidos;
    self.end=[NSDate date];
    [self synchronize];
}
- (NSComparisonResult)compareGanadosToGameResult:(JogoResult *)otherResult
{
    if (self.ganados > otherResult.ganados) {
        return NSOrderedAscending;
    } else if (self.ganados < otherResult.ganados) {
        return NSOrderedDescending;
    } else {
        return NSOrderedSame;
    }
}

- (NSComparisonResult)comparePerdidosToGameResult:(JogoResult *)otherResult
{
    if (self.perdidos > otherResult.perdidos) {
        return NSOrderedAscending;
    } else if (self.perdidos < otherResult.perdidos) {
        return NSOrderedDescending;
    } else {
        return NSOrderedSame;
    }
}

- (NSComparisonResult)compareEndDateToGameResult:(JogoResult *)otherResult
{
    return [otherResult.end compare:self.end];
}

- (NSComparisonResult)compareDurationToGameResult:(JogoResult *)otherResult
{
    if (self.duration > otherResult.duration) {
        return NSOrderedDescending;
    } else if (self.duration < otherResult.duration) {
        return NSOrderedAscending;
    } else {
        return NSOrderedSame;
    }
}
@end
