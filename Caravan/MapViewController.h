//
//  MapViewController.h
//  Caravan
//
//  Created by Danny Cook on 10/29/12.
//  Copyright (c) 2012 Danny Cook. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MapKit/MapKit.h>

@interface MapViewController : UIViewController {
    MKMapView *mapView;
}
@property(nonatomic,retain) IBOutlet MKMapView *mapView;
@end
