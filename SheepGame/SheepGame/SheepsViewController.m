//
//  SheepsViewController.m
//  SheepGame
//
//  Created by Pablo Roberto Carrera Estrada on 12/8/13.
//  Copyright (c) 2013 Pablo Roberto Carrera Estrada. All rights reserved.
//

#import "SheepsViewController.h"
#import "AskerViewController.h"
#import "SheepsView.h"
@interface SheepsViewController ()
@property (weak, nonatomic) IBOutlet SheepsView *skyNight;
@property (weak, nonatomic) IBOutlet UILabel *results;
@property (nonatomic) int total;
@property (nonatomic) int catched;
@property (weak, nonatomic) NSTimer *drainTimer;
@property (nonatomic)BOOL musicOn;
@end
#define DRAIN_DURATION 3.0
#define DRAIN_DELAY 1.0

@implementation SheepsViewController
#define DISH_CLEANING_INTERVAL 0.5

// drops a random food into the sink
// then reschedules itself by calling performSelector:withObject:afterDelay: with itself
// stops adding food (or rescheduling itself) if off screen

- (void)cleanDish
{
    if (self.skyNight.window) {
        [self addFood:0];
        [self performSelector:@selector(cleanDish) withObject:nil afterDelay:DISH_CLEANING_INTERVAL];
    }
}

- (void)startDrainTimer
{
    self.drainTimer = [NSTimer scheduledTimerWithTimeInterval:DRAIN_DURATION/3
                                                       target:self
                                                     selector:@selector(drain:)
                                                     userInfo:nil
                                                      repeats:YES];
}
- (void)drain:(NSTimer *)timer
{
    [self drain];
}
- (void)stopDrainTimer
{
    [self.drainTimer invalidate];
    self.drainTimer = nil;
}
-(void)viewDidLoad{
    NSString *music = [[NSBundle mainBundle]pathForResource:@"LullabyPiano" ofType:@"mp3"];
    song = [[AVAudioPlayer alloc]initWithContentsOfURL:[NSURL fileURLWithPath:music] error:NULL];
    song.delegate=self;
    song.numberOfLoops=-1;
    [song play];
}
- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    [self startDrainTimer];
    [self cleanDish];
}

// whenever we disappear, stop draining (cleaning dishes will stop itself)
// and stop drifting (having all views in the kitchen sink drift toward the center of the earth)

- (void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
    [self stopDrainTimer];
}

- (void)drain
{
    for (SheepsView *view in self.skyNight.subviews) {
        CGAffineTransform transform = view.transform;
        if (CGAffineTransformIsIdentity(transform)) {
            [UIView animateWithDuration:DRAIN_DURATION/3 delay:DRAIN_DELAY options:UIViewAnimationOptionCurveLinear animations:^{
                view.transform = CGAffineTransformRotate(CGAffineTransformScale(transform, 0.7, 0.7), 2*M_PI/3);
            } completion:^(BOOL finished) {
                if (finished) [UIView animateWithDuration:DRAIN_DURATION/3 delay:0 options:UIViewAnimationOptionCurveLinear animations:^{
                    view.transform = CGAffineTransformRotate(CGAffineTransformScale(transform, 0.4, 0.4), -2*M_PI/3);
                } completion:^(BOOL finished) {
                    if (finished) [UIView animateWithDuration:DRAIN_DURATION/3 delay:0 options:UIViewAnimationOptionCurveLinear animations:^{
                        view.transform = CGAffineTransformScale(transform, 0.1, 0.1);
                    } completion:^(BOOL finished) {
                        if (finished) [view removeFromSuperview];
                    }];
                }];
            }];
        }
    }
}
#define MOVE_DURATION 3.0
- (IBAction)tap:(UITapGestureRecognizer *)sender {
    
    CGPoint tapLocation = [sender locationInView:self.skyNight];
    for (SheepsView *view in self.skyNight.subviews) {
        if (CGRectContainsPoint(view.frame, tapLocation)) {
            [UIView animateWithDuration:MOVE_DURATION animations:^{
                
                [self setRandomLocationForView:view];
                view.transform = CGAffineTransformScale(CGAffineTransformIdentity, 0.99, 0.99);
            } completion:^(BOOL finished) {
                view.transform = CGAffineTransformIdentity;
               
            }];
            self.catched++;
            self.results.text = [NSString stringWithFormat:@"Total:%d  Catched:%d",self.total,self.catched];
            [view removeFromSuperview];
        }
    }
   
}

- (void)addFood:(int)food
{
    UILabel *foodLabel = [[UILabel alloc] init];
    foodLabel.text = @"🐑";
    foodLabel.backgroundColor = [UIColor clearColor];
    [self setRandomLocationForView:foodLabel];
    [self.skyNight addSubview:foodLabel];
    //[self drain];
}
- (void)setRandomLocationForView:(UIView *)view
{
    [view sizeToFit];
    CGRect sinkBounds = CGRectInset(self.skyNight.bounds, view.frame.size.width/2, view.frame.size.height/2);
    CGFloat x = arc4random() % (int)sinkBounds.size.width + view.frame.size.width/2;
    CGFloat y = arc4random() % (int)sinkBounds.size.height + view.frame.size.height/2;
    view.center = CGPointMake(x, y);
}
/*
 transfiero los datos entre los dos controladores
 
 */

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    
    if([segue.identifier isEqualToString:@"Settings"]){
        AskerViewController *asker = segue.destinationViewController;
        asker.question = @"How many Sheeps:";
    }
}
- (IBAction)cancelAsking:(UIStoryboardSegue *)segue
{
    for (SheepsView *view in self.skyNight.subviews) {
        [view removeFromSuperview];
    }
}
- (IBAction)doneAsking:(UIStoryboardSegue *)segue
{
    for (SheepsView *view in self.skyNight.subviews) {
        [view removeFromSuperview];
    }
    AskerViewController *asker = segue.sourceViewController;
    [self addFood:asker.answer];
    self.catched = 0;
    self.total = asker.answer;
    self.musicOn=asker.answerM;
    if (!self.musicOn) {
        [song pause];
    }else{
        [song play];
    }
    self.results.text = [NSString stringWithFormat:@"Total:%d  Catched:%d",self.total,self.catched];
    NSLog(@"answer %d",asker.answer);
    
}

@end
