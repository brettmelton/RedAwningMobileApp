//
//  Location.h
//  RedAwning
//
//  Created by Brett Melton on 10/27/13.
//  Copyright (c) 2013 Brett Melton. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Location : NSObject

@property (strong, nonatomic) NSString *entityId;

@property (nonatomic) float latitude;
@property (nonatomic) float longitude;

- (void) addParameter:(NSString *) name : (NSString *) value;

@end
