//
//  CaravanMember.h
//  Caravan
//
//  Created by Joshua Kimball on 11/26/12.
//  Copyright (c) 2012 Danny Cook. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CaravanMember : NSObject

@property (nonatomic, copy) NSString *firstname;
@property (nonatomic, copy) NSString *lastname;
@property (nonatomic, copy) NSString *mobilenumber;
@property (nonatomic, copy) NSString *contactnumber;

-(id)initWithName:(NSString *)fname lastname:(NSString *)lname mobilenumber:(NSString *)mobilenumber contactnumber:(NSString *)contactnumber;

@end
