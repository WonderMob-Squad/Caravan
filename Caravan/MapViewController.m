//
//  MapViewController.m
//  Caravan
//
//  Created by Danny Cook on 10/29/12.
//  Copyright (c) 2012 Danny Cook. All rights reserved.
//

#import "MapViewController.h"
#import <CoreLocation/CoreLocation.h>

#define METERS_PER_MILE 1609.344

@interface MapViewController ()

@end

@implementation MapViewController
@synthesize mapView = _mapView;

CLLocationManager *locationManager;

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
    
    //mapView.showsUserLocation=TRUE;
    
    // zoom to  a specific area
   /* CLLocationCoordinate2D zoomLocation;
    zoomLocation.latitude = -28.994167;
    zoomLocation.longitude = 134.866944;
    
    MKCoordinateRegion viewRegion = MKCoordinateRegionMakeWithDistance(zoomLocation, 1900*METERS_PER_MILE, 1900*METERS_PER_MILE);
    MKCoordinateRegion adjustedRegion = [mapView regionThatFits:viewRegion];
    
    // make sure the Google water mark is always visible
    mapView.autoresizingMask =
    (UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight);
    
    NSLog(@"Setting region!");
    [mapView setRegion:adjustedRegion animated:YES];
    
    //mapView.delegate=self; */
    
    //MKUserLocation *myLocation = [mapView userLocation];
    //CLLocationCoordinate2D coord = [[myLocation location] coordinate];
    
    //MKCoordinateRegion region = MKCoordinateRegionMakeWithDistance(coord, 150, 150);
    //[mapView setRegion:region animated:YES];
    NSLog(@"View did load.");
    [mapView setDelegate:self];
    [mapView setCenterCoordinate:mapView.userLocation.location.coordinate animated:YES];
    
}

- (void)viewWillAppear:(BOOL)animated
{
    
    
}

-(void)viewWillDisappear:(BOOL)animated
{
    mapView.showsUserLocation = NO;
}

-(void)mapView:(MKMapView *)mv didUpdateUserLocation:(MKUserLocation *)userLocation
//Changed the **internal** parameter name from mapView to mv
//to avoid a compiler warning about it hiding instance var with same name.
//It's better to use the passed parameter variable anyway.
{
    NSLog(@"didUpdateUserLocation");
    
    [mapView setCenterCoordinate:mapView.userLocation.location.coordinate animated:YES];
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
