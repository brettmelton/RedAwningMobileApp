//
//  BrowseViewController.h
//  RedAwning
//
//  Created by Brett Melton on 10/24/13.
//  Copyright (c) 2013 Brett Melton. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SearchModelController.h"

@interface BrowseViewController : UITableViewController


@property (strong, nonatomic) IBOutlet UITableView *tableView;
@property (strong, nonatomic) IBOutlet UITableViewCell *tableViewCell;


@property (strong, nonatomic) SearchModelController *model;

@property (strong, nonatomic) NSArray *arrLocations;

@end
