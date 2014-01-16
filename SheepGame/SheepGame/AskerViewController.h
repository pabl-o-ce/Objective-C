//
//  AskerViewController.h
//  SheepGame
//
//  Created by Pablo Roberto Carrera Estrada on 12/8/13.
//  Copyright (c) 2013 Pablo Roberto Carrera Estrada. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AskerViewController : UIViewController
@property (strong,nonatomic) NSString *question;
@property (nonatomic,readonly) int answer;
@property (nonatomic,readonly) BOOL answerM;

@end
