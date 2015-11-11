//
//  HighVoltageTableViewController.m
//  HIGH VOLTAGE REDUX
//
//  Created by david on 11/11/15.
//  Copyright © 2015 The Iron Yard. All rights reserved.
//

#import "HighVoltageTableViewController.h"
#import "PopOverTableViewController.h"
#import "CalcCell.h"
#import "Brainerino.h"

@interface HighVoltageTableViewController ()
{
    Brainerino *brain;
}

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
    
    if([self.remainingItems containsObject:chosenItem])
    {
        [self.remainingItems removeObject:chosenItem];
    }
    
    //TODO add button 2 item check
    
    [self.tableView reloadData];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    CalcCell *cell = [tableView dequeueReusableCellWithIdentifier:@"CalcCell" forIndexPath:indexPath];
    
    NSString *item = self.shownItems[indexPath.row];
    cell.elecLabel.text = item;
    
    return cell;
}

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
- (IBAction)calculateButtonTapped:(UIButton *)sender
{
    [self calculate];
}

- (void)calculate
{
    brain = [[Brainerino alloc] init];
    
    NSArray *visibleCells = self.tableView.visibleCells;
    
    for (CalcCell *cell in visibleCells)
    {
        NSString *cellLabel = cell.elecLabel.text;
        NSString *cellTextfield = cell.elecTextField.text;
        
        [self checkCellLabel:cellLabel textfield:cellTextfield];
        
        [brain calculate];
    }
    
    for (NSString *item in self.allItems)
    {
        if(![self.shownItems containsObject:item])
        {
            [self.shownItems addObject:item];
        }
    }
    
    [self.tableView reloadData];
    
    [self populateCellsWithAnswers];

    [self.tableView reloadData];
}

- (BOOL)checkCellLabel:(NSString *) label textfield:(NSString *)textfield
{
    if([label isEqualToString:@"WATTS"])
    {
        double watts = [textfield doubleValue];
        brain.watts = watts;
    }
    else if([label isEqualToString:@"VOLTS"])
    {
        double volts = [textfield doubleValue];
        brain.volts = volts;
    }
    else if([label isEqualToString:@"AMPS"])
    {
        double amps = [textfield doubleValue];
        brain.amps = amps;
    }
    else if([label isEqualToString:@"OHMS"])
    {
        double ohms = [textfield doubleValue];
        brain.ohms = ohms;
    }

    return YES;
}

- (void)populateCellsWithAnswers
{
    NSArray *cells = [self.tableView visibleCells];
    for(CalcCell *cell in cells)
    {
        if([cell.elecLabel.text isEqualToString:@"OHMS"])
        {
            NSString *ohmStr = [NSString stringWithFormat: @"%f", brain.ohms];
            cell.elecTextField.text = ohmStr;
        }
        
        if([cell.elecLabel.text isEqualToString:@"VOLTS"])
        {
            NSString *voltStr = [NSString stringWithFormat: @"%f", brain.volts];
            cell.elecTextField.text = voltStr;
        }
        
        if([cell.elecLabel.text isEqualToString:@"AMPS"])
        {
            NSString *ampStr = [NSString stringWithFormat: @"%f", brain.amps];
            cell.elecTextField.text = ampStr;
        }
        
        if([cell.elecLabel.text isEqualToString:@"WATTS"])
        {
            NSString *wattStr = [NSString stringWithFormat: @"%f", brain.watts];
            cell.elecTextField.text = wattStr;
        }
    }
}

@end
