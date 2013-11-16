//
//  MapPinAnnotation.m
//  RedAwning
//
//  Created by Brett Melton on 11/10/13.
//  Copyright (c) 2013 Brett Melton. All rights reserved.
//

#import "MapPinAnnotation.h"

@implementation MapPinAnnotation

-(id) initWithCoordinate:(CLLocationCoordinate2D)coordinate title:(NSString *)title {
    if ((self = [super init])) {
        self.coordinate =coordinate;
        self.title = title;
    }
    return self;
}
@end
