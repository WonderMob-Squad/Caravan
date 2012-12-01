//
//  CaravanContactViewController.h
//  Caravan
//
//  Created by Danny Cook on 12/1/12.
//  Copyright (c) 2012 Danny Cook. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CaravanContactViewController : UIViewController
@property NSDictionary *contactInfo;

@property (nonatomic, strong) IBOutlet UILabel *firstName;
@property (nonatomic, strong) IBOutlet UILabel *lastName;
@property (nonatomic, strong) IBOutlet UILabel *emailAddress;
@property (nonatomic, strong) IBOutlet UILabel *lat;
@property (nonatomic, strong) IBOutlet UILabel *longitude;

@end
