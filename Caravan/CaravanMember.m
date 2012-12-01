//
//  CaravanMember.m
//  Caravan
//
//  Created by Joshua Kimball on 11/26/12.
//  Copyright (c) 2012 Danny Cook. All rights reserved.
//

#import "CaravanMember.h"

@implementation CaravanMember

-(id)initWithName:(NSString *)fname lastname:(NSString *)lname mobilenumber:(NSString *)mobilenumber contactnumber:(NSString *)contactnumber;
{
    self = [super init];
    if (self) {
        _firstname = fname;
        _lastname = lname;
        _mobilenumber = mobilenumber;
        _contactnumber = contactnumber;
        return self;
    }
    return nil;
}

@end
