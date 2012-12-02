//
//  MapViewController.m
//  Caravan
//
//  Created by Danny Cook on 11/25/12.
//  Copyright (c) 2012 Danny Cook. All rights reserved.
//

#import "MapViewController.h"
#import "MapPin.h"
#import "CaravanViewController.h"

@interface MapViewController ()

@end

NSArray * caravanList;
NSMutableArray * annotationList;

@implementation MapViewController
@synthesize mapView = _mapView;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    _mapView.delegate = (id)self;
    NSLog(@"Delegate declared");
    
    caravanList = [CaravanViewController CaravanInfo];
    annotationList = [[NSMutableArray alloc] init];
    NSLog(@"%i items in Caravan List", [caravanList count]);
    
    for(int i = 0; i < [caravanList count]; i++) {
        CLLocationCoordinate2D location;
        
        double lat = [[[caravanList objectAtIndex:i] objectForKey:@"Lat"]doubleValue];
        double longitude = [[[caravanList objectAtIndex:i] objectForKey:@"Long"]doubleValue];
        NSLog(@"Latitude is %f", lat);
        NSLog(@"Longitude is %f", longitude);
        location.latitude = lat;
        location.longitude = longitude;
        NSLog(@"Location: %f, %f", location.latitude, location.longitude);
        
        MapPin* pin=[[MapPin alloc] init];
        
        pin.location = location;
        pin.title = [[caravanList objectAtIndex:i] objectForKey:@"First Name"];
        pin.subtitle = [[caravanList objectAtIndex:i] objectForKey:@"Last Name"];
        
        [_mapView addAnnotation:(id)pin];
        [annotationList addObject:pin];
        //NSLog(@"Pin dropped!");
        
    }
    
}

-(void)mapView:(MKMapView *)mapView didUpdateUserLocation:(MKUserLocation *)userLocation
{
    MKCoordinateRegion mapRegion;
    mapRegion.center = mapView.userLocation.coordinate;
    mapRegion.span.latitudeDelta = 0.2;
    mapRegion.span.longitudeDelta = 0.2;
    
    [mapView setRegion:mapRegion animated: YES];
    NSLog(@"User location updated. Region set.");
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)viewDidUnload {
    [self setMapView:nil];
    [super viewDidUnload];
}
@end
