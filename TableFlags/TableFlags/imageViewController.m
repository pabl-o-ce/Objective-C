//
//  imageViewController.m
//  TableFlags
//
//  Created by Pablo Roberto Carrera Estrada on 11/2/13.
//  Copyright (c) 2013 Pablo Roberto Carrera Estrada. All rights reserved.
//

#import "imageViewController.h"
#import "PopInfoViewController.h"
@interface imageViewController () <UIScrollViewDelegate>

@property (strong, nonatomic) IBOutlet UIScrollView *scrollView;
@property (strong, nonatomic) UIImageView *imageView;
@property (strong, nonatomic) UIPopoverController *flagCountryPopover;
@end

@implementation imageViewController

- (BOOL)shouldPerformSegueWithIdentifier:(NSString *)identifier sender:(id)sender
{
    if ([identifier isEqualToString:@"FlagCountry"]) {
        return (self.imageURL && !self.flagCountryPopover.popoverVisible) ? YES : NO;
    } else {
        return [super shouldPerformSegueWithIdentifier:identifier sender:sender];
    }
}
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([segue.identifier isEqualToString:@"FlagCountry"]) {
        if ([segue.destinationViewController isKindOfClass:[PopInfoViewController class]]) {
            
            PopInfoViewController *temp = (PopInfoViewController *)segue.destinationViewController;
            temp.text = [[NSAttributedString alloc] initWithString: self.name];
            
            if ([segue isKindOfClass:[UIStoryboardPopoverSegue class]]) {
                self.flagCountryPopover = ((UIStoryboardPopoverSegue *)segue).popoverController;
            }
        }
    }
}
-(void)setImageURL:(NSURL *)imageURL{
    _imageURL = imageURL;
    
    [self resetImage];
    
}

-(UIImageView *)imageView{
    if(!_imageView) _imageView = [[UIImageView alloc]initWithFrame:CGRectZero];
    
    return _imageView;
}
- (void)resetImage
{
    if (self.scrollView) {
        
        self.scrollView.contentSize = CGSizeZero;
        self.imageView.image = nil;
        
        NSData *imageData = [[NSData alloc] initWithContentsOfURL:self.imageURL];
        UIImage *image = [[UIImage alloc] initWithData:imageData];
        if (image) {
            self.scrollView.zoomScale = 1.0;
            self.scrollView.contentSize = image.size;
            self.imageView.image = image;
            self.imageView.frame = CGRectMake(0, 100, image.size.width, image.size.height);
        }
    }
}
- (UIView *)viewForZoomingInScrollView:(UIScrollView *)scrollView
{
    return self.imageView;
}
- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
	[self.scrollView addSubview:self.imageView];
    self.scrollView.minimumZoomScale = 0.5;
    self.scrollView.maximumZoomScale = 2.0;
    self.scrollView.delegate = self;
    [self resetImage];
}



@end
