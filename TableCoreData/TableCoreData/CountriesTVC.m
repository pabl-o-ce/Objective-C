//
//  CountriesTVC.m
//  TableCoreData
//
//  Created by Pablo Roberto Carrera Estrada on 11/15/13.
//  Copyright (c) 2013 Pablo Roberto Carrera Estrada. All rights reserved.
//

#import "CountriesTVC.h"
#import "ContinentesAppDelegate.h"
#import "Countries.h"
#import "Continents.h"

@interface CountriesTVC ()
@property (nonatomic, retain) NSManagedObjectContext *managedObjectContext;

@end

@implementation CountriesTVC


-(void)setCountriesName:(NSMutableArray *)countriesName
{
    _countriesName = countriesName;
    [self.tableView reloadData];
    
}
-(void)setContinentName:(NSString *)continentName{
    _continentName = continentName;
    [self.tableView reloadData];
}
- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    [self loadContinentsData];
    [self.tableView reloadData];
}

- (void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
}



#pragma mark - Table view data source

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    // Return the number of rows in the section.
    return [self.countriesName count];
}

- (NSString *)titleForRow:(NSUInteger)row{
    
    return [[self.countriesName objectAtIndex:row] description];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"CountryRow";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
    
    // Configure the cell...
    cell.textLabel.text = [self titleForRow:indexPath.row];
    cell.detailTextLabel.text = [self continentName];
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
        if ([segue.identifier isEqualToString:@"CountryFlag"]) {
            if([segue.destinationViewController respondsToSelector:@selector(setImageURL:)]){
                
                NSString *flagName = [self.countriesName objectAtIndex:indexPath.row];
                NSString *cf = [[NSString alloc]initWithFormat:@"%@-%@",self.continentName, flagName];
                NSURL *url = [[NSBundle mainBundle] URLForResource:cf withExtension:@"png"];
                [segue.destinationViewController performSelector:@selector(setImageURL:) withObject:url];
                [segue.destinationViewController setTitle:[self titleForRow:indexPath.row]];
                UIAlertView *countryNameAlert = [[UIAlertView alloc]
                                                 initWithTitle:cf message:@"" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
                [countryNameAlert show];
            }
        }
        if ([segue.identifier isEqualToString:@"CountryFlag1"]) {
            if([segue.destinationViewController respondsToSelector:@selector(setImageURL:)]){
                
                NSString *flagName = [self.countriesName objectAtIndex:indexPath.row];
                NSString *cf = [[NSString alloc]initWithFormat:@"%@-%@",self.continentName, flagName];
                NSURL *url = [[NSBundle mainBundle] URLForResource:cf withExtension:@"png"];
                [segue.destinationViewController performSelector:@selector(setImageURL:) withObject:url];
                if (flagName){
                    [segue.destinationViewController performSelector:@selector(setName:) withObject:flagName];
                }else{
                    flagName=@"holisssss estrellitas aun no escojes nada o me jale";
                    [segue.destinationViewController performSelector:@selector(setName:) withObject:flagName];
                }
                [segue.destinationViewController setTitle:[self titleForRow:indexPath.row]];
                
            }
        }
    }
}


-(void)loadContinentsData{
    ContinentesAppDelegate* appDelegate = [UIApplication sharedApplication].delegate;
    NSMutableArray *continentes = [[NSMutableArray alloc]initWithArray:[appDelegate getAllContinentsCountries]];
    NSMutableArray* con = [[NSMutableArray alloc]init];
    //Make sure we get the array
    for (Continents *wkcontinentes in continentes){
        if ([self.continentName isEqualToString:@"Africa"]&&[wkcontinentes.continentName isEqualToString:@"Africa"]) {
            NSArray *paises = [[NSArray alloc]initWithArray:[wkcontinentes.countries allObjects]];
            for (int j=0; j<[paises count]; j++) {
                Countries* pais = (Countries*)paises[j];
                [con addObject:pais.countryName];
            }
        }else if ([self.continentName isEqualToString:@"Asia"]&&[wkcontinentes.continentName isEqualToString:@"Asia"]) {
            NSArray *paises = [[NSArray alloc]initWithArray:[wkcontinentes.countries allObjects]];
            for (int j=0; j<[paises count]; j++) {
                Countries* pais = (Countries*)paises[j];
                [con addObject:pais.countryName];
            }
        }else if ([self.continentName isEqualToString:@"Europe"]&&[wkcontinentes.continentName isEqualToString:@"Europe"]) {
            NSArray *paises = [[NSArray alloc]initWithArray:[wkcontinentes.countries allObjects]];
            for (int j=0; j<[paises count]; j++) {
                Countries* pais = (Countries*)paises[j];
                [con addObject:pais.countryName];
            }
        }else if ([self.continentName isEqualToString:@"North_America"]&&[wkcontinentes.continentName isEqualToString:@"North_America"]) {
            NSArray *paises = [[NSArray alloc]initWithArray:[wkcontinentes.countries allObjects]];
            for (int j=0; j<[paises count]; j++) {
                Countries* pais = (Countries*)paises[j];
                [con addObject:pais.countryName];
            }
        }else if ([self.continentName isEqualToString:@"Oceania"]&&[wkcontinentes.continentName isEqualToString:@"Oceania"]) {
            NSArray *paises = [[NSArray alloc]initWithArray:[wkcontinentes.countries allObjects]];
            for (int j=0; j<[paises count]; j++) {
                Countries* pais = (Countries*)paises[j];
                [con addObject:pais.countryName];
            }
        }else if ([self.continentName isEqualToString:@"South_America"]&&[wkcontinentes.continentName isEqualToString:@"South_America"]) {
            NSArray *paises = [[NSArray alloc]initWithArray:[wkcontinentes.countries allObjects]];
            for (int j=0; j<[paises count]; j++) {
                Countries* pais = (Countries*)paises[j];
                [con addObject:pais.countryName];
            }
        }
    }
    [self setCountriesName:con];

}
@end
