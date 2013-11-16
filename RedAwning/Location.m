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
    else if( [name isEqualToString:@"label" ])
        [self setLabel:value];
    else if( [name isEqualToString:@"teaser" ])
        [self setTeaser:value];
    else if( [name isEqualToString:@"ss_my_contenttype_image" ])
        [self setImageUrlWithModification:value];
}

- (void) setImageUrlWithModification:(NSString *)imageUrl
{
    int iTrimOffBeginning = [@"public:/" length];
    NSMutableString *strImageUrl = [[NSMutableString alloc] initWithString:[imageUrl substringFromIndex:iTrimOffBeginning]];
    [strImageUrl insertString:@"http://assets03.redawning.com/sites/default/files" atIndex:0];
    [self setImageUrl:strImageUrl];

}


@end
