//
//  MapPinAnnotation.h
//  RedAwning
//
//  Created by Brett Melton on 11/10/13.
//  Copyright (c) 2013 Brett Melton. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <MapKit/MapKit.h>

@interface MapPinAnnotation : NSObject <MKAnnotation>

@property (nonatomic, copy) NSString *title;
@property (nonatomic, assign) CLLocationCoordinate2D coordinate;

-(id) initWithCoordinate:(CLLocationCoordinate2D)coordinate title:(NSString *)title;

@end
