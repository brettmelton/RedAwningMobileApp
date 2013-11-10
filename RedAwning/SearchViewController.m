//
//  SearchViewController.m
//  RedAwning
//
//  Created by Brett Melton on 10/24/13.
//  Copyright (c) 2013 Brett Melton. All rights reserved.
//

// This View manages the Search Controller

#import "SearchViewController.h"
#import "ViewController.h"
#import "Location.h"

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

- (IBAction)swipeLeft:(UIPanGestureRecognizer *)recognizer
{
	NSLog(@"Left!");

    if( _curIdxLocation < _arrLocations.count )
    {
        [self updateView];
    }
    else
    {
        _curPageNumber++;
        [self performSearch :_curPageNumber];
    }
}

- (void)swipeRight:(UIPanGestureRecognizer *)recognizer
{
	NSLog(@"Right!");
    
    
// TODO - Need to implement
    
    
}

- (void)viewDidLoad
{
    [super viewDidLoad];

    _model = [[SearchModelController alloc] init];
    _curPageNumber = 0;
    _strSearchText = [ViewController getCurrentSearchValue];

	// Set up the swipe recognizer
	UISwipeGestureRecognizer *leftSwiper = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(swipeLeft:)];
	leftSwiper.direction = UISwipeGestureRecognizerDirectionLeft;
	[self.view addGestureRecognizer:leftSwiper];
    
	UISwipeGestureRecognizer *rightSwiper = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(swipeRight:)];
	rightSwiper.direction = UISwipeGestureRecognizerDirectionRight;
	[self.view addGestureRecognizer:rightSwiper];
    
    [self performSearch :_curPageNumber];
}

- (void) performSearch:(int) page
{
    _curIdxLocation = 0;
    _arrLocations = [_model performSearch:_strSearchText :page];
    
    if( _arrLocations.count > 0 )
    {
        [self updateView];
   }
    else
    {
        self.entityId.text = @"No Results";
    }
}

- (void)updateView
{
    Location *location = [_arrLocations objectAtIndex:_curIdxLocation];
    self.entityId.text = location.entityId;
    
    NSURL *urlPhoto = [NSURL URLWithString:location.imageUrl];
    NSData *photoData = [NSData dataWithContentsOfURL:urlPhoto];
    UIImage *img = [[UIImage alloc] initWithData:photoData];
    [self.entityImg setImage:img];
    
    _curIdxLocation++;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
