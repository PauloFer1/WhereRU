//
//  ViewController.h
//  WhereRU
//
//  Created by MacBook on 11/06/15.
//  Copyright (c) 2015 ___PAULOFERNANDES___. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MapKit/MapKit.h>

@interface ViewController : UIViewController
 <MKMapViewDelegate>

@property (weak, nonatomic) IBOutlet MKMapView *mapView;
- (IBAction)zoomIn:(id)sender;
- (IBAction)changeMapType:(id)sender;

@property (weak, nonatomic) IBOutlet UIBarButtonItem *sideBarBtn;

@end
