//
//  HostViewController.m
//  Caravan
//
//  Created by Danny Cook on 11/5/12.
//  Copyright (c) 2012 Danny Cook. All rights reserved.
//

#import "HostViewController.h"
#import "CaravanMember.h"


@interface HostViewController ()

@end

@implementation HostViewController
//@synthesize feedbackMsg;
@synthesize contacts;


#pragma mark -
#pragma mark Memory management

- (void)dealloc {
	//[feedbackMsg release];
	//[super dealloc];
}


#pragma mark -
#pragma mark Views lifecycle

- (void)viewDidUnload {
    [self setFeedbackMsg:nil];
	self.feedbackMsg = nil;
}


// Support all orientations except for portrait upside-down.
- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
	return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
}


#pragma mark -
#pragma mark Show Mail/SMS picker

-(IBAction)showMailPicker:(id)sender {
	// The MFMailComposeViewController class is only available in iPhone OS 3.0 or later.
	// So, we must verify the existence of the above class and provide a workaround for devices running
	// earlier versions of the iPhone OS.
	// We display an email composition interface if MFMailComposeViewController exists and the device
	// can send emails.	Display feedback message, otherwise.
	
    
   // _cmdc = [[CaravanMemberDataController alloc] init];
    contacts = [[NSMutableArray alloc] init];

    //josh's code
    
    ABPeoplePickerNavigationController *picker = [[ABPeoplePickerNavigationController alloc] init];
    picker.peoplePickerDelegate = self;
    // Display only a person's phone, email, and birthdate
    NSArray *displayedItems = [NSArray arrayWithObjects:[NSNumber numberWithInt:kABPersonPhoneProperty],
                               [NSNumber numberWithInt:kABPersonEmailProperty],
                               [NSNumber numberWithInt:kABPersonBirthdayProperty], nil];
    
    
    picker.displayedProperties = displayedItems;
    // Show the picker
    [self presentModalViewController:picker animated:YES];
    
    
    
    
    
    
    
    //orig code
    Class mailClass = (NSClassFromString(@"MFMailComposeViewController"));
    
	if (mailClass != nil) {
        //[self displayMailComposerSheet];
		// We must always check whether the current device is configured for sending emails
		if ([mailClass canSendMail]) {
			[self displayMailComposerSheet];
		}
		else {
			feedbackMsg.hidden = NO;
			feedbackMsg.text = @"Device not configured to send mail.";
		}
	}
	else	{
		feedbackMsg.hidden = NO;
		feedbackMsg.text = @"Device not configured to send mail.";
	}
}

// Displays the information of a selected person
- (BOOL)peoplePickerNavigationController:(ABPeoplePickerNavigationController *)peoplePicker shouldContinueAfterSelectingPerson:(ABRecordRef)person
{
    
    CaravanMember *member = [[CaravanMember alloc]init];

    NSString* firstName = (__bridge_transfer NSString*)ABRecordCopyValue(person,kABPersonFirstNameProperty);
    NSString *lastName = (__bridge_transfer NSString *)ABRecordCopyValue(person, kABPersonLastNameProperty);
    //NSString *mobilePhone = ( __bridge_transfer NSString *)ABRecordCopyValue(person,kABPersonPhoneMobileLabel);
    //NSString *emailAdd = (__bridge_transfer NSString *)ABRecordCopyValue(person, kABPersonEmailProperty);
    
    //get the mobile phone number
    ABMultiValueRef phones = (ABMultiValueRef)ABRecordCopyValue(person, kABPersonPhoneProperty);
    NSString* mobile=@"";
    NSString* mobileLabel;
    for (int i=0; i < ABMultiValueGetCount(phones); i++) {
        //NSString *phone = (NSString *)ABMultiValueCopyValueAtIndex(phones, i);
        //NSLog(@"%@", phone);
        mobileLabel = (__bridge NSString*)ABMultiValueCopyLabelAtIndex(phones, i);
        if([mobileLabel isEqualToString:(NSString *)kABPersonPhoneMobileLabel]) {
            mobile = (__bridge NSString*)ABMultiValueCopyValueAtIndex(phones, i);
            NSLog(@"mobile:");
        }
        else{
            mobile = @"";
        }
        
    }
    //get the email addy
    ABMultiValueRef emails = (ABMultiValueRef)ABRecordCopyValue(person, kABPersonEmailProperty);
    NSString* emailAdd=@"";
    if (ABMultiValueGetCount(emails)>=0){
            emailAdd = (__bridge NSString*)ABMultiValueCopyValueAtIndex(emails, 0);
            NSLog(@"email");
    }
        


    [member initWithName:firstName lastname:lastName mobilenumber:mobile email:emailAdd];
    
    [contacts addObject:member];
    //[_cmdc addCaravanMemberToCaravan:member];
    NSLog(@"The value of count is %i", [contacts count]);
    NSLog(firstName);
    NSLog(lastName);
    NSLog(mobile);
    NSLog(emailAdd);

    
       
    return NO;
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


-(IBAction)showSMSPicker:(id)sender {
    //	The MFMessageComposeViewController class is only available in iPhone OS 4.0 or later.
    //	So, we must verify the existence of the above class and log an error message for devices
    //		running earlier versions of the iPhone OS. Set feedbackMsg if device doesn't support
    //		MFMessageComposeViewController API.
	Class messageClass = (NSClassFromString(@"MFMessageComposeViewController"));
	
	if (messageClass != nil) {
		// Check whether the current device is configured for sending SMS messages
		if ([messageClass canSendText]) {
			[self displaySMSComposerSheet];
		}
		else {
			feedbackMsg.hidden = NO;
			feedbackMsg.text = @"Device not configured to send SMS.";
            
		}
	}
	else {
		feedbackMsg.hidden = NO;
		feedbackMsg.text = @"Device not configured to send SMS.";
	}
}


#pragma mark -
#pragma mark Compose Mail/SMS

// Displays an email composition interface inside the application. Populates all the Mail fields.
-(void)displayMailComposerSheet
{
	MFMailComposeViewController *picker = [[MFMailComposeViewController alloc] init];
	picker.mailComposeDelegate = self;
	
	[picker setSubject:@"Join My Caravan"];
	
	
	// Set up recipients
	NSArray *toRecipients = [NSArray arrayWithObject:@"first@myentourage.com"];
	NSArray *ccRecipients = [NSArray arrayWithObjects:@"second@myentrourage.com", @"third@myentourage.com", nil];
	NSArray *bccRecipients = [NSArray arrayWithObject:@"fourth@myentourage.com"];
	
	[picker setToRecipients:toRecipients];
	[picker setCcRecipients:ccRecipients];
	[picker setBccRecipients:bccRecipients];
	
	// Attach an image to the email
	NSString *path = [[NSBundle mainBundle] pathForResource:@"winnebago" ofType:@"jpg"];
	NSData *myData = [NSData dataWithContentsOfFile:path];
	[picker addAttachmentData:myData mimeType:@"image/jpeg" fileName:@"winnebago"];
	
	// Fill out the email body text
	NSString *emailBody = @"Join me on our common destination by clicking the link below";
	[picker setMessageBody:emailBody isHTML:NO];
	
	[self presentModalViewController:picker animated:YES];
	//[picker release];
}


// Displays an SMS composition interface inside the application.
-(void)displaySMSComposerSheet
{
	MFMessageComposeViewController *picker = [[MFMessageComposeViewController alloc] init];
	picker.messageComposeDelegate = self;
	
	[self presentModalViewController:picker animated:YES];
	//[picker release];
}



#pragma mark -
#pragma mark Dismiss Mail/SMS view controller

// Dismisses the email composition interface when users tap Cancel or Send. Proceeds to update the
// message field with the result of the operation.
- (void)mailComposeController:(MFMailComposeViewController*)controller
          didFinishWithResult:(MFMailComposeResult)result error:(NSError*)error {
	
	feedbackMsg.hidden = NO;
	// Notifies users about errors associated with the interface
	switch (result)
	{
		case MFMailComposeResultCancelled:
			feedbackMsg.text = @"Result: Mail sending canceled";
			break;
		case MFMailComposeResultSaved:
			feedbackMsg.text = @"Result: Mail saved";
			break;
		case MFMailComposeResultSent:
			feedbackMsg.text = @"Result: Mail sent";
			break;
		case MFMailComposeResultFailed:
			feedbackMsg.text = @"Result: Mail sending failed";
			break;
		default:
			feedbackMsg.text = @"Result: Mail not sent";
			break;
	}
	[self dismissModalViewControllerAnimated:YES];
}


// Dismisses the message composition interface when users tap Cancel or Send. Proceeds to update the
// feedback message field with the result of the operation.
- (void)messageComposeViewController:(MFMessageComposeViewController *)controller
                 didFinishWithResult:(MessageComposeResult)result {
	
	feedbackMsg.hidden = NO;
	// Notifies users about errors associated with the interface
	switch (result)
	{
		case MessageComposeResultCancelled:
			feedbackMsg.text = @"Result: SMS sending canceled";
			break;
		case MessageComposeResultSent:
			feedbackMsg.text = @"Result: SMS sent";
			break;
		case MessageComposeResultFailed:
			feedbackMsg.text = @"Result: SMS sending failed";
			break;
		default:
			feedbackMsg.text = @"Result: SMS not sent";
			break;
	}
	[self dismissModalViewControllerAnimated:YES];
}


- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
