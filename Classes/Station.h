//
//  Station.h
//  StationFinder
//
//  Created by Ed Schmalzle on 2/26/09.
//  Copyright 2009 __MyCompanyName__. All rights reserved.
//

@interface Station : NSObject {
	NSString *name;
	NSString *marketCity;
	NSNumber *signal;
	NSNumber *frequency;
}

@property(nonatomic, retain) NSString *name;
@property(nonatomic, retain) NSString *marketCity;
@property(nonatomic, retain) NSNumber *signal;
@property(nonatomic, retain) NSNumber *frequency;

@end
