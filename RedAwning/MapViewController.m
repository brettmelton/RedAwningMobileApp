//
//  MapViewController.m
//  RedAwning
//
//  Created by Brett Melton on 11/10/13.
//  Copyright (c) 2013 Brett Melton. All rights reserved.
//

#import "MapViewController.h"
#import "MapPinAnnotation.h"
#import "SearchViewController.h"
#import "Location.h"

@interface MapViewController ()

@end

@implementation MapViewController

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
    Location *poi = [SearchViewController getCurrentLocation];
    
    CLLocationCoordinate2D poidCoordinates;
    poidCoordinates.latitude = poi.latitude;
    poidCoordinates.longitude = poi.longitude;
    
    MapPinAnnotation *annotation = [[MapPinAnnotation alloc] initWithCoordinate:poidCoordinates title:poi.label];
    [self.mapView addAnnotation:annotation];
    
    [self.mapView setCenterCoordinate:poidCoordinates animated:YES];
    [self.mapView setShowsPointsOfInterest:YES];
    [self.mapView setShowsUserLocation:YES];
    
    self.mapView.mapType = MKMapTypeHybrid;  // MKMapTypeStandard, MKMapTypeSatellite, MKMapTypeHybrid
    
    MKCoordinateRegion viewRegion = MKCoordinateRegionMakeWithDistance(poidCoordinates, 500, 500);
    [self.mapView setRegion:viewRegion animated:YES];
}

- (MKAnnotationView *)mapView:(MKMapView *)mapView viewForAnnotation:(id<MKAnnotation>)annotation
{
    static NSString *const kAnnotationReuseIdentifier = @"CPAnnotationView";
    
    MKAnnotationView *annotationView = [mapView dequeueReusableAnnotationViewWithIdentifier:kAnnotationReuseIdentifier];
    if (annotationView == nil) {
        annotationView = [[MKPinAnnotationView alloc] initWithAnnotation:annotation reuseIdentifier:kAnnotationReuseIdentifier];
        annotationView.enabled = YES;
        annotationView.canShowCallout = YES;
        annotationView.rightCalloutAccessoryView = [UIButton buttonWithType:UIButtonTypeInfoLight];
    }
    
    return annotationView;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
