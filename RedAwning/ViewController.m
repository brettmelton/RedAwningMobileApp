//
//  ViewController.m
//  RedAwning
//
//  Created by Brett Melton on 10/21/13.
//  Copyright (c) 2013 Brett Melton. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end
static NSString* s_currentSearchValue = nil;


@implementation ViewController


+ (NSString*)getCurrentSearchValue
{
    return s_currentSearchValue;
}

- (IBAction)didSearch:(id)sender
{    
    s_currentSearchValue = [self searchTextField].text;
}


- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    s_currentSearchValue = [self searchTextField].text;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    [self.searchTextField resignFirstResponder];
    
    s_currentSearchValue = [self searchTextField].text;

}

@end
