//
//  MapViewController.h
//  UT Dallas
//
//  Created by Brandon Roeder on 3/16/14.
//  Copyright (c) 2014. All rights reserved.
//


#import <UIKit/UIKit.h>
#import <MapKit/MapKit.h>

@interface MapViewController : UIViewController<MKMapViewDelegate>
@property (strong, nonatomic) IBOutlet UIWebView *viewMap;

@property (weak, nonatomic) IBOutlet UIBarButtonItem *sidebarButton;

@end
