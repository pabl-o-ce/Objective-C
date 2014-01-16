//
//  PopInfoViewController.m
//  TableCoreData
//
//  Created by Pablo Roberto Carrera Estrada on 11/15/13.
//  Copyright (c) 2013 Pablo Roberto Carrera Estrada. All rights reserved.
//

#import "PopInfoViewController.h"

@interface PopInfoViewController ()
@property (weak, nonatomic) IBOutlet UITextView *Viewtext;

@end

@implementation PopInfoViewController

- (void)setText:(NSAttributedString *)text
{
    _text = text;
    self.Viewtext.attributedText = text;
}
- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    self.Viewtext.attributedText = self.text;
}
- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    self.Viewtext.attributedText = self.text;
}


@end
