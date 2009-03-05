//
//  StationXmlReader.h
//  StationFinder
//
//  Created by Ed Schmalzle on 3/4/09.
//  Copyright 2009 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Station.h"

@interface StationXmlReader : NSObject {

	@private
		Station *currentStation;
		NSMutableString *currentStationProperty;
	
}

@property (nonatomic, retain) Station *currentStation;
@property (nonatomic, retain) NSMutableString *currentStationProperty;

- (void)parseXMLFileAtURL:(NSURL *)URL parseError:(NSError **)error;

@end
