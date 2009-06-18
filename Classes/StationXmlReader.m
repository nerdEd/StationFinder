//
//  StationXmlReader.m
//  StationFinder
//
//  Created by Ed Schmalzle on 3/4/09.
//  Copyright 2009 nerdEd. All rights reserved.
//

#import "StationXmlReader.h"


@implementation StationXmlReader

@synthesize currentStation, currentStationProperty, stationList;

- (NSMutableArray *)parseXMLFileAtURL:(NSURL *)URL parseError:(NSError **)error {

	NSXMLParser *parser = [[NSXMLParser alloc] initWithContentsOfURL:URL];
	stationList = [[NSMutableArray alloc] init];
	
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
	
	return stationList;
}

- (void)parser:(NSXMLParser *)parser didStartElement:(NSString *)elementName namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qName attributes:(NSDictionary *)attributeDict {
	
	if( qName ) {
		elementName = qName;
	}

	// If we're on a new station create a new Station object and add it to the list
	if( [elementName isEqualToString:@"station"] ) {
		currentStation = [[Station alloc] init];
		[stationList addObject:currentStation];
		return;
	}

	// If we're on a node we care about initialize the currentStationProperty, set it to nil otherwise
	if( [elementName isEqualToString:@"name"] || [elementName isEqualToString:@"marketCity"] || [elementName isEqualToString:@"signal"] || [elementName isEqualToString:@"frequency"] || [elementName isEqualToString:@"tagline"] ) {
		currentStationProperty = [NSMutableString string];		
	}
	else {
		currentStationProperty = nil;
	}
}

- (void)parser:(NSXMLParser *)parser didEndElement:(NSString *)elementName namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qName {
	
	if( [elementName isEqualToString:@"name"] ) {
		currentStation.name = [currentStationProperty stringByTrimmingCharactersInSet: [NSCharacterSet whitespaceAndNewlineCharacterSet]];
	}
	else if( [elementName isEqualToString:@"marketCity"] ) {
		currentStation.marketCity = [currentStationProperty stringByTrimmingCharactersInSet: [NSCharacterSet whitespaceAndNewlineCharacterSet]];
	}
	else if( [elementName isEqualToString:@"signal"] ) {
		currentStation.signal = [currentStationProperty stringByTrimmingCharactersInSet: [NSCharacterSet whitespaceAndNewlineCharacterSet]];
	}
	else if( [elementName isEqualToString:@"frequency"] ) {
		currentStation.frequency = [currentStationProperty stringByTrimmingCharactersInSet: [NSCharacterSet whitespaceAndNewlineCharacterSet]];
	}
	else if( [elementName isEqualToString:@"tagline"] ) {
		currentStation.tagline = [currentStationProperty stringByTrimmingCharactersInSet: [NSCharacterSet whitespaceAndNewlineCharacterSet]];
	}
}

- (void)parser:(NSXMLParser *)parser foundCharacters:(NSString *)string {
	
	if (currentStationProperty) {
		[currentStationProperty appendString:string];
	}
	
}

@end
