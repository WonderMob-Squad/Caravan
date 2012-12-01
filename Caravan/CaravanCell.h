//
//  CaravanCell.h
//  Caravan
//
//  Created by Danny Cook on 10/29/12.
//  Copyright (c) 2012 Danny Cook. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CaravanCell : UITableViewCell
@property (nonatomic, strong) IBOutlet UILabel *firstName;
@property (nonatomic, strong) IBOutlet UILabel *lastName;
@property (nonatomic, strong) IBOutlet UILabel *emailAddress;

@end
