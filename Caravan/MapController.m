//
//  MapController.m
//  Caravan
//
//  Created by Danny Cook on 11/19/12.
//  Copyright (c) 2012 Danny Cook. All rights reserved.
//

#import "MapController.h"

@implementation MapController

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

- (MKAnnotationView *)mapView:(MKMapView *)map viewForAnnotation:(id <MKAnnotation>)annotation{
    if ([annotation isKindOfClass:[MKUserLocation class]])
    {
        ((MKUserLocation *)annotation).title = @"My Current Location";
        return nil;  //return nil to use default blue dot view
    }
    return nil;
}

@end
