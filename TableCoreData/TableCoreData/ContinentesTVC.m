//
//  ContinentesTVC.m
//  TableCoreData
//
//  Created by Pablo Roberto Carrera Estrada on 11/15/13.
//  Copyright (c) 2013 Pablo Roberto Carrera Estrada. All rights reserved.
//

#import "ContinentesTVC.h"
#import "ContinentesAppDelegate.h"
#import "Countries.h"
#import "Continents.h"

@interface ContinentesTVC ()<UITableViewDelegate, UITableViewDataSource>
@property (nonatomic, retain) NSManagedObjectContext *managedObjectContext;


@end

@implementation ContinentesTVC

-(void)setContinents:(NSMutableArray *)continentes
{
    _continents = continentes;
    [self.tableView reloadData];
    
}


- (void)viewDidLoad
{
    [super viewDidLoad];
    ContinentesAppDelegate* appDelegate  = [UIApplication sharedApplication].delegate;
    self.managedObjectContext = appDelegate.managedObjectContext;
    [self deleteAllData];
    [self createNewContinentWithCountries];

    //[self.tableView reloadData];
    [self loadContinentsData];
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
 
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;

    
    
}
#pragma mark - UISplitViewControllerDelegate

- (void)awakeFromNib
{
    self.splitViewController.delegate = self;
}

- (BOOL)splitViewController:(UISplitViewController *)svc
   shouldHideViewController:(UIViewController *)vc
              inOrientation:(UIInterfaceOrientation)orientation
{
    //return UIInterfaceOrientationIsPortrait(orientation);
    return NO;
}

#pragma mark - Table view data source


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    // Return the number of rows in the section.
    return [self.continents count];
}

- (NSString *)titleForRow:(NSUInteger)row{
    
    return [[self.continents objectAtIndex:row] description];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"ContinentRow";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
    
    // Configure the cell...
    cell.textLabel.text = [self titleForRow:indexPath.row];
    
    return cell;
}

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    }   
    else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath
{
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/


#pragma mark - Navigation

// In a story board-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
    NSIndexPath *indexPath = [self.tableView indexPathForCell:sender];
    if(indexPath){
        if ([segue.identifier isEqualToString:@"ContinentCountries"]) {
            if([segue.destinationViewController respondsToSelector:@selector(setContinentName:)]){
                
                NSString *continentName = [self.continents objectAtIndex:indexPath.row];
                [segue.destinationViewController performSelector:@selector(setContinentName:) withObject:continentName];
                [segue.destinationViewController setTitle:[self titleForRow:indexPath.row]];
            }
        }
        if ([segue.identifier isEqualToString:@"ContinentCountries1"]) {
            if([segue.destinationViewController respondsToSelector:@selector(setContinentName:)]){
                
                NSString *continentName = [self.continents objectAtIndex:indexPath.row];
                [segue.destinationViewController performSelector:@selector(setContinentName:) withObject:continentName];
                [segue.destinationViewController setTitle:[self titleForRow:indexPath.row]];
                
            }
        }
    }
}


-(void)createNewContinentWithCountries{
    
    NSArray* africacountries = @[@"Algeria",@"Angola",@"Benin",@"Botswana",@"Burkina_Faso",@"Burundi",
                                        @"C African Rep",@"Cameroon",@"Cape_Verde",@"Chad",@"Comoros",@"Côte_d'Ivoire",
                                        @"Djibouti",@"DRO_Congo",@"Egypt",@"Eq._Guinea",@"Eritrea",@"Ethiopia",
                                        @"Gabon",@"Gambia",@"Ghana",@"Guinea",@"Guinea_Bissau",@"Kenya",
                                        @"Lesotho",@"Liberia",@"Libya",@"Madagascar",@"Malawi",@"Mali",
                                        @"Mauritania",@"Mauritius",@"Morocco",@"Mozambique",@"Namibia",@"Niger",
                                        @"Nigeria",@"RO_Congo",@"Rwanda",@"Sao_Tomé",@"Senegal",@"Seychelles",
                                        @"Sierra_Leone",@"Somalia",@"South_Africa",@"Sudan",@"Swaziland",@"Tanzania",
                                        @"Togo",@"Tunisia",@"Uganda",@"Zambia",@"Zimbabwe"];
    
    NSArray* asiaCountries = @[@"Afghanistan",@"Armenia",@"Azerbaijan",@"Bahrain",@"Bangladesh",@"Bhutan",
                                      @"Brunei",@"Cambodia",@"China",@"Christmas_Is",@"Georgia",@"Hong_Kong",
                                      @"India",@"Indonesia",@"Iran",@"Iraq",@"Israel",@"Japan",
                                      @"Jordan",@"Kazakhstan",@"Kuwait",@"Kyrgyztan",@"Laos",@"Labanon",
                                      @"Macao",@"Malaysia",@"Maldives",@"Mongolia",@"Myanmar",@"Nepal",
                                      @"North_Korea",@"Oman",@"Pakistan",@"Philippines",@"Qatar",@"Saudi_Arabia",
                                      @"Singapore",@"South_Georgia",@"South_Korea",@"Sri_Lanka",@"Syria",@"Taiwan",
                                      @"Tajikistan",@"Thailand",@"Tibet",@"Timor-Leste",@"Turkey",@"Turkmenistan",
                                      @"UAE",@"Uzbekistan",@"Vietnam",@"Yemen"];
    
    NSArray* europeCountries = @[@"Albania",@"Andorra",@"Austria",@"Belarus",@"Belgium",@"Croatia",
                                        @"Cyprus",@"Cyprus_North",@"Czech_Republic",@"Denmark",@"Estonia",@"Faroe_Islands",
                                        @"Finland",@"France",@"Germany",@"Gibraltar",@"Greece",@"Greenland",
                                        @"Hungary",@"Iceland",@"Ireland",@"Italy",@"Latvia",@"Liechtenstein",
                                        @"Lithuania",@"Luxembourg",@"Macedonia",@"Malta",@"Moldova",@"Monaco",
                                        @"Netherlands",@"Norway",@"Poland",@"Portugal",@"Romania",@"Russia",
                                        @"San_Marino",@"Serbia",@"Slovakia",@"Slovenia",@"Spain",@"Sweeden",
                                        @"Ukraine",@"United_Kingdom",@"Vatican_City"];
    
    NSArray* northamericaCountries = @[@"Anguilla",@"Antigua",@"Aruba",@"Bahamas",@"Barbados",@"Belize",
                                              @"Bermuda",@"Canada",@"Cayman_Is",@"Costa_Rica",@"Cuba",@"Dominica",
                                              @"Dominican_Rep",@"El_Salvador",@"Grenada",@"Guatemala",@"Haiti",@"Honduras",
                                              @"Jamaica",@"Martinique",@"Mexico",@"Montserrat",@"Nicaragua",@"Panama",
                                              @"Puerto_Rico",@"Saint_Kitts",@"Saint_Lucia",@"Saint_Vicent",
                                              @"Turks_Islands",@"US_Virgin_Is.",@"USA",@"Virgin_Islands"];
    
    NSArray* oceanaCountries = @[@"Am._Samoa",@"Australia",@"Cook_Islands",@"Fiji",@"Guam",@"Kiribati",
                                        @"Marshall_Is",@"Micronesia",@"Nauru",@"New_Guinea",@"New_Zealand",@"Niue",
                                        @"Norfolk_Island",@"Palau",@"Pitcairn_Islands",@"Samoa",@"Soloman_Is",@"Tonga",
                                        @"Tuvalu",@"Vanuatu",@"Wallis_&_Futuna"];
    
    NSArray* southamericaCountries = @[@"Argentina",@"Bolivia",@"Brazil",@"Chile",@"Colombia",@"Dutch_Antilles",
                                              @"Ecuador",@"Falkland_Is",@"Fr_Polynesia",@"Guyana",@"Paraguay",@"Peru",
                                              @"Suriname",@"Trinidad",@"Uruguay",@"Venezuela"];
    
    [self createNewContinentWith:@"Africa" With:africacountries];
    [self createNewContinentWith:@"Asia" With:asiaCountries];
    [self createNewContinentWith:@"Europe" With:europeCountries];
    [self createNewContinentWith:@"North_America" With:northamericaCountries];
    [self createNewContinentWith:@"Oceania" With:oceanaCountries];
    [self createNewContinentWith:@"South_America" With:southamericaCountries];
    
    
    
    
}
-(void)createNewContinentWith:(NSString*)continentName With:(NSArray*)countries{
    
    Continents *newContinent = [NSEntityDescription
                         insertNewObjectForEntityForName:@"Continents"
                         inManagedObjectContext:self.managedObjectContext];
    
    
    newContinent.continentName = continentName;
    //[self createNewCountryWith:newContinent And:countries];
    for (int i=0; i<[countries count]; i++) {
        Countries *newCountry = [NSEntityDescription
                                 insertNewObjectForEntityForName:@"Countries"
                                 inManagedObjectContext:self.managedObjectContext];
        
        newCountry.continents = newContinent;
        newCountry.countryName = countries[i];
        
    }
    NSError *error;
    if (![self.managedObjectContext save:&error]) {
        NSLog(@"Whoops, couldn't save: %@", [error localizedDescription]);
    }
    
}


-(void)loadContinentsData{
    
    NSFetchRequest *fetchRequest = [[NSFetchRequest alloc] initWithEntityName:@"Continents"];
    
    
    NSError *requestError = nil;
    
    //And execute the fetch request on the context
    NSArray *continentes = [self.managedObjectContext
                        executeFetchRequest:fetchRequest
                        error:&requestError];
    
    NSMutableArray* con = [[NSMutableArray alloc]init];
    //Make sure we get the array
    
    for (Continents *wkcontinentes in continentes){
        [con addObject:wkcontinentes.continentName];
    }
    [self setContinents:con];
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
                NSLog(@"Successfully deleted the last continent...");
                
                NSError *savingError = nil;
                if ([self.managedObjectContext save:&savingError]){
                    NSLog(@"Successfully saved the context.");
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
                NSLog(@"Successfully deleted the last continent...");
                
                NSError *savingError = nil;
                if ([self.managedObjectContext save:&savingError]){
                    NSLog(@"Successfully saved the context.");
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
