//
//  SidebarViewController.h
//  UT Dallas
//
//  Created by Brandon Roeder on 3/16/14.
//  Copyright (c) 2014. All rights reserved.
//


#import <UIKit/UIKit.h>

@interface SidebarViewController : UITableViewController
@property (weak, nonatomic) IBOutlet UILabel *newsLabel;
@property (weak, nonatomic) IBOutlet UILabel *directoryLabel;
@property (weak, nonatomic) IBOutlet UILabel *mapsLabel;
@property (weak, nonatomic) IBOutlet UILabel *calLabel;
@property (weak, nonatomic) IBOutlet UILabel *sportLabel;
@property (weak, nonatomic) IBOutlet UILabel *tipsLabel;
@property (weak, nonatomic) IBOutlet UILabel *searchLabel;

@end
