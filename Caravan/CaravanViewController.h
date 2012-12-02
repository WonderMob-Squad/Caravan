//
//  CaravanViewController.h
//  Caravan
//
//  Created by Danny Cook on 10/29/12.
//  Copyright (c) 2012 Danny Cook. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CaravanViewController : UITableViewController

@property (nonatomic, strong) NSDictionary *caravan;
@property (nonatomic, strong) NSDictionary *caravanPeople;
@property (nonatomic, strong) NSArray *caravanArray;
//@property (nonatomic, strong) NSDictionary *contactInfo;

+(NSDictionary*) ContactInfo;
+(NSArray*) CaravanInfo;

@end


