//
//  StationXmlReader.m
//  StationFinder
//
//  Created by Ed Schmalzle on 3/4/09.
//  Copyright 2009 __MyCompanyName__. All rights reserved.
//

#import "StationXmlReader.h"


@implementation StationXmlReader

@synthesize currentStation, currentStationProperty;

- (void)parseXMLFileAtURL:(NSURL *)URL parseError:(NSError **)error {

	NSXMLParser *parser = [[NSXMLParser alloc] initWithContentsOfURL:URL];

	// Set self as the delegate of the parser so that it will receive the parser delegate methods callbacks.
	[parser setDelegate:self];

	// Turn off parser options that we don't need
	[parser setShouldProcessNamespaces:NO];
	[parser setShouldReportNamespacePrefixes:NO];
	[parser setShouldResolveExternalEntities:NO];

	// Start parsing
	[parser parse];

	// Process Errors
	NSError *parseError = [parser parserError];
	if (parseError && error) {
			*error = parseError;
	}

	[parser release];
}

- (void)parser:(NSXMLParser *)parser didStartElement:(NSString *)elementName namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qName attributes:(NSDictionary *)attributeDict {
	
	if( qName ) {
		elementName = qName;
	}

	// If we're on a new station create a new Station object and add it to the list
	if( [elementName isEqualToString:@"station"] ) {
		
		return;
	}

	
	if( [elementName isEqualToString:@"name"] ) {
		
	}
	if( [elementName isEqualToString:@"marketCity"] ) {
		
	}
	if( [elementName isEqualToString:@"signal"] ) {
		
	}
	if( [elementName isEqualToString:@"frequency"] ) {
		
	}
	
	// check and see what element we're working with
	// if it's a new station element, create a new Station and add it to the controllers list
	// if it's something we care about set the currentStationProperty to a new NSMutableString
	// if it's not something we care about set the currentStationProperty to nil
}

- (void)parser:(NSXMLParser *)parser didEndElement:(NSString *)elementName namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qName {

}

- (void)parser:(NSXMLParser *)parser foundCharacters:(NSString *)string {

}

@end
