//
//  JogoResultViewController.m
//  Tres-en-Raya
//
//  Created by Pablo Roberto Carrera Estrada on 9/25/13.
//  Copyright (c) 2013 Pablo Roberto Carrera Estrada. All rights reserved.
//

#import "JogoResultViewController.h"
#import "JogoResult.h"
@interface JogoResultViewController ()
@property (weak, nonatomic) IBOutlet UITextView *display;
@property (nonatomic) SEL sortSelector; // added after lecture

@end

@implementation JogoResultViewController
-(void)updateUI{
    NSString *displayText = @"";
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init]; // added after lecture
    [formatter setDateStyle:NSDateFormatterShortStyle];          // added after lecture
    [formatter setTimeStyle:NSDateFormatterShortStyle];          // added after lecture
    // for (GameResult *result in [GameResult allGameResults]) { // version in lecture
    for (JogoResult *result in [[JogoResult allJogoResults] sortedArrayUsingSelector:self.sortSelector]) {
        displayText = [displayText stringByAppendingFormat:@"Jogador ☤\nGano %d\nPerdio %d\n(%@, %0g)\n\n", result.ganados, result.perdidos, [formatter stringFromDate:result.end], round(result.duration)];
    }
    self.display.text = displayText;
}
-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
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

#pragma mark - Sorting

@synthesize sortSelector = _sortSelector;  // because we implement BOTH setter and getter

// return default sort selector if none set (by score)

- (SEL)sortSelector
{
    if (!_sortSelector) _sortSelector = @selector(compareEndDateToGameResult:);
    return _sortSelector;
}

// update the UI when changing the sort selector

- (void)setSortSelector:(SEL)sortSelector
{
    _sortSelector = sortSelector;
    [self updateUI];
}

- (IBAction)sortByDate
{
    self.sortSelector = @selector(compareEndDateToGameResult:);
}
- (IBAction)sortByGanados
{
    self.sortSelector = @selector(compareGanadosToGameResult:);
}
- (IBAction)sortByPerdidos
{
    self.sortSelector = @selector(comparePerdidosToGameResult:);
}


- (IBAction)sortByDuration
{
    self.sortSelector = @selector(compareDurationToGameResult:);
}

@end
