//
//  Map.m
//  Caravan
//
//  Created by Danny Cook on 11/19/12.
//  Copyright (c) 2012 Danny Cook. All rights reserved.
//

#import "Map.h"
#import <CoreLocation/CoreLocation.h>

@implementation Map

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}

- (void) viewDidLoad {
    self.delegate = self;
    
}

- (void)viewWillAppear:(BOOL)animated
{
    //self.locationManager = [[CLLocationManager alloc] init];
    //self.locationManager.delegate = self;
    //[self.locationManager setDesiredAccuracy:kCLLocationAccuracyBest];
    //[self.locationManager startUpdatingLocation];
    
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
