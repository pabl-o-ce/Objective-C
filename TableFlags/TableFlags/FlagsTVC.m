//
//  FlagsTVC.m
//  TableFlags
//
//  Created by Pablo Roberto Carrera Estrada on 11/2/13.
//  Copyright (c) 2013 Pablo Roberto Carrera Estrada. All rights reserved.
//

#import "FlagsTVC.h"
#import "imageViewController.h"
@interface FlagsTVC () <UITableViewDelegate, UITableViewDataSource>

@end

@implementation FlagsTVC

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    NSIndexPath *indexPath = [self.tableView indexPathForCell:sender];
    if(indexPath){
        if ([segue.identifier isEqualToString:@"ShowFlag"]) {
            if([segue.destinationViewController respondsToSelector:@selector(setImageURL:)]){
                
                NSString *flagName = [self.flags objectAtIndex:indexPath.row];
                NSURL *url = [[NSBundle mainBundle] URLForResource:flagName withExtension:@"png"];
                [segue.destinationViewController performSelector:@selector(setImageURL:) withObject:url];
                [segue.destinationViewController setTitle:[self titleForRow:indexPath.row]];
                UIAlertView *countryNameAlert = [[UIAlertView alloc]
                                                 initWithTitle:flagName message:@"" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
                [countryNameAlert show];
            }
        }
        if ([segue.identifier isEqualToString:@"ShowFlag2"]) {
            if([segue.destinationViewController respondsToSelector:@selector(setImageURL:)]){
                
                NSString *flagName = [self.flags objectAtIndex:indexPath.row];
                NSURL *url = [[NSBundle mainBundle] URLForResource:flagName withExtension:@"png"];
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
-(void)setFlags:(NSMutableArray *)flags{
    
    _flags = flags;
    [self.tableView reloadData];
    
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
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
#warning Incomplete method implementation.
    // Return the number of rows in the section.
    return [self.flags count];
}
- (NSString *)titleForRow:(NSUInteger)row{
    
    return [[self.flags objectAtIndex:row] description];
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"FlagRow";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
    
    // Configure the cell...
    NSString *image1= [NSString stringWithFormat:@"%@.png",[self titleForRow:indexPath.row] ];
    UIImageView *imgView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 1, 1)];
    imgView.image = [UIImage imageNamed:image1];
    cell.textLabel.text = [self titleForRow:indexPath.row];
    cell.imageView.image = imgView.image;
    return cell;
}
- (UITableViewCellEditingStyle)tableView:(UITableView *)tableView
           editingStyleForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    UITableViewCellEditingStyle result = UITableViewCellEditingStyleNone;
    
    result = UITableViewCellEditingStyleDelete;
    
    return result;
    
}

- (void) setEditing:(BOOL)editing
           animated:(BOOL)animated{
    
    [super setEditing:editing
             animated:animated];
    
    [self.tableView setEditing:editing
                        animated:animated];
    
    
}

- (void)  tableView:(UITableView *)tableView
 commitEditingStyle:(UITableViewCellEditingStyle)editingStyle
  forRowAtIndexPath:(NSIndexPath *)indexPath{
    
    if (editingStyle == UITableViewCellEditingStyleDelete){
        
        if (indexPath.row < [self.flags count]){
            
            /* First remove this object from the source */
            [self.flags removeObjectAtIndex:indexPath.row];
            
            /* Then remove the associated cell from the Table View */
            [tableView deleteRowsAtIndexPaths:[NSArray arrayWithObject:indexPath]
                             withRowAnimation:UITableViewRowAnimationLeft];
            
        }
    }
    
}
- (BOOL)shouldAutorotateToInterfaceOrientation
:(UIInterfaceOrientation)interfaceOrientation{
    return YES;
}
@end
