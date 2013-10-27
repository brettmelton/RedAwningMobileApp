//
//  SearchViewController.m
//  RedAwning
//
//  Created by Brett Melton on 10/24/13.
//  Copyright (c) 2013 Brett Melton. All rights reserved.
//

// This View manages the Search Controller

#import "SearchViewController.h"
#import "SearchModelController.h"
#import "ViewController.h"

@interface SearchViewController ()

@end

@implementation SearchViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    
    SearchModelController *model = [[SearchModelController alloc] init];
    
    NSString *strSearchText = [ViewController getCurrentSearchValue];

    
    [model performSearch:strSearchText];

}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
