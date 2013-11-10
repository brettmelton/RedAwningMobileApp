//
//  SearchModelController.h
//  RedAwning
//
//  Created by Brett Melton on 10/25/13.
//  Copyright (c) 2013 Brett Melton. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ModelController.h"


static NSString *const s_urlSolrSearch       = @"http://solr-loadbalancer-566393618.us-west-1.elb.amazonaws.com:8080/solr/collection1/select?wt=xml&indent=true";
static NSString *const s_urlSolrSearchRowCnt = @"&rows=";
static NSString *const s_urlSolrSearchStart  = @"&start=";
static NSString *const s_urlSolrSearchQuery  = @"&q=";

static NSString *const s_xmlDocNodeName      = @"doc";
static NSString *const s_xmlLongNodeName     = @"long";
static NSString *const s_xmlStrNodeName      = @"str";
static NSString *const s_xmlResultNodeName   = @"result";

static NSString *const s_xmlNameAttrName     = @"_name";
static NSString *const s_xmlTextAttrName     = @"__text";

@interface SearchModelController : ModelController

- (NSArray*) performSearch:(NSString*) searchTerm :(int) iStart;

@end
