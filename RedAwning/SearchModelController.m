//
//  SearchModelController.m
//  RedAwning
//
//  Created by Brett Melton on 10/25/13.
//  Copyright (c) 2013 Brett Melton. All rights reserved.
//

#import "SearchModelController.h"
#import "XMLDictionary.h"
#import "Location.h"


@implementation SearchModelController

- (NSArray*) performSearch:(NSString*) searchTerm
{
    
    NSMutableArray *arrLocations = [[NSMutableArray alloc] init];
    
    /************** Solr REST API documentation **********/
    /* http://wiki.apache.org/solr/CommonQueryParameters */
    /*****************************************************/
    NSString *strSolrSearchHttpUrl = @"http://solr-loadbalancer-566393618.us-west-1.elb.amazonaws.com:8080/solr/collection1/select?wt=xml&indent=true&rows=3&q=";
    
    NSMutableString *searchURL = [[NSMutableString alloc] initWithString:strSolrSearchHttpUrl];
    [searchURL appendString:searchTerm];
    NSURL *url = [NSURL URLWithString:searchURL];
    NSData *data = [NSData dataWithContentsOfURL:url];


    NSDictionary *xmlDictionary = [[XMLDictionaryParser alloc] dictionaryWithData:data];

    NSDictionary *result = [xmlDictionary objectForKey:@"result"];
    if ([[result objectForKey:@"doc"] isKindOfClass:[NSArray class]])
    {
        NSArray *doc = [result objectForKey:@"doc"];
        for (NSDictionary *aDoc in doc)
        {
            Location *location = [[Location alloc] init];
            
            if ([[aDoc objectForKey:@"str"] isKindOfClass:[NSArray class]])
            {
                NSArray *str = [aDoc objectForKey:@"str"];
                for (NSDictionary *aStr in str)
                {
                    NSString *theName = [aStr objectForKey:@"_name"];
                    NSString *theValue = [aStr objectForKey:@"__text"];
                    
                    // TODO -bdm- Add to Location Object
                    NSLog(@"Name=%@ and Value=%@", theName, theValue);
                    
                    [location addParameter:theName :theValue];
                }

            }
            if ([[aDoc objectForKey:@"long"] isKindOfClass:[NSArray class]])
            {
                NSArray *longs = [aDoc objectForKey:@"long"];
                for (NSDictionary *aLong in longs)
                {
                    
                    NSString *theName = [aLong objectForKey:@"_name"];
                    NSString *theValue = [aLong objectForKey:@"__text"];
                    
                    // TODO -bdm- Add to Location Object
                    NSLog(@"Name=%@ and Value=%@", theName, theValue);

                    [location addParameter:theName :theValue];
                }
            }

            [arrLocations addObject:location];
        }
    }
    return arrLocations;
}
@end
