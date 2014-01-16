//
//  FigurasSecondViewController.m
//  FigurasGeometricas
//
//  Created by Pablo Roberto Carrera Estrada on 9/28/13.
//  Copyright (c) 2013 Pablo Roberto Carrera Estrada. All rights reserved.
//

#import "FigurasSecondViewController.h"
#import "FigurasView.h"
#import <QuartzCore/QuartzCore.h>
@interface FigurasSecondViewController ()
@property (nonatomic)int fig;
@property (nonatomic)int fondoColor;
@property (nonatomic)int rellenoColor;
@property (nonatomic)int bordeColor;
@property (weak, nonatomic) IBOutlet FigurasView *frame;
@property (strong, nonatomic) IBOutlet UIPinchGestureRecognizer *pinchGestureRecognizer;
@property (nonatomic, unsafe_unretained) CGFloat currentScale;
@end

@implementation FigurasSecondViewController

- (IBAction)handlePinches:(UIPinchGestureRecognizer *)paramSender {
    if (paramSender.state == UIGestureRecognizerStateEnded){
        self.currentScale = paramSender.scale;
    } else if (paramSender.state == UIGestureRecognizerStateBegan &&
               self.currentScale != 0.0f){
        paramSender.scale = self.currentScale;
    }
    
    if (paramSender.scale != NAN &&
        paramSender.scale != 0.0){
        paramSender.view.transform =
        CGAffineTransformMakeScale(paramSender.scale,
                                   paramSender.scale);
    }
    [self updateUI];
}
-(void)setFiguraView:(FigurasView *)frame{
    _frame=frame;
}
-(void)updateUI{
    [self.frame setTipoFigura:self.fig];
    [self.frame setColorFondos:self.fondoColor];
    [self.frame setColorRellenos:self.rellenoColor];
    [self.frame setColorBordes:self.bordeColor];
    
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
- (void)viewDidLoad {
    [super viewDidLoad];
    /* Create the Pinch Gesture Recognizer */
    self.pinchGestureRecognizer =  [[UIPinchGestureRecognizer alloc]
                                    initWithTarget:self
                                    action:@selector(handlePinches:)];
    /* Add this gesture recognizer to our view */
    [self.frame
     addGestureRecognizer:self.pinchGestureRecognizer];
    
}
@end
