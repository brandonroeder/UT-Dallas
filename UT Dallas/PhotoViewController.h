//
//  PhotoViewController.h
//  UT Dallas
//
//  Created by Brandon Roeder on 3/16/14.
//  Copyright (c) 2014. All rights reserved.
//


#import <UIKit/UIKit.h>

@interface PhotoViewController : UIViewController
@property (weak, nonatomic) IBOutlet UIBarButtonItem *sidebarButton;
@property (weak, nonatomic) IBOutlet UIImageView *photoImageView;
@property (strong, nonatomic) NSString *photoFilename;
@end
