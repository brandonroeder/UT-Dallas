//
//  CalendarViewController.h
//  UT Dallas
//
//  Created by Brandon Roeder on 3/16/14.
//  Copyright (c) 2014. All rights reserved.
//


#import <UIKit/UIKit.h>
@class MWFeedParser;


@interface CalendarViewController : UITableViewController <UITableViewDelegate, UITableViewDataSource, UIPickerViewDelegate, UIPickerViewDataSource>
{
    MWFeedParser *feedParser;
    NSMutableArray *parsedItems;
	// Displaying
	NSArray *itemsToDisplay;
	NSDateFormatter *formatter;
    NSURL *feedURL;

}
@property (weak, nonatomic) IBOutlet UIBarButtonItem *sidebarButton;

@property (strong, nonatomic) IBOutlet UITableView *tableView;

@property (weak, nonatomic) IBOutlet UIPickerView *calPicker;
@property (strong, nonatomic)          NSArray *calendarArray;



@end
