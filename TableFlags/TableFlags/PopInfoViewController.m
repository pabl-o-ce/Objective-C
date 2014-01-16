//
//  PopInfoViewController.m
//  TableFlags
//
//  Created by Pablo Roberto Carrera Estrada on 11/3/13.
//  Copyright (c) 2013 Pablo Roberto Carrera Estrada. All rights reserved.
//

#import "PopInfoViewController.h"

@interface PopInfoViewController ()
@property (weak, nonatomic) IBOutlet UITextView *textView;

@end

@implementation PopInfoViewController

- (void)setText:(NSAttributedString *)text
{
    _text = text;
    self.textView.attributedText = text;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    self.textView.attributedText = self.text;
}


@end
