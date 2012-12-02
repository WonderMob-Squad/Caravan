//
//  InviteControllerViewController.h
//  Caravan
//
//  Created by Joshua Kimball on 11/23/12.
//  Copyright (c) 2012 Danny Cook. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <AddressBook/AddressBook.h>
#import <AddressBookUI/AddressBookUI.h>


@interface InviteControllerViewController : UITableViewController <UITableViewDataSource, UITableViewDelegate, ABPeoplePickerNavigationControllerDelegate>

-(void)showPeoplePickerController;
-(void)sendCaravan;
- (IBAction)addItem:(id)sender;


@property (nonatomic, strong) NSString *caravanID;
@property (nonatomic, strong) NSArray *numberlist;
@property (retain, nonatomic) NSMutableData *responseData;


@end
