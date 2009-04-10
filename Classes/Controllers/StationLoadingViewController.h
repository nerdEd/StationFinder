//
//  StationLoadingViewController.h
//  StationFinder
//
//  Created by Ed Schmalzle on 3/22/09.
//  Copyright 2009 nerdEd. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreLocation/CoreLocation.h>
#import "StationXmlReader.h"

@class StationListingViewController;

@interface StationLoadingViewController : UIViewController <CLLocationManagerDelegate> {
	IBOutlet StationListingViewController *stationListingViewController;
	
	CLLocationManager *locationManager;
	NSMutableArray *stationList;
}

@property(nonatomic, retain) StationListingViewController *stationListingViewController;

@end
