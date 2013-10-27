//
//  SearchModelController.m
//  RedAwning
//
//  Created by Brett Melton on 10/25/13.
//  Copyright (c) 2013 Brett Melton. All rights reserved.
//

#import "SearchModelController.h"
#import "XMLDictionary.h"


@implementation SearchModelController

- (NSArray*) performSearch:(NSString*) searchTerm
{
    
    NSMutableArray *arrLocations = [[NSMutableArray alloc] init];

    /** Solr REST API documentation                     **/
    /* http://wiki.apache.org/solr/CommonQueryParameters */
    /**                                                 **/
    
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
            if ([[aDoc objectForKey:@"str"] isKindOfClass:[NSArray class]])
            {
                NSArray *str = [aDoc objectForKey:@"str"];
                for (NSDictionary *aStr in str)
                {
                    NSString *theName = [aStr objectForKey:@"_name"];
                    NSString *theValue = [aStr objectForKey:@"__text"];

                    NSLog(@"hi");

                }

            }

        }
    }
    return arrLocations;
}
@end