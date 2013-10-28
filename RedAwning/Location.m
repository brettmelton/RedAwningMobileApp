//
//  Location.m
//  RedAwning
//
//  Created by Brett Melton on 10/27/13.
//  Copyright (c) 2013 Brett Melton. All rights reserved.
//

#import "Location.h"

@implementation Location


- (void) addParameter:(NSString *) name : (NSString *) value
{
    if( [name isEqualToString:@"ss_latitude" ])
        [self setLatitude:[value floatValue]];
    else if( [name isEqualToString:@"ss_longitude" ])
        [self setLongitude:[value floatValue]];
    else if( [name isEqualToString:@"entity_id" ])
        [self setEntityId:value];
        
}


@end
