//
//  MapViewController.h
//  Caravan
//
//  Created by Danny Cook on 11/25/12.
//  Copyright (c) 2012 Danny Cook. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MapKit/MapKit.h>
#import <CoreLocation/CoreLocation.h>

@interface MapViewController : UIViewController <CLLocationManagerDelegate> {
    CLLocationManager *locationManager;
}
@property (strong, nonatomic) IBOutlet MKMapView *mapView;
@property (retain, nonatomic) CLLocationManager *locationManager;
@end
