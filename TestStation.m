//
//  TestStation.m
//  StationFinder
//
//  Created by Ed Schmalzle on 1/15/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "GHUnit.h"
#import "Station.h"

@interface TestStation : GHTestCase { }
@end

@implementation TestStation

Station *stationInstance;

- (void)setUp {
	stationInstance = [[Station alloc] init];
}

- (void)tearDown {
	[stationInstance release];
}

- (void)testStationHasNameProperty {	
	SEL selector = @selector( name );
	GHAssertTrue([stationInstance respondsToSelector: selector], @"Station object should have name property");
}

- (void)testStationHasMarketCityProperty {
	SEL selector = @selector( marketCity );
	GHAssertTrue([stationInstance respondsToSelector: selector], @"Station object should have marketCity property");	
}

- (void)testStationHasSignalProperty {
	SEL selector = @selector( signal );
	GHAssertTrue([stationInstance respondsToSelector: selector], @"Station object should have signal property");	
}

- (void)testStationHasFrequencyProperty {
	SEL selector = @selector( frequency );
	GHAssertTrue([stationInstance respondsToSelector: selector], @"Station object should have frequency property");	
}

- (void)testStationHasTaglineProperty {
	SEL selector = @selector( tagline );
	GHAssertTrue([stationInstance respondsToSelector: selector], @"Station object should have tagline property");	
}

@end
