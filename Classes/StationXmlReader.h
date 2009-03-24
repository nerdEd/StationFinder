//
//  StationXmlReader.h
//  StationFinder
//
//  Created by Ed Schmalzle on 3/4/09.
//  Copyright 2009 nerdEd. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Station.h"

@interface StationXmlReader : NSObject {

	@private
		Station *currentStation;
		NSMutableString *currentStationProperty;
		NSMutableArray *stationList;
}

@property (nonatomic, retain) Station *currentStation;
@property (nonatomic, retain) NSMutableString *currentStationProperty;
@property (nonatomic, retain) NSMutableArray *stationList;

- (NSMutableArray *)parseXMLFileAtURL:(NSURL *)URL parseError:(NSError **)error;

@end
