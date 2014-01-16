//
//  ImageFlagsTVC.m
//  TableFlags
//
//  Created by Pablo Roberto Carrera Estrada on 11/2/13.
//  Copyright (c) 2013 Pablo Roberto Carrera Estrada. All rights reserved.
//

#import "ImageFlagsTVC.h"

@interface ImageFlagsTVC ()

@end

@implementation ImageFlagsTVC


- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    NSArray *temp = @[@"Argentina",@"Australia",@"Brazil",@"Canada",@"Chile",@"China",@"Ecuador",@"France",@"Germany",@"Ghana",@"Iceland",@"India",@"Ireland",@"Italy",@"Japan",@"Kenya",@"Malta",@"Mexico",@"Mongolia",@"Morocco",@"Mozambique",@"New_Zealand",@"Poland",@"Russia",@"Rwanda",@"South_Africa",@"Spain",@"Sweden",@"Turkey",@"United_Kingdom",@"United_States"];
    
	self.flags = [[NSMutableArray alloc] initWithArray:temp];
    [self.navigationItem setLeftBarButtonItem:self.editButtonItem
                                     animated:NO];
}



@end
