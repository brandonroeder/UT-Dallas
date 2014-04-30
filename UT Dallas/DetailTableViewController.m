//
//  DetailViewController.m
//  
//
//  Created by Brandon Roeder on 3/25/14.
//
//

#import "DetailTableViewController.h"
#import "NSString+HTML.h"
#import "MWFeedItem.h"


typedef enum { SectionHeader, SectionImage, SectionDetail } Sections;
typedef enum { SectionHeaderTitle, SectionHeaderURL,} HeaderRows;
typedef enum { SectionDetailSummary } DetailRows;


@implementation DetailViewController
@synthesize item, summaryString;

#pragma mark -
#pragma mark Initialization

- (id)initWithStyle:(UITableViewStyle)style {
    if ((self = [super initWithStyle:style])) {
		
    }
    return self;
}


#pragma mark -
#pragma mark View lifecycle


- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAction
                                                                                           target:self
                                                                                           action:@selector(browser)];
    if (item.summary) {
		self.summaryString = [item.summary stringByConvertingHTMLToPlainText];
	} else {
		self.summaryString = @"[No Summary]";
	}
    
    
                    
}


#pragma mark - Table view data source

- (void)browser
{


}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    // Return the number of sections.
    return 3;
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    // Return the number of rows in the section.
	switch (section)
    {
		case 0: return 2;
		default: return 1;
	}
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    // Get cell
	static NSString *CellIdentifier = @"CellA";
	UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
	if (cell == nil) {
		cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
		cell.selectionStyle = UITableViewCellSelectionStyleNone;
	}
	
	// Display
	cell.textLabel.textColor = [UIColor blackColor];
	cell.textLabel.font = [UIFont systemFontOfSize:14];
	if (item)
    {
		// Item Info
		NSString *itemTitle = item.title ? [item.title stringByConvertingHTMLToPlainText] : @"[No Title]";

		// Display
		switch (indexPath.section) {
			case SectionHeader:
            {
				
				// Header
				switch (indexPath.row)
                {
					case SectionHeaderTitle:
						cell.textLabel.font = [UIFont boldSystemFontOfSize:18];
						cell.textLabel.text = itemTitle;
                        cell.textLabel.numberOfLines =0; // Multiline
                        cell.textLabel.lineBreakMode=NSLineBreakByWordWrapping;
                        [cell.textLabel setTextAlignment:NSTextAlignmentCenter];

						break;
					case SectionHeaderURL:
						cell.textLabel.text = item.link ? item.link : @"[No Link]";
                        cell.textLabel.font= [UIFont systemFontOfSize:14];
						cell.textLabel.textColor = [UIColor blueColor];
						cell.selectionStyle = UITableViewCellSelectionStyleBlue;
						break;
				}
				break;
				
			}
             
                
            case SectionImage:
            {
                
             
                NSData *data = [NSData dataWithContentsOfURL : [NSURL URLWithString:[item.images objectAtIndex:indexPath.row]]];
                
				// Summary
                
                UIImageView *myImageView = [[UIImageView alloc] initWithFrame:CGRectMake(0,0,self.view.bounds.size.width,240)];
                myImageView.tag = 1;
                myImageView.image=[UIImage imageWithData: data];
                [cell addSubview:myImageView];
                
            
            }

                break;
           

			case SectionDetail:
            {
				cell.textLabel.text = summaryString;
				cell.textLabel.numberOfLines = 0; // Multiline
                cell.textLabel.lineBreakMode=NSLineBreakByWordWrapping;

				break;
			}
		}
	}
    
    return cell;
	
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
	if (indexPath.section == SectionHeader)
    {
		
		// Regular
		return 50;
		
	}
    if (indexPath.section == SectionImage)
    {
		
		// Regular
		return 240;
		
	}
    else {
		
		NSString *summary = @"[No Summary]";
		if (summaryString) summary = summaryString;
        
// OLD DEPRECATED CODE, REMOVED 4/30/14
//		CGSize s = [summary sizeWithFont:[UIFont systemFontOfSize:15]
//					   constrainedToSize:CGSizeMake(self.view.bounds.size.width - 40, MAXFLOAT)  // - 40 For cell padding
//						   lineBreakMode:NSLineBreakByWordWrapping];
        
        CGRect textRect = [summary boundingRectWithSize:CGSizeMake(self.view.bounds.size.width - 40, MAXFLOAT)
                                             options:NSStringDrawingUsesLineFragmentOrigin
                                             attributes:@{NSFontAttributeName: [UIFont systemFontOfSize:15]}
                                             context:nil];
        
        CGSize s = textRect.size;
		return s.height + 16; // Add padding
		
	}
}

#pragma mark -
#pragma mark Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
	// Open URL
	if (indexPath.section == SectionHeader && indexPath.row == SectionHeaderURL) {
		if (item.link) {
			[[UIApplication sharedApplication] openURL:[NSURL URLWithString:item.link]];
		}
	}
	
	// Deselect
	[self.tableView deselectRowAtIndexPath:indexPath animated:YES];
    
}


/*
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:<#@"reuseIdentifier"#> forIndexPath:indexPath];
    
    // Configure the cell...
    
    return cell;
}
*/

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath
{
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
