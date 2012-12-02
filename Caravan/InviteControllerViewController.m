//
//  InviteViteControllerViewController.m
//  Caravan
//
//  Created by Joshua Kimball on 11/23/12.
//  Copyright (c) 2012 Danny Cook. All rights reserved.
//

#import "InviteControllerViewController.h"

@implementation InviteControllerViewController

@synthesize numberlist;
@synthesize caravanID;
@synthesize responseData;

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
    //UIBarButtonItem *addButton = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAdd target:self action:@selector(addItem:)];
    //self.navigationItem.leftBarButtonItem = addButton;
    numberlist = [[NSArray alloc]
                initWithObjects:@"2235452295",@"4126012295",@"7006012295",
                @"7186642295",@"8009252295",@"9543215679",@"8004412626",@"9006012295"
                , nil];

}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
//might want to do the call out to the API to get CaravanID

   // if ([segue.identifier isEqualToString:@"FinishedCaravan"]){
    [self processCaravan];
    CompleteCaravanViewController *ccv = [segue destinationViewController];
    NSLog(@"test log");
    caravanID=@"test4";
    [ccv setCaravanID:caravanID];
    //}
    
    
}

-(void)processCaravan{
    NSString *url=@"http://mas.test.sagz.in/location.php?action=fetch&caravanid=1";
    
    NSURLRequest *theRequest = [NSURLRequest requestWithURL:[NSURL URLWithString:url]];
    
    NSURLResponse *resp = nil;
    NSError *err = nil;
    
    NSData *response = [NSURLConnection sendSynchronousRequest: theRequest returningResponse: &resp error: &err];
    
    
    NSArray *jsonArray = [NSJSONSerialization JSONObjectWithData: response options: NSJSONReadingMutableContainers error: &err];
   
    
    if (!jsonArray) {
        NSLog(@"Error parsing JSON: %@", err);
    } else {
        NSArray *mainArray = [jsonArray objectAtIndex:0];
        for(NSDictionary *item in mainArray) {
            NSLog(@" %@", item);
            NSString *nmbr = [item valueForKey:@"phone_number"];
            NSLog(nmbr);
            NSLog(@"---------------------------------");
        }

    }
    
}




#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
#warning Potentially incomplete method implementation.
    // Return the number of sections.
    return 1;
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [numberlist count];
    
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"ParticipantCell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
    }
    
    NSString *current = [numberlist objectAtIndex:indexPath.row];
    [cell.textLabel setText:current];
    
    // Configure the cell...
    
    return cell;
    
}



- (void) showPeoplePickerController{
   

     #pragma mark Show all contacts
     // Called when users tap "Display Picker" in the application. Displays a list of contacts and allows users to select a contact from that list.
     // The application only shows the phone, email, and birthdate information of the selected contact.

     ABPeoplePickerNavigationController *picker = [[ABPeoplePickerNavigationController alloc] init];
     picker.peoplePickerDelegate = self;
     // Display only a person's phone, email, and birthdate
     NSArray *displayedItems = [NSArray arrayWithObjects:[NSNumber numberWithInt:kABPersonPhoneProperty],
     [NSNumber numberWithInt:kABPersonEmailProperty],
     [NSNumber numberWithInt:kABPersonBirthdayProperty], nil];
     
     
     picker.displayedProperties = displayedItems;
     // Show the picker
     [self presentModalViewController:picker animated:YES];
     
     
}

- (IBAction)addItem:(id)sender {
    [self showPeoplePickerController];
    

}




// Displays the information of a selected person
- (BOOL)peoplePickerNavigationController:(ABPeoplePickerNavigationController *)peoplePicker shouldContinueAfterSelectingPerson:(ABRecordRef)person
{
    
    
    return YES;
}


// Does not allow users to perform default actions such as dialing a phone number, when they select a person property.
- (BOOL)peoplePickerNavigationController:(ABPeoplePickerNavigationController *)peoplePicker shouldContinueAfterSelectingPerson:(ABRecordRef)person
								property:(ABPropertyID)property identifier:(ABMultiValueIdentifier)identifier
{
	return NO;
}


// Dismisses the people picker and shows the application when users tap Cancel.
- (void)peoplePickerNavigationControllerDidCancel:(ABPeoplePickerNavigationController *)peoplePicker;
{
	[self dismissModalViewControllerAnimated:YES];
}

    
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Navigation logic may go here. Create and push another view controller.
    /*
     <#DetailViewController#> *detailViewController = [[<#DetailViewController#> alloc] initWithNibName:@"<#Nib name#>" bundle:nil];
     // ...
     // Pass the selected object to the new view controller.
     [self.navigationController pushViewController:detailViewController animated:YES];
     */
}

//- (void)save:sender {
    
  //  UITextField *textField = [(EditableTableViewTextField *)[tableView cellForRowAtIndexPath:[NSIndexPath indexPathForRow:0 inSection:0]] textField];
    
   // SimpleEditableListAppDelegate *controller = (SimpleEditableListAppDelegate *)[[UIApplication sharedApplication] delegate];
   // NSString *newItem = textField.text;
   // if (newItem != nil) {
    //    [controller insertObject:newItem inListAtIndex:[controller countOfList]];
   // }
   // [self dismissModalViewControllerAnimated:YES];
//}



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



@end
