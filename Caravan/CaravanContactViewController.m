//
//  CaravanContactViewController.m
//  Caravan
//
//  Created by Danny Cook on 12/1/12.
//  Copyright (c) 2012 Danny Cook. All rights reserved.
//

#import "CaravanContactViewController.h"
#import "CaravanViewController.h"


@interface CaravanContactViewController ()

@end



@implementation CaravanContactViewController

@synthesize contactInfo = _contactInfo;
@synthesize firstName = _firstName;
@synthesize lastName = _lastName;
@synthesize emailAddress = _emailAddress;
@synthesize lat = _lat;
@synthesize longitude = _longitude;

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
    _contactInfo = [CaravanViewController ContactInfo];
    NSLog(@"Contact Info received: %@", self.contactInfo);
    _firstName.text = [_contactInfo valueForKey:@"First Name"];
    _lastName.text = [_contactInfo valueForKey:@"Last Name"];
    _emailAddress.text = [_contactInfo valueForKey:@"Email"];
    _lat.text = [_contactInfo valueForKey:@"Lat"];
    _longitude.text = [_contactInfo valueForKey:@"Long"];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
