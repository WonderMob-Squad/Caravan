//
//  CaravanMemberDataController.m
//  Caravan
//
//  Created by Joshua Kimball on 11/26/12.
//  Copyright (c) 2012 Danny Cook. All rights reserved.
//

#import "CaravanMemberDataController.h"
#import "CaravanMember.h"

@interface CaravanMemberDataController ()
- (void)initializeDefaultDataList;
@end

@implementation CaravanMemberDataController

- (void)initializeDefaultDataList{
    NSMutableArray *memberList = [[NSMutableArray alloc] init];
    self.caravanMemberList = memberList;
    
    
    
}

- (void)setCaravanMemberList:(NSMutableArray *)newList {
    if (_caravanMemberList != newList) {
        _caravanMemberList = [newList mutableCopy];
    }
}

- (id)init {
    if (self = [super init]) {
        [self initializeDefaultDataList];
        return self;
    }
    return nil;
}


- (NSUInteger)countOfList {
    return [self.caravanMemberList count];
}
- (CaravanMember *)objectInListAtIndex:(NSUInteger)theIndex {
    return [self.caravanMemberList objectAtIndex:theIndex];
}

- (CaravanMember *)getCaravanLeader {
    return [self.caravanMemberList objectAtIndex:0];
}

- (void)addCaravanMemberToCaravan:(CaravanMember *)caravanMember:(CaravanMember *)caravanmember {
    [self.caravanMemberList addObject:caravanmember];
}


@end
