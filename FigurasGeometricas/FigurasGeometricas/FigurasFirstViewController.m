//
//  FigurasFirstViewController.m
//  FigurasGeometricas
//
//  Created by Pablo Roberto Carrera Estrada on 9/28/13.
//  Copyright (c) 2013 Pablo Roberto Carrera Estrada. All rights reserved.
//

#import "FigurasFirstViewController.h"
@interface FigurasFirstViewController ()
@property (weak, nonatomic) IBOutlet UISegmentedControl *figuraSelector;
@property (weak, nonatomic) IBOutlet UISegmentedControl *fondoSelector;
@property (weak, nonatomic) IBOutlet UISegmentedControl *rellenoSelector;
@property (weak, nonatomic) IBOutlet UISegmentedControl *bordeSelector;
@property (weak, nonatomic) IBOutlet UILabel *text;
@property (nonatomic)int fig;
@property (nonatomic)int fondoColor;
@property (nonatomic)int rellenoColor;
@property (nonatomic)int bordeColor;
@end

@implementation FigurasFirstViewController


- (IBAction)tipoFigura:(UISegmentedControl *)sender {
    int n=[sender selectedSegmentIndex];
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    [defaults setInteger:n forKey:@"tipoFigura"];
    [defaults synchronize];
}
- (IBAction)colorFondo:(UISegmentedControl *)sender {
    int n =[sender selectedSegmentIndex];
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    [defaults setInteger:n forKey:@"colorFondo"];
    [defaults synchronize];
}
- (IBAction)colorRelleno:(UISegmentedControl *)sender {
    int n=[sender selectedSegmentIndex];
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    [defaults setInteger:n forKey:@"colorRelleno"];
    [defaults synchronize];
}
- (IBAction)colorBorde:(UISegmentedControl *)sender {
    int n=[sender selectedSegmentIndex];
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    [defaults setInteger:n forKey:@"colorBorde"];
    [defaults synchronize];
}
-(void)updateUI{
    self.figuraSelector.selectedSegmentIndex = self.fig;
    self.fondoSelector.selectedSegmentIndex = self.fondoColor;
    self.rellenoSelector.selectedSegmentIndex = self.rellenoColor;
    self.bordeSelector.selectedSegmentIndex = self.bordeColor;
}
-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    _fig = [defaults integerForKey:@"tipoFigura"];
    _fondoColor=[defaults integerForKey:@"colorFondo"];
    _rellenoColor=[defaults integerForKey:@"colorRelleno"];
    _bordeColor=[defaults integerForKey:@"colorBorde"];
    [self updateUI];
}
-(void)setup{
    [self updateUI];
    
}
-(void) awakeFromNib{
    [self setup];
}
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    [self setup];
    return self;
}

@end
