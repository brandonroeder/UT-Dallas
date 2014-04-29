//
//  ViewController.h
//  UT Dallas
//
//  Created by Brandon Roeder on 3/16/14.
//  Copyright (c) 2014. All rights reserved.
//


#import <UIKit/UIKit.h>
@class MWFeedParser;

@interface MainViewController : UITableViewController
{
    MWFeedParser *feedParser;
    NSMutableArray *parsedItems;
	// Displaying
	NSArray *itemsToDisplay;
	NSDateFormatter *formatter;


}

@property (weak, nonatomic) IBOutlet UIBarButtonItem *sidebarButton;
@property (strong, nonatomic) NSMutableArray *episodes;
@property (strong, nonatomic) IBOutlet UITableView *tableView;


@end
