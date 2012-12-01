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
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
