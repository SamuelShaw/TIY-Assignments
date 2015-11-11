//
//  HighVoltageTableViewController.m
//  HIGH VOLTAGE REDUX
//
//  Created by david on 11/11/15.
//  Copyright © 2015 The Iron Yard. All rights reserved.
//

#import "HighVoltageTableViewController.h"
#import "PopOverTableViewController.h"

@interface HighVoltageTableViewController ()

@property NSArray *allItems;
@property NSMutableArray *remainingItems;
@property NSMutableArray *shownItems;

@end



@implementation HighVoltageTableViewController




- (void)viewDidLoad
{
    [super viewDidLoad];
    self.allItems = @[@"AMPS", @"WATTS", @"VOLTS", @"OHMS"];
    self.remainingItems = [[NSMutableArray alloc] initWithArray:self.allItems];
    self.shownItems = [[NSMutableArray alloc] init];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.shownItems.count;
}

- (void)itemWasChosen:(NSString *)chosenItem;
{
    NSLog(@"Hello ITEM was chosen!!");
    
    [self.shownItems addObject:chosenItem];
    
    [self.navigationController dismissViewControllerAnimated:YES completion:nil];
    
    for(NSString *item in self.remainingItems)
    {
        if([item isEqualToString:chosenItem])
        {
            [self.remainingItems removeObject:item];
        }
    }
    
    [self.tableView reloadData];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"CalcCell" forIndexPath:indexPath];
    
    // Configure the cell...
    
    return cell;
}


/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
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
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/


#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if([segue.identifier isEqualToString:@"ShowPopoverSegue"])
    {
        PopOverTableViewController *popVC = segue.destinationViewController;
        UIPopoverPresentationController *popover = popVC.popoverPresentationController;
        
        popVC.delegate = self;
        popover.delegate = self;
        
        popVC.items = [[NSMutableArray alloc] initWithArray:self.remainingItems];
        
        popVC.modalPresentationStyle = UIModalPresentationPopover;
        
        CGFloat contentHeight = popVC.items.count * 44;
        
        popVC.preferredContentSize = CGSizeMake(200, contentHeight);
    }
}

- (UIModalPresentationStyle)adaptivePresentationStyleForPresentationController:(UIPresentationController *)controller
{
    return UIModalPresentationNone;
}


@end
