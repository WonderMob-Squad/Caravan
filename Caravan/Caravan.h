//
//  Caravan.h
//  Caravan
//
//  Created by SARA HUBBARD on 12/1/12.
//  Copyright (c) 2012 Danny Cook. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "CaravanMember.h"

@interface Caravan : NSObject

@property (nonatomic) NSInteger caravanId;
@property (nonatomic, copy) NSMutableArray* members;

-(id)init;

-(void)addMember:(CaravanMember*) member;

@end
