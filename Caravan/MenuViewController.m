//
//  MenuViewController.m
//  Caravan
//
//  Created by Danny Cook on 10/29/12.
//  Copyright (c) 2012 Danny Cook. All rights reserved.
//

#import "MenuViewController.h"
#import "MenuCell.h"

@interface MenuViewController ()

@end

NSString *menuItemPath = nil;
NSString *menuItemValues = nil;

@implementation MenuViewController
@synthesize menuArray = _menuArray;
@synthesize menuItems = _menuItems;

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) { 
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    menuItemPath = [[NSBundle mainBundle] pathForResource:@"MenuItems" ofType:@"plist"];
    NSLog(@"%@", menuItemPath);
    _menuArray = [[NSDictionary dictionaryWithContentsOfFile:menuItemPath] valueForKey:@"Items"];
    NSLog(@"%@", menuItemValues);

    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
 
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
    
    //self.menuArray = [[NSArray alloc] init];
    //self.menuItems = [[NSDictionary alloc] initWithDictionary: [menuItemValues valueForKey:@"Items"]];
    //self.menuArray = [self.menuItems allValues];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
#warning Update this section if number of menu items is changed.
    return 5;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"MenuCell";
    MenuCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
    
    // Configure the cell...
    cell.menuText.text = [self.menuArray objectAtIndex:[indexPath row]];
    NSLog(@"%d", [indexPath row]);
    NSLog(@"Cell text: %@", cell.menuText.text);
    
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

#pragma mark - Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    //Indicates which of the specific menu items was tapped
    switch ([indexPath row]) {
        case 0: //Start Caravan!
            //statements
            [self performSegueWithIdentifier:@"mapSegue" sender:self];
            break;
        case 1: //Lead a Caravan
            [self performSegueWithIdentifier:@"hostSegue" sender:self];
            break;
        case 2: //Join a Caravan
            [self performSegueWithIdentifier:@"joinSegue" sender:self];
            break;
        case 3: //Edit Your Profile
            [self performSegueWithIdentifier:@"profileSegue" sender:self];
            break;
        //case 4: //View Caravan In Progress
          //  [self performSegueWithIdentifier:@"currentSegue" sender:self];
            //break;
        case 4: //Abandon Caravan
        {
            UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Really Abandon?"
                                                       message:@"If you abandon your caravan, you will be unable to exchange location information with your fellow travelers."
                                                       delegate:self
                                                       cancelButtonTitle:@"Cancel"
                                                       otherButtonTitles:@"Yes", nil];
            [alert show];
            break;
        }
    }
    
    // Navigation logic may go here. Create and push another view controller.
    /*
     //<#DetailViewController#> *detailViewController = [[<#DetailViewController#> alloc] initWithNibName:@"<#Nib name#>" bundle:nil];
     // ...
     // Pass the selected object to the new view controller.
     [self.navigationController pushViewController:detailViewController animated:YES];
     */
}

/*
 The control methods for the UIAlertView written in case 5 above appear here. 
 */
- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex
{
    if (buttonIndex == 0)
    {
        //cancel clicked...do nothing!
    }
    else if (buttonIndex == 1)
    {
        //ok clicked
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Caravan Abandoned!"
                                                        message:@"Your location information is no longer being broadcast."
                                                       delegate:self
                                              cancelButtonTitle:@"Return to Menu"
                                              otherButtonTitles:nil];
        [alert show];
    }
    
}

@end
