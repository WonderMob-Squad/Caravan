//
//  MapPin.h
//  Caravan
//
//  Created by Danny Cook on 12/1/12.
//  Copyright (c) 2012 Danny Cook. All rights reserved.
//

#import <MapKit/MapKit.h>

@interface MapPin : MKAnnotationView
{
    CLLocationCoordinate2D location;
    NSString* title;
    NSString* subtitle;
    
}
@property (nonatomic, assign) CLLocationCoordinate2D location;
@property (nonatomic, copy) NSString* title;
@property (nonatomic, copy) NSString* subtitle;

@end
