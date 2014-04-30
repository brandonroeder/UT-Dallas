//
//  MapViewController.m
//  UT Dallas
//
//  Created by Brandon Roeder on 3/16/14.
//  Copyright (c) 2014. All rights reserved.
//


#import "MapViewController.h"
#import "SWRevealViewController.h"
#import <GoogleMaps/GoogleMaps.h>


@interface MapViewController ()

@end

@implementation MapViewController
{
    GMSMapView *mapView_;

}


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
    
    GMSCameraPosition *camera = [GMSCameraPosition cameraWithLatitude:32.98633
                                                            longitude:-96.75130
                                                                 zoom:15.5];
    mapView_ = [GMSMapView mapWithFrame:CGRectZero camera:camera];
    mapView_.myLocationEnabled = YES;
    self.view = mapView_;
    
    mapView_.settings.myLocationButton = YES;
    
    CLLocationCoordinate2D southWest = CLLocationCoordinate2DMake(32.977168,-96.762419);
    CLLocationCoordinate2D northEast = CLLocationCoordinate2DMake(32.995653,-96.738923);
    GMSCoordinateBounds *overlayBounds = [[GMSCoordinateBounds alloc] initWithCoordinate:southWest
                                                                              coordinate:northEast];
    
    // Image from http://www.lib.utexas.edu/maps/historical/newark_nj_1922.jpg
    UIImage *icon = [UIImage imageNamed:@"map-mobile.gif"];
    GMSGroundOverlay *overlay =
    [GMSGroundOverlay groundOverlayWithBounds:overlayBounds icon:icon];
    overlay.bearing = 0;
    overlay.map = mapView_;


    // Set the side bar button action. When it's tapped, it'll show up the sidebar.
    _sidebarButton.target = self.revealViewController;
    _sidebarButton.action = @selector(revealToggle:);
    
    // Set the gesture
    [self.view addGestureRecognizer:self.revealViewController.panGestureRecognizer];

}





- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
