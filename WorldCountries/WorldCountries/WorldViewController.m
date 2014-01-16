//
//  WorldViewController.m
//  WorldCountries
//
//  Created by Pablo Roberto Carrera Estrada on 11/29/13.
//  Copyright (c) 2013 Pablo Roberto Carrera Estrada. All rights reserved.
//

#import "WorldViewController.h"
#import "CreateWorld.h"
#import "Continents.h"
#import "Countries.h"
#import "WorldAppDelegate.h"
#import "CountryAnnotation.h"
@interface WorldViewController ()
@property (weak, nonatomic) IBOutlet UISegmentedControl *Choose;
@property (strong,nonatomic)NSMutableArray *annotationArray;
@end

@implementation WorldViewController
-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    
}
- (IBAction)chooseContinent:(UISegmentedControl *)sender {
    NSString *choose;
    int n=[sender selectedSegmentIndex];
    if(n==0){
        [self.display removeAllObjects];
        choose=@"America";
        [self getWorldCivilizationCountriesWith:choose];
        [self.mapView removeAnnotations:self.annotationArray];
        [self.annotationArray removeAllObjects];
        [self addCountriesAnnotation];
    }
    if(n==1){
        [self.display removeAllObjects];
        choose=@"Europe";
        [self getWorldCivilizationCountriesWith:choose];
        [self.mapView removeAnnotations:self.annotationArray];
        [self.annotationArray removeAllObjects];
        [self addCountriesAnnotation];
    }
    if(n==2){
        [self.display removeAllObjects];
        choose=@"Africa";
        [self getWorldCivilizationCountriesWith:choose];
        [self.mapView removeAnnotations:self.annotationArray];
        [self.annotationArray removeAllObjects];
        [self addCountriesAnnotation];
    }
    if(n==3){
        [self.display removeAllObjects];
        choose=@"Asia";
        [self getWorldCivilizationCountriesWith:choose];
        [self.mapView removeAnnotations:self.annotationArray];
        [self.annotationArray removeAllObjects];
        [self addCountriesAnnotation];
    }
    if(n==4){
        [self.display removeAllObjects];
        choose=@"Oceania";
        [self getWorldCivilizationCountriesWith:choose];
        [self.mapView removeAnnotations:self.annotationArray];
        [self.annotationArray removeAllObjects];
        [self addCountriesAnnotation];
    }
    
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.display = [[NSMutableArray alloc]init];
    
	// Do any additional setup after loading the view, typically from a nib.
    self.view.backgroundColor = [UIColor whiteColor];
    self.mapView = [[MKMapView alloc]
                      initWithFrame:self.view.bounds];
    self.mapView.delegate = self;
    /* Set the map type to Satellite */
    self.mapView.mapType = MKMapTypeStandard;
    self.mapView.autoresizingMask =
    UIViewAutoresizingFlexibleWidth |
    UIViewAutoresizingFlexibleHeight;
    
    /* Add it to our view */
    [self.view addSubview:self.mapView];
    CreateWorld *god = [[CreateWorld alloc]init];
    [god deleteAllData];
    [god godCreateCivilization];
    
    NSString *choose=@"America";
    [self getWorldCivilizationCountriesWith:choose];
    [self addCountriesAnnotation];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(void)addCountriesAnnotation{
    self.annotationArray = [[NSMutableArray alloc]init];
    NSInteger i;
    for(i=0;i<[self.display count];i++){//[self.countriesDisplay count]
        Countries *rafa = (Countries*)self.display[i];
        CLLocationCoordinate2D tlp;
        tlp.latitude = [rafa.latitude doubleValue];
        tlp.longitude = [rafa.longitude doubleValue];
        CountryAnnotation *wkAnnotation = [[CountryAnnotation alloc]initWithTittle:rafa.countryName Andsub:rafa.continents.continentName And:tlp and:[NSString stringWithFormat:@"%@-%@.png",rafa.continents.continentName,rafa.countryName]];
        [self.annotationArray addObject:wkAnnotation];
        //NSLog(@"%d",[self.display count]);
        //[self.mapView addAnnotation:wkAnnotation];
    }
    
    
    [self.mapView addAnnotations:self.annotationArray];
    //[self.mapView setSelectedAnnotations:annotationArray];
    
}
-(void)getWorldCivilizationCountriesWith:(NSString*)conti{
    
    WorldAppDelegate* appDelegate = [UIApplication sharedApplication].delegate;
    NSArray *continentes = [[NSArray alloc]initWithArray:[appDelegate getAllContinentsCountries]];
    
     /* Make sure we get the array */
    if ([continentes count] > 0){
        for (Continents *wkcontinentes in continentes){
            if ([wkcontinentes.continentName isEqualToString:@"Africa"]&&[conti isEqualToString:@"Africa"]) {
                NSLog(@"con %@",wkcontinentes.continentName);
                NSArray *paises = [[NSArray alloc]initWithArray:[wkcontinentes.countries allObjects]];
                for (int j=0; j<[paises count]; j++) {
                    Countries* pais = (Countries*)paises[j];
                    [self.display  addObject:pais];
                    NSLog(@"pais %@ con %@",pais.countryName, pais.continents.continentName);
                }
            }
            if ([wkcontinentes.continentName isEqualToString:@"Asia"]&&[conti isEqualToString:@"Asia"]) {
                NSLog(@"con %@",wkcontinentes.continentName);
                NSArray *paises = [[NSArray alloc]initWithArray:[wkcontinentes.countries allObjects]];
                for (int j=0; j<[paises count]; j++) {
                    Countries* pais = (Countries*)paises[j];
                    [self.display  addObject:pais];
                    NSLog(@"pais %@ con %@",pais.countryName, pais.continents.continentName);
                }
            }
            if ([wkcontinentes.continentName isEqualToString:@"Europe"]&&[conti isEqualToString:@"Europe"]) {
                NSLog(@"con %@",wkcontinentes.continentName);
                NSArray *paises = [[NSArray alloc]initWithArray:[wkcontinentes.countries allObjects]];
                for (int j=0; j<[paises count]; j++) {
                    Countries* pais = (Countries*)paises[j];
                    [self.display  addObject:pais];
                    NSLog(@"pais %@ con %@",pais.countryName, pais.continents.continentName);
                }
            }
            if ([wkcontinentes.continentName isEqualToString:@"Oceania"]&&[conti isEqualToString:@"Oceania"]) {
                NSLog(@"con %@",wkcontinentes.continentName);
                NSArray *paises = [[NSArray alloc]initWithArray:[wkcontinentes.countries allObjects]];
                for (int j=0; j<[paises count]; j++) {
                    Countries* pais = (Countries*)paises[j];
                    [self.display  addObject:pais];
                    NSLog(@"pais %@ con %@",pais.countryName, pais.continents.continentName);
                }
            }
            if([conti isEqualToString:@"America"]){
                if ([wkcontinentes.continentName isEqualToString:@"North_America"]) {
                    NSLog(@"con %@",wkcontinentes.continentName);
                    NSArray *paises = [[NSArray alloc]initWithArray:[wkcontinentes.countries allObjects]];
                    for (int j=0; j<[paises count]; j++) {
                        Countries* pais = (Countries*)paises[j];
                        [self.display  addObject:pais];
                        NSLog(@"pais %@ con %@",pais.countryName, pais.continents.continentName);
                    }
                }
                if ([wkcontinentes.continentName isEqualToString:@"South_America"]) {
                    NSLog(@"con %@",wkcontinentes.continentName);
                    NSArray *paises = [[NSArray alloc]initWithArray:[wkcontinentes.countries allObjects]];
                    for (int j=0; j<[paises count]; j++) {
                        Countries* pais = (Countries*)paises[j];
                        [self.display  addObject:pais];
                        NSLog(@"pais %@ con %@",pais.countryName, pais.continents.continentName);
                    }
                }
            }
        }//[self.display addObject:thisCountry];
        /*[continentName isEqualToString:@"Africa"]&&
        for (Countries *thisCountry in continentes){
            [self.display addObject:thisCountry];
            //[self.countriesDisplay addObject:thisCountry.countryName];
            //[self.continentsDisplay addObject:thisCountry.continents.continentName];
            //[self.latitudeDisplay addObject:thisCountry.latitude];
            //[self.longitudeDisplay addObject:thisCountry.longitude];
            //NSString *p=[[NSString alloc]initWithFormat:@"%@-%@.png",thisCountry.continents.continentName,thisCountry.countryName];
            //[self.flagDisplay addObject:p];
            
        }
        */
    } else {
        NSLog(@"Could not find any thisCountry entities in the context.");
    }
    
}
- (void)mapView:(MKMapView *)mapView didSelectAnnotationView:(MKAnnotationView *)view
{
    if ([view.leftCalloutAccessoryView isKindOfClass:[UIImageView class]]) {
        UIImageView *imageView = (UIImageView *)(view.leftCalloutAccessoryView);
        CountryAnnotation *wkAnnotation = view.annotation;
        imageView.image = [UIImage imageNamed:[NSString stringWithFormat:@"%@",wkAnnotation.flagName]];
    }
}
- (MKAnnotationView *)mapView:(MKMapView *)mapView viewForAnnotation:(id<MKAnnotation>)annotation
{
    static NSString *reuseId = @"FlagViewController";
    MKAnnotationView *view = [mapView dequeueReusableAnnotationViewWithIdentifier:reuseId];
    if (!view) {
        view = [[MKPinAnnotationView alloc] initWithAnnotation:annotation reuseIdentifier:reuseId];
        view.canShowCallout = YES;
        if ([mapView.delegate respondsToSelector:@selector(mapView:annotationView:calloutAccessoryControlTapped:)]) {
            view.rightCalloutAccessoryView = [UIButton buttonWithType:UIButtonTypeDetailDisclosure];
        }
        view.leftCalloutAccessoryView = [[UIImageView alloc] initWithFrame:CGRectMake(0,0,30,30)];
    }
    
    if ([view.leftCalloutAccessoryView isKindOfClass:[UIImageView class]]) {
        UIImageView *imageView = (UIImageView *)(view.leftCalloutAccessoryView);
        imageView.image = nil;
    }
    
    return view;
}
- (void)mapView:(MKMapView *)mapView annotationView:(MKAnnotationView *)view calloutAccessoryControlTapped:(UIControl *)control
{
    [self performSegueWithIdentifier:@"setLocal:" sender:view];
}
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([segue.identifier isEqualToString:@"setLocal:"]) {
        if ([sender isKindOfClass:[MKAnnotationView class]]) {
            MKAnnotationView *aView = sender;
            if ([aView.annotation isKindOfClass:[CountryAnnotation class]]) {
                CountryAnnotation *city = aView.annotation;
                if ([segue.destinationViewController respondsToSelector:@selector(setLocal:)]) {
                    
                    
                    [segue.destinationViewController performSelector:@selector(setLocal:) withObject:city];
                    [segue.destinationViewController setTitle:city.title];
                }
            }
        }
    }
}


@end
