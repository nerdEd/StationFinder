//
//  Station.m
//  StationFinder
//
//  Created by Ed Schmalzle on 2/26/09.
//  Copyright 2009 __MyCompanyName__. All rights reserved.
//

#import "Station.h"


@implementation Station

@synthesize name, marketCity, signal, frequency;

-(NSString *) displayValue {
	
	NSMutableString *displayValue = [[NSMutableString alloc] init];
	[displayValue appendFormat: @"%@ %@", frequency, name];
	return displayValue;
}
@end
