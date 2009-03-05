//
//  StationFinderViewController.h
//  StationFinder
//
//  Created by Ed Schmalzle on 2/26/09.
//  Copyright __MyCompanyName__ 2009. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreLocation/CoreLocation.h>
#import "Station.h"
#import "StationXmlReader.h"

@interface StationFinderViewController : UIViewController <CLLocationManagerDelegate> {
	IBOutlet UIActivityIndicatorView *activitySpinner;
	CLLocationManager *locationManager;
	NSMutableArray *stationList;
}

@property(nonatomic, retain) NSMutableArray *stationList;

- (void) addStation:(Station *)station;
@end

