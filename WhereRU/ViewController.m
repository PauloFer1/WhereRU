//
//  ViewController.m
//  WhereRU
//
//  Created by MacBook on 11/06/15.
//  Copyright (c) 2015 ___PAULOFERNANDES___. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

#import "SWRevealViewController.h"

@implementation ViewController



- (void)viewDidLoad
{
    [super viewDidLoad];
    
	// Do any additional setup after loading the view, typically from a nib.
    _mapView.delegate = self;
    _mapView.showsUserLocation = YES;
    

    CLLocationCoordinate2D pinlocation;
    pinlocation.latitude = 41.445880;
    pinlocation.longitude = -8.175420;

    MKPointAnnotation *annotation = [[MKPointAnnotation alloc] init];
    for (id annotation in _mapView.annotations) {
        [_mapView removeAnnotation:annotation];
    }
    annotation.coordinate = pinlocation;
    [annotation setTitle:@"Minha Localização"]; //You can set the subtitle too
    [_mapView addAnnotation:annotation];
    
    SWRevealViewController *revealViewController = self.revealViewController;
    if ( revealViewController )
    {
        [self.sideBarBtn setTarget: self.revealViewController];
        [self.sideBarBtn setAction: @selector( revealToggle: )];
        [self.view addGestureRecognizer:self.revealViewController.panGestureRecognizer];
    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)zoomIn:(id)sender {
    MKUserLocation *userLocation = _mapView.userLocation;
    MKCoordinateRegion region =
    MKCoordinateRegionMakeWithDistance (
                                        userLocation.location.coordinate, 2000, 2000);
    [_mapView setRegion:region animated:YES];
    NSLog(@"Lat:%f, Long:%f", _mapView.userLocation.location.coordinate.latitude, _mapView.userLocation.location.coordinate.longitude);
}

- (IBAction)changeMapType:(id)sender {
    if (_mapView.mapType == MKMapTypeStandard)
        _mapView.mapType = MKMapTypeSatellite;
    else
        _mapView.mapType = MKMapTypeStandard;
}

- (void)mapView:(MKMapView *)mapView didUpdateUserLocation:(MKUserLocation *)userLocation
{
    _mapView.centerCoordinate =
    userLocation.location.coordinate;
}
@end
