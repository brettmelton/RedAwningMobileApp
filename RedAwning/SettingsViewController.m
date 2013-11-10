//
//  SettingsViewController.m
//  RedAwning
//
//  Created by Brett Melton on 10/22/13.
//  Copyright (c) 2013 Brett Melton. All rights reserved.
//

#import "SettingsViewController.h"

@interface SettingsViewController ()

@end

@implementation SettingsViewController

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
    
    NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
    NSString *theAccountName = [userDefaults objectForKey:@"AccountName"];
    _accountName.text = theAccountName;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    [_accountName resignFirstResponder];
}

- (IBAction)onSave:(id)sender
{
    NSString *theAccountName = _accountName.text;
    [_accountName resignFirstResponder];
    
    NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
    [userDefaults setObject:theAccountName forKey:@"AccountName"];
    // – setBool:forKey:
    // – setFloat:forKey:
    [userDefaults synchronize];
}

@end
