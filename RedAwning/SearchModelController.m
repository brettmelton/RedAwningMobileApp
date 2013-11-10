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

- (NSArray*) performSearch:(NSString*) searchTerm :(int) iStart
{
    int iItemsPerSearch = 5;                   // Hard coding search row return value for short term - make this dynamically driven.
    iStart *= iItemsPerSearch;
    
    NSMutableArray *arrLocations = [[NSMutableArray alloc] init];
    
    /************** Solr REST API documentation **********/
    /* http://wiki.apache.org/solr/CommonQueryParameters */
    /*****************************************************/
    
    NSMutableString *searchURL = [[NSMutableString alloc] initWithString:s_urlSolrSearch];
    [searchURL appendString:s_urlSolrSearchRowCnt];
    [searchURL appendString:[NSString stringWithFormat:@"%d",iItemsPerSearch]];
    [searchURL appendString:s_urlSolrSearchStart];
    [searchURL appendString:[NSString stringWithFormat:@"%d",iStart]];
    [searchURL appendString:s_urlSolrSearchQuery];
    [searchURL appendString:searchTerm];
    
    NSURL *url = [NSURL URLWithString:searchURL];
    NSData *data = [NSData dataWithContentsOfURL:url];

    NSDictionary *xmlDictionary = [[XMLDictionaryParser alloc] dictionaryWithData:data];

    NSDictionary *result = [xmlDictionary objectForKey:s_xmlResultNodeName];
    if ([[result objectForKey:s_xmlDocNodeName] isKindOfClass:[NSArray class]])
    {
        NSArray *doc = [result objectForKey:s_xmlDocNodeName];
        for (NSDictionary *aDoc in doc)
        {
            NSArray *arrNodeNames = [[NSArray alloc] initWithObjects:s_xmlStrNodeName, s_xmlLongNodeName, nil];
            Location *location = [self addLocationValues:aDoc :arrNodeNames];
            [arrLocations addObject:location];
        }
    }
    return arrLocations;
}


- (Location *) addLocationValues:(NSDictionary *) aDoc :(NSArray*) arrNodeNames
{
    Location *location = [[Location alloc] init];

    for (NSString *xmlNodeName in arrNodeNames)
    {
        if ([[aDoc objectForKey:xmlNodeName] isKindOfClass:[NSArray class]])
        {
            NSArray *nodes = [aDoc objectForKey:xmlNodeName];
            for (NSDictionary *node in nodes)
            {
                NSString *theName = [node objectForKey:s_xmlNameAttrName];
                NSString *theValue = [node objectForKey:s_xmlTextAttrName];
            
//                NSLog(@"Name=%@ and Value=%@", theName, theValue);
                if( [theName isEqualToString:@"entity_id"] )
                    NSLog(@"Name=%@ and Value=%@", theName, theValue);
                [location addParameter:theName :theValue];
            }
        }
    }
    return location;
}

@end
