//
//  JogoResult.h
//  Tres-en-Raya
//
//  Created by Pablo Roberto Carrera Estrada on 9/25/13.
//  Copyright (c) 2013 Pablo Roberto Carrera Estrada. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface JogoResult : NSObject
+(NSArray *)allJogoResults;//of jogo result
@property (readonly, nonatomic)NSDate *start;
@property (readonly, nonatomic)NSDate *end;
@property (readonly, nonatomic)NSTimeInterval duration;
@property (nonatomic)int ganados;
@property (nonatomic)int perdidos;
- (NSComparisonResult)compareGanadosToGameResult:(JogoResult *)otherResult;
- (NSComparisonResult)comparePerdidosToGameResult:(JogoResult *)otherResult;
- (NSComparisonResult)compareEndDateToGameResult:(JogoResult *)otherResult;
- (NSComparisonResult)compareDurationToGameResult:(JogoResult *)otherResult;

@end
