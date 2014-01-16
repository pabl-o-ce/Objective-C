//
//  AskerViewController.m
//  SheepGame
//
//  Created by Pablo Roberto Carrera Estrada on 12/8/13.
//  Copyright (c) 2013 Pablo Roberto Carrera Estrada. All rights reserved.
//

#import "AskerViewController.h"

@interface AskerViewController ()
@property (weak, nonatomic) IBOutlet UILabel *questionLabel;
@property (weak, nonatomic) IBOutlet UISlider *answerSlider;
@property (weak, nonatomic) IBOutlet UILabel *displaySliderValue;
@property (weak, nonatomic) IBOutlet UISwitch *musicSwitch;

@end

@implementation AskerViewController
- (IBAction)displaySliderOnScreen {
    int n = self.answerSlider.value;
    self.displaySliderValue.text = [NSString stringWithFormat:@"%d 🐑",n];
}

-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    self.questionLabel.text=self.question;
    self.answerSlider.value =1;
    [self.answerSlider becomeFirstResponder];
}
-(int)answer{
    return self.answerSlider.value;
}
-(BOOL)answerM{
    return [self.musicSwitch isOn];
}
@end
