//
//  MapPin.m
//  Caravan
//
//  Created by Danny Cook on 12/1/12.
//  Copyright (c) 2012 Danny Cook. All rights reserved.
//

#import "MapPin.h"

@implementation MapPin
@synthesize location = _location;
@synthesize title = _title;
@synthesize subtitle = _subtitle;

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

@end
