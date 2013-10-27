//
//  ViewController.h
//  RedAwning
//
//  Created by Brett Melton on 10/21/13.
//  Copyright (c) 2013 Brett Melton. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController

@property (strong, nonatomic) NSString *photoFileName;
@property (strong, nonatomic) IBOutlet UITextField *searchTextField;

+ (NSString*)getCurrentSearchValue;

@end
