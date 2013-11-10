//
//  SearchViewController.h
//  RedAwning
//
//  Created by Brett Melton on 10/24/13.
//  Copyright (c) 2013 Brett Melton. All rights reserved.
//

// This View manages the Search Controller

#import <UIKit/UIKit.h>
#import "SearchModelController.h"


@interface SearchViewController : UIViewController

@property (strong, nonatomic) IBOutlet UILabel *entityId;
@property (strong, nonatomic) IBOutlet UIImageView *entityImg;

@property (strong, nonatomic) SearchModelController *model;
@property (strong, nonatomic) NSString *strSearchText;

@property (strong, nonatomic) NSArray *arrLocations;
@property int curIdxLocation;
@property int curPageNumber;

@end
