//
//  Caravan.m
//  Caravan
//
//  Created by SARA HUBBARD on 12/1/12.
//  Copyright (c) 2012 Danny Cook. All rights reserved.
//

#import "Caravan.h"

@implementation Caravan
-(id)init;
{
    self = [super init];
    if( self ) {
        _caravanId = -1;
        _members = [[NSMutableArray alloc]init];
    }
    return self;
}

-(void)addMember:(CaravanMember*) member;
{
    [_members addObject: member];
}

-(NSString *)description;
{
    return [NSString stringWithFormat:@"Caravan(caravanId: %d, members: %@)",
            _caravanId,
            _members];
}
@end
