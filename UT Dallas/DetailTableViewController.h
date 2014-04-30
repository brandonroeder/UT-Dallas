//
//  DetailViewController.h
//  
//
//  Created by Brandon Roeder on 3/25/14.
//
//

#import <UIKit/UIKit.h>
@class MWFeedItem;

@interface DetailViewController : UITableViewController
{
    MWFeedItem *item;
	NSString *summaryString;
    UIWebView *openLink;


}
@property (strong, nonatomic) IBOutlet UITableView *tableView;

@property (nonatomic, strong) MWFeedItem *item;
@property (nonatomic, strong) NSString *summaryString;




@end
