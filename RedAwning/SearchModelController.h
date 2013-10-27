//
//  SearchModelController.h
//  RedAwning
//
//  Created by Brett Melton on 10/25/13.
//  Copyright (c) 2013 Brett Melton. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ModelController.h"

@interface SearchModelController : ModelController

- (NSArray*) performSearch:(NSString*) searchTerm;

@end
