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

@interface SearchViewController ()
+ (Location*)getCurrentLocation;
@end
static Location *s_currentLocation;

@implementation SearchViewController

+ (Location*)getCurrentLocation
{
    return s_currentLocation;
}

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

    if( ( _curIdxLocation + 1 ) < _arrLocations.count )
    {
        [self incrementSearchView];
    }
    else
    {
        _curPageNumber++;
        [self performSearch :_curPageNumber];
        if(_arrLocations.count > 0)
            [self displaySearchView];
    }
}

- (void)swipeRight:(UIPanGestureRecognizer *)recognizer
{
	NSLog(@"Right!");
    
    if( _curIdxLocation == 0 && _curPageNumber == 0 )
        return;
    
    if( _curIdxLocation < _arrLocations.count && _curIdxLocation != 0 )
    {
        [self decrementSearchView];
    }
    else
    {
        _curPageNumber--;
        [self performSearch :_curPageNumber];
        if(_arrLocations.count > 0)
        {
            _curIdxLocation = _arrLocations.count;
            [self decrementSearchView];
        }
    }
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
    if(_arrLocations.count > 0)
        [self displaySearchView];
}

- (void) performSearch:(int) page
{
    _curIdxLocation = 0;
    _arrLocations = [_model performSearch:_strSearchText :page];
    
    if( _arrLocations.count > 0 )
    {
        _pageControl.numberOfPages = _arrLocations.count;
   }
    else
    {
        _pageControl.numberOfPages = 0;
        self.label.text = @"No Results";
    }
}

- (IBAction)onClick:(id)sender
{
    s_currentLocation = [_arrLocations objectAtIndex:_curIdxLocation];
}

- (void)incrementSearchView
{
    _curIdxLocation++;
    [self displaySearchView];
}
- (void)decrementSearchView
{
    _curIdxLocation--;
    [self displaySearchView];
}

- (void)displaySearchView
{
    Location *location = [_arrLocations objectAtIndex:_curIdxLocation];
    self.entityId = location.entityId;
    self.label.text = location.label;
    self.teaser.text = location.teaser;
    
    NSURL *urlPhoto = [NSURL URLWithString:location.imageUrl];
    NSData *photoData = [NSData dataWithContentsOfURL:urlPhoto];
    UIImage *img = [[UIImage alloc] initWithData:photoData];
    [self.entityImg setImage:img];
    
    _pageControl.currentPage = _curIdxLocation;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
