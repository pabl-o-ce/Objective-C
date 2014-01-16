//
//  FlagViewController.m
//  WorldCountries
//
//  Created by Pablo Roberto Carrera Estrada on 12/1/13.
//  Copyright (c) 2013 Pablo Roberto Carrera Estrada. All rights reserved.
//

#import "FlagViewController.h"
#import "MapViewController.h"

@interface FlagViewController ()<UIScrollViewDelegate>
@property (weak, nonatomic) IBOutlet UIScrollView *scrollView;
@property (strong,nonatomic) UIImageView *imageView;
@property (nonatomic, strong) MapViewController *mapvc;

@end

@implementation FlagViewController

- (void)setLocal:(CountryAnnotation *)local
{
    _local = local;
    self.title = self.local.title;
    _imageName = self.local.flagName;
    [self resetImage];
}

- (void) resetImage
{
    if (self.scrollView){
        self.scrollView.contentSize = CGSizeZero;
        
        UIImage *image = [UIImage imageNamed:self.imageName];
        if (image){
            self.scrollView.zoomScale = 1.0;
            self.scrollView.contentSize = image.size;
            self.imageView.image = image;
            self.imageView.frame = CGRectMake(0,0,image.size.width,image.size.height);
            
        }
    }
}

- (UIImageView *)imageView{
    
    if(!_imageView) {
        _imageView = [[UIImageView alloc] initWithFrame:CGRectZero];
    }
    return _imageView;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self.scrollView addSubview:self.imageView];
    self.scrollView.minimumZoomScale = 0.2;
    self.scrollView.maximumZoomScale = 2.0;
    self.scrollView.delegate = self;
    
    [self.mapvc.mapView addAnnotation:self.local];
    [self resetImage];
}

- (UIView *)viewForZoomingInScrollView:(UIScrollView *)scrollView
{
    return self.imageView;
}
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([segue.identifier isEqualToString:@"Embed Map of Photo"]) {
        if ([segue.destinationViewController isKindOfClass:[MapViewController class]]) {
            self.mapvc = segue.destinationViewController;
            [self.mapvc.mapView addAnnotation:self.local];
        }
    }
}


@end
