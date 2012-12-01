//
//  CaravanMemberDataController.h
//  Caravan
//
//  Created by Joshua Kimball on 11/26/12.
//  Copyright (c) 2012 Danny Cook. All rights reserved.
//

#import <Foundation/Foundation.h>
@class CaravanMember;
@interface CaravanMemberDataController : NSObject

@property (nonatomic, copy) NSMutableArray *caravanMemberList;

- (NSUInteger)countOfList;
- (CaravanMember *)objectInListAtIndex:(NSUInteger)theIndex;
- (CaravanMember *)getCaravanLeader;
- (void)addCaravanMemberToCaravan:(CaravanMember *)caravanMember;


@end
