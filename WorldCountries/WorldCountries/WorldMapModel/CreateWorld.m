//
//  CreateWorld.m
//  WorldCountries
//
//  Created by Pablo Roberto Carrera Estrada on 11/30/13.
//  Copyright (c) 2013 Pablo Roberto Carrera Estrada. All rights reserved.
//

#import "CreateWorld.h"
#import "Continents.h"
#import "Countries.h"
#import "WorldAppDelegate.h"
@interface CreateWorld()
@property (nonatomic, retain) NSManagedObjectContext *managedObjectContext;

@end
@implementation CreateWorld
- (id)init {
    self = [super init];
    if (self) {
        
        WorldAppDelegate* appDelegate  = [UIApplication sharedApplication].delegate;
        self.managedObjectContext = appDelegate.managedObjectContext;
        
    }
    return self;
}
-(void)godCreateCivilization{
    
    [self createNewWorldWithContinentAndCountries];
}
-(void)createNewWorldWithContinentAndCountries{
    NSMutableArray *tempCountries=[[NSMutableArray alloc]init];
    NSMutableArray *tempLatitude=[[NSMutableArray alloc]init];
    NSMutableArray *tempLongitude=[[NSMutableArray alloc]init];
    //agrego africa y todo sus paises, latitudes al sqlite
    [tempCountries addObjectsFromArray:[self countriesFromContinent:(self.continents[0])]];
    [tempLatitude addObjectsFromArray:[self countriesLatitudeFromContinent:(self.continents[0])]];
    [tempLongitude addObjectsFromArray:[self countriesLongitudeFromContinent:(self.continents[0])]];
    [self createNewContinentWith:self.continents[0] With:tempCountries With:tempLatitude With:tempLongitude];
    [tempCountries removeAllObjects];
    [tempLatitude removeAllObjects];
    [tempLongitude removeAllObjects];
    //agrego asia y todo sus paises, latitudes al sqlite
    [tempCountries addObjectsFromArray:[self countriesFromContinent:(self.continents[1])]];
    [tempLatitude addObjectsFromArray:[self countriesLatitudeFromContinent:(self.continents[1])]];
    [tempLongitude addObjectsFromArray:[self countriesLongitudeFromContinent:(self.continents[1])]];
    [self createNewContinentWith:self.continents[1] With:tempCountries With:tempLatitude With:tempLongitude];
    [tempCountries removeAllObjects];
    [tempLatitude removeAllObjects];
    [tempLongitude removeAllObjects];
    //agrego europa y todo sus paises, latitudes al sqlite
    [tempCountries addObjectsFromArray:[self countriesFromContinent:(self.continents[2])]];
    [tempLatitude addObjectsFromArray:[self countriesLatitudeFromContinent:(self.continents[2])]];
    [tempLongitude addObjectsFromArray:[self countriesLongitudeFromContinent:(self.continents[2])]];
    [self createNewContinentWith:self.continents[2] With:tempCountries With:tempLatitude With:tempLongitude];
    [tempCountries removeAllObjects];
    [tempLatitude removeAllObjects];
    [tempLongitude removeAllObjects];
    //agrego norte america y todo sus paises, latitudes al sqlite
    [tempCountries addObjectsFromArray:[self countriesFromContinent:(self.continents[3])]];
    [tempLatitude addObjectsFromArray:[self countriesLatitudeFromContinent:(self.continents[3])]];
    [tempLongitude addObjectsFromArray:[self countriesLongitudeFromContinent:(self.continents[3])]];
    [self createNewContinentWith:self.continents[3] With:tempCountries With:tempLatitude With:tempLongitude];
    [tempCountries removeAllObjects];
    [tempLatitude removeAllObjects];
    [tempLongitude removeAllObjects];
    //agrego oceania y todo sus paises, latitudes al sqlite
    [tempCountries addObjectsFromArray:[self countriesFromContinent:(self.continents[4])]];
    [tempLatitude addObjectsFromArray:[self countriesLatitudeFromContinent:(self.continents[4])]];
    [tempLongitude addObjectsFromArray:[self countriesLongitudeFromContinent:(self.continents[4])]];
    [self createNewContinentWith:self.continents[4] With:tempCountries With:tempLatitude With:tempLongitude];
    [tempCountries removeAllObjects];
    [tempLatitude removeAllObjects];
    [tempLongitude removeAllObjects];
    //agrego sur america y todo sus paises, latitudes al sqlite
    [tempCountries addObjectsFromArray:[self countriesFromContinent:(self.continents[5])]];
    [tempLatitude addObjectsFromArray:[self countriesLatitudeFromContinent:(self.continents[5])]];
    [tempLongitude addObjectsFromArray:[self countriesLongitudeFromContinent:(self.continents[5])]];
    [self createNewContinentWith:self.continents[5] With:tempCountries With:tempLatitude With:tempLongitude];
    [tempCountries removeAllObjects];
    [tempLatitude removeAllObjects];
    [tempLongitude removeAllObjects];
}
-(void)createNewContinentWith:(NSString*)continentName With:(NSArray*)countries With:(NSArray*)latitude With:(NSArray*)longitude{
    
    Continents *newContinent = [NSEntityDescription
                                insertNewObjectForEntityForName:@"Continents"
                                inManagedObjectContext:self.managedObjectContext];
    
    
    newContinent.continentName = continentName;
     //NSLog(@"Successfully added continent: %@",newContinent.continentName);
    
    for (int i=0; i<[countries count]; i++) {
        Countries *newCountry = [NSEntityDescription
                                 insertNewObjectForEntityForName:@"Countries"
                                 inManagedObjectContext:self.managedObjectContext];
        
        newCountry.continents = newContinent;
        newCountry.countryName = countries[i];
        newCountry.latitude = latitude[i];
        newCountry.longitude = longitude[i];
        /* NSLog(@"Successfully added:\nContinent Name: %@\nCountry Name:%@\nCountry Latitude:%@\nCountry Longitude:%@\n",
                                                    newContinent.continentName,
                                                    newCountry.countryName,
                                                    newCountry.latitude,
                                                    newCountry.longitude);*/
        
    }
    NSError *error;
    if (![self.managedObjectContext save:&error]) {
        NSLog(@"Whoops, couldn't save: %@", [error localizedDescription]);
    }
    
}
-(NSArray*)continents{
    return @[@"Africa",@"Asia",@"Europe",@"North_America",@"Oceania",@"South_America"];
}
-(NSArray*)countriesFromContinent:(NSString*)continent{
    if ([continent isEqualToString:@"Africa"]) {
        return @[@"Algeria",@"Angola",@"Benin",@"Botswana",@"Burkina_Faso",@"Burundi",
                 @"C African Rep",@"Cameroon",@"Cape_Verde",@"Chad",@"Comoros",@"Côte_d'Ivoire",
                 @"Djibouti",@"DRO_Congo",@"Egypt",@"Eq._Guinea",@"Eritrea",@"Ethiopia",
                 @"Gabon",@"Gambia",@"Ghana",@"Guinea",@"Guinea_Bissau",@"Kenya",
                 @"Lesotho",@"Liberia",@"Libya",@"Madagascar",@"Malawi",@"Mali",
                 @"Mauritania",@"Mauritius",@"Morocco",@"Mozambique",@"Namibia",@"Niger",
                 @"Nigeria",@"RO_Congo",@"Rwanda",@"Sao_Tomé",@"Senegal",@"Seychelles",
                 @"Sierra_Leone",@"Somalia",@"South_Africa",@"Sudan",@"Swaziland",@"Tanzania",
                 @"Togo",@"Tunisia",@"Uganda",@"Zambia",@"Zimbabwe"];
    }else if ([continent isEqualToString:@"Asia"]){
        return @[@"Afghanistan",@"Armenia",@"Azerbaijan",@"Bahrain",@"Bangladesh",@"Bhutan",
                 @"Brunei",@"Cambodia",@"China",@"Christmas_Is",@"Georgia",@"Hong_Kong",
                 @"India",@"Indonesia",@"Iran",@"Iraq",@"Israel",@"Japan",
                 @"Jordan",@"Kazakhstan",@"Kuwait",@"Kyrgyztan",@"Laos",@"Labanon",
                 @"Macao",@"Malaysia",@"Maldives",@"Mongolia",@"Myanmar",@"Nepal",
                 @"North_Korea",@"Oman",@"Pakistan",@"Philippines",@"Qatar",@"Saudi_Arabia",
                 @"Singapore",@"South_Georgia",@"South_Korea",@"Sri_Lanka",@"Syria",@"Taiwan",
                 @"Tajikistan",@"Thailand",@"Tibet",@"Timor-Leste",@"Turkey",@"Turkmenistan",
                 @"UAE",@"Uzbekistan",@"Vietnam",@"Yemen"];
    }else if ([continent isEqualToString:@"Europe"]){
        return @[@"Albania",@"Andorra",@"Austria",@"Belarus",@"Belgium",@"Croatia",
                 @"Cyprus",@"Cyprus_North",@"Czech_Republic",@"Denmark",@"Estonia",@"Faroe_Islands",
                 @"Finland",@"France",@"Germany",@"Gibraltar",@"Greece",@"Greenland",
                 @"Hungary",@"Iceland",@"Ireland",@"Italy",@"Latvia",@"Liechtenstein",
                 @"Lithuania",@"Luxembourg",@"Macedonia",@"Malta",@"Moldova",@"Monaco",
                 @"Netherlands",@"Norway",@"Poland",@"Portugal",@"Romania",@"Russia",
                 @"San_Marino",@"Serbia",@"Slovakia",@"Slovenia",@"Spain",@"Sweeden",
                 @"Ukraine",@"United_Kingdom",@"Vatican_City"];
    }else if ([continent isEqualToString:@"North_America"]){
        return  @[@"Anguilla",@"Antigua",@"Aruba",@"Bahamas",@"Barbados",@"Belize",
                  @"Bermuda",@"Canada",@"Cayman_Is",@"Costa_Rica",@"Cuba",@"Dominica",
                  @"Dominican_Rep",@"El_Salvador",@"Grenada",@"Guatemala",@"Haiti",@"Honduras",
                  @"Jamaica",@"Martinique",@"Mexico",@"Montserrat",@"Nicaragua",@"Panama",
                  @"Puerto_Rico",@"Saint_Kitts",@"Saint_Lucia",@"Saint_Vicent",
                  @"Turks_Islands",@"US_Virgin_Is.",@"USA",@"Virgin_Islands"];
    }else if ([continent isEqualToString:@"Oceania"]){
        return  @[@"Am._Samoa",@"Australia",@"Cook_Islands",@"Fiji",@"Guam",@"Kiribati",
                  @"Marshall_Is",@"Micronesia",@"Nauru",@"New_Guinea",@"New_Zealand",@"Niue",
                  @"Norfolk_Island",@"Palau",@"Pitcairn_Islands",@"Samoa",@"Soloman_Is",@"Tonga",
                  @"Tuvalu",@"Vanuatu",@"Wallis_&_Futuna"];
    }else if ([continent isEqualToString:@"South_America"]){
        return @[@"Argentina",@"Bolivia",@"Brazil",@"Chile",@"Colombia",@"Dutch_Antilles",
                 @"Ecuador",@"Falkland_Is",@"Fr_Polynesia",@"Guyana",@"Paraguay",@"Peru",
                 @"Suriname",@"Trinidad",@"Uruguay",@"Venezuela"];
    }else{
        return @[@"The Dark Force Arrive"];
    }
    
}
-(NSArray*)countriesLatitudeFromContinent:(NSString*)continent{
    if ([continent isEqualToString:@"Africa"]) {
        return @[@36.75,@-8.84,@6.50,@-24.65,@12.37,@-3.38,
                 @4.36,@3.87,@14.93,@12.11,@-11.70,@7.53,
                 @11.59,@-4.32,@30.06,@3.75,@15.33,@9.02,
                 @0.39,@13.45,@5.56,@9.54,@11.86,@-1.28,
                 @-29.32,@6.30,@32.88,@-18.91,@-13.97,@12.65,
                 @18.09,@-20.16,@34.01,@-25.97,@-22.56,@13.51,
                 @9.07,@-4.27,@-1.95,@0.34,@14.69,@-4.62,
                 @8.48,@2.04,@-25.74,@15.55,@-26.32,@-6.17,
                 @6.14,@36.82,@0.32,@-15.41,@-17.83];
    }else if ([continent isEqualToString:@"Asia"]){
        return @[@34.53,@40.18,@40.38,@26.22,@23.71,@27.47,
                 @4.94,@11.56,@39.91,@-10.42,@41.69,@22.29,
                 @28.64,@-6.21,@35.69,@33.34,@35.23,@35.69,
                 @31.96,@51.18,@29.37,@42.87,@17.97,@33.89,
                 @22.20,@3.14,@4.17,@47.91,@19.75,@27.70,
                 @39.03,@23.61,@33.72,@14.60,@25.28,@24.69,
                 @1.29,@-54.28,@37.57,@6.93,@33.51,@25.05,
                 @38.54,@13.75,@31.70,@-8.81,@39.92,@37.95,
                 @24.47,@41.26,@21.02,@15.35];
    }else if ([continent isEqualToString:@"Europe"]){
        return @[@41.33,@42.51,@48.21,@53.90,@50.85,@45.81,
                 @35.01,@35.16,@50.09,@55.68,@59.44,@62.01,
                 @60.17,@48.85,@52.52,@36.14,@37.98,@64.18,
                 @47.50,@64.14,@53.33,@41.89,@56.95,@47.14,
                 @54.69,@49.61,@42.00,@35.90,@47.01,@43.73,
                 @52.37,@59.91,@52.23,@38.72,@44.43,@55.75,
                 @43.94,@44.80,@48.15,@46.05,@40.20,@59.33,
                 @50.45,@51.51,@41.90];
    }else if ([continent isEqualToString:@"North_America"]){
        return  @[@18.22,@17.12,@12.52,@25.06,@13.10,@17.25,
                  @32.39,@45.41,@19.29,@9.93,@23.13,@15.30,
                  @18.50,@13.69,@12.06,@14.64,@18.54,@14.08,
                  @18.00,@14.61,@19.43,@16.71,@12.13,@8.99,
                  @18.47,@17.29,@14.00,@13.16,
                  @21.46,@18.34,@38.90,@18.43];
    }else if ([continent isEqualToString:@"Oceania"]){
        return  @[@-14.28,@-35.28,@-21.21,@-18.14,@13.48,@1.33,
                  @7.09,@6.92,@166.93,@-6.27,@-41.29,@-19.06,
                  @-29.05,@7.50,@-25.07,@-13.83,@-9.43,@-21.13,
                  @-8.52,@-17.73,@-13.28];
    }else if ([continent isEqualToString:@"South_America"]){
        return @[@-34.61,@-19.03,@-15.78,@-33.46,@4.61,@17.92,
                 @-0.23,@-51.70,@-17.53,@6.80,@-25.30,@-12.04,
                 @5.87,@10.67,@-34.83,@10.49];
    }else{
        return @[@0.00];
    }
    
}
-(NSArray*)countriesLongitudeFromContinent:(NSString*)continent{
    if ([continent isEqualToString:@"Africa"]) {
        return @[@3.04,@13.23,@2.60,@25.91,@-1.53,@29.36,
                 @18.55,@11.72,@-23.51,@15.04,@43.26,@-5.56,
                 @43.15,@15.31,@31.25,@8.78,@38.93,@38.75,
                 @9.45,@-16.58,@-0.20,@-13.68,@-15.60,@36.82,
                 @27.48,@-10.80,@13.19,@47.54,@33.79,@-8.00,
                 @-15.98,@57.50,@-6.83,@32.58,@17.08,@2.11,
                 @7.48,@15.28,@30.06,@6.73,@-17.44,@55.45,
                 @-13.23,@45.34,@28.19,@32.53,@31.13,@35.74,
                 @1.21,@10.17,@32.58,@28.29,@31.05];
    }else if ([continent isEqualToString:@"Asia"]){
        return @[@69.17,@44.51,@49.89,@50.58,@90.41,@89.64,
                 @114.95,@104.92,@116.4,@105.68,@44.83,@114.16,
                 @77.22,@106.85,@51.42,@51.42,@31.77,@139.69,
                 @35.95,@71.45,@47.98,@74.59,@102.60,@35.49,
                 @113.55,@101.69,@73.51,@106.88,@96.13,@85.32,
                 @125.75,@58.59,@73.04,@120.68,@51.52,@46.72,
                 @103.85,@-36.51,@126.98,@79.85,@36.29,@121.53,
                 @68.78,@100.50,@88.15,@125.86,@32.85,@58.38,
                 @54.37,@69.22,@105.84,@44.21];
    }else if ([continent isEqualToString:@"Europe"]){
        return @[@19.82,@1.52,@16.37,@27.57,@4.35,@15.98,
                 @33.02,@33.36,@14.42,@12.57,@24.75,@-6.77,
                 @24.94,@2.35,@13.41,@-5.35,@23.72,@-51.72,
                 @19.04,@-21.90,@-6.25,@12.48,@24.11,@9.52,
                 @25.28,@6.13,@21.43,@14.51,@28.86,@7.42,
                 @4.89,@10.75,@21.01,@-9.13,@26.11,@37.62,
                 @12.45,@20.47,@17.11,@14.51,@-3.70,@18.06,
                 @30.52,@-0.13,@12.45];
    }else if ([continent isEqualToString:@"North_America"]){
        return  @[@-63.06,@-61.85,@-70.03,@-77.34,@-59.62,@-88.77,
                  @-64.78,@-75.70,@-81.37,@-84.08,@-82.38,@-61.39,
                  @-69.99,@-89.19,@-61.75,@-90.51,@-72.34,@-87.21,
                  @-76.79,@-61.07,@-99.13,@-62.21,@-86.25,@-79.52,
                  @-66.11,@-62.73,@-61.01,@-61.22,
                  @71.14,@-64.93,@-77.04,@-64.62];
    }else if ([continent isEqualToString:@"Oceania"]){
        return  @[@-170.70,@149.13,@-159.78,@178.44,@144.75,@172.98,
                  @171.38,@158.16,@-0.54,@143.94,@174.78,@-169.92,
                  @167.97,@134.62,@-130.10,@-171.77,@159.95,@-175.20,
                  @179.19,@168.32,@-176.17];
    }else if ([continent isEqualToString:@"South_America"]){
        return @[@-58.38,@-65.26,@-47.93,@-70.65,@-74.08,@-63.09,
                 @-78.52,@-57.85,@-149.57,@-58.16,@-57.64,@-77.03,
                 @-55.17,@-61.52,@-56.17,@-66.88];
    }else{
        return @[@0.00];
    }
    
}
-(void)deleteAllData{
    /* Create the fetch request first */
    NSFetchRequest *fetchRequest = [[NSFetchRequest alloc]
                                    initWithEntityName:@"Continents"];
    
    NSError *requestError = nil;
    
    /* And execute the fetch request on the context */
    NSArray *continent =
    [self.managedObjectContext executeFetchRequest:fetchRequest
                                             error:&requestError];
    
    /* Make sure we get the array */
    if ([continent count] > 0){
        
        /* Delete the last person in the array */
        for (int i=0; i<[continent count]; i++) {
            
            Continents *lastContinent = [continent objectAtIndex:i];
            
            [self.managedObjectContext deleteObject:lastContinent];
            if ([lastContinent isDeleted]){
                //NSLog(@"Successfully deleted the last continent...");
                
                NSError *savingError = nil;
                if ([self.managedObjectContext save:&savingError]){
                    //NSLog(@"Successfully deleted the context.");
                } else {
                    NSLog(@"Failed to save the context.");
                }
                
            } else {
                NSLog(@"Failed to delete the last continent.");
            }
        }
    }
    /* Create the fetch request first */
    NSFetchRequest *fetchRequest1 = [[NSFetchRequest alloc]
                                     initWithEntityName:@"Countries"];
    
    NSError *requestError1 = nil;
    
    /* And execute the fetch request on the context */
    NSArray *countries =
    [self.managedObjectContext executeFetchRequest:fetchRequest1
                                             error:&requestError1];
    
    /* Make sure we get the array */
    if ([countries count] > 0){
        
        /* Delete the last person in the array */
        for (int i=0; i<[countries count]; i++) {
            
            Countries *lastCountry = [countries objectAtIndex:i];
            
            [self.managedObjectContext deleteObject:lastCountry];
            if ([lastCountry isDeleted]){
                //NSLog(@"Successfully deleted the last continent...");
                
                NSError *savingError = nil;
                if ([self.managedObjectContext save:&savingError]){
                  //  NSLog(@"Successfully delete the context.");
                } else {
                    NSLog(@"Failed to save the context.");
                }
                
            } else {
                NSLog(@"Failed to delete the last continent.");
            }
        }
    }
}

@end
