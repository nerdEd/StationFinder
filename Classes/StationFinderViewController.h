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

@interface StationFinderViewController : UIViewController <CLLocationManagerDelegate, UITableViewDataSource> {
	IBOutlet UIActivityIndicatorView *activitySpinner;
	IBOutlet UITableView *stationTableView;
	IBOutlet UILabel *label;

	CLLocationManager *locationManager;
	NSMutableArray *stationList;
}

@property(nonatomic, retain) NSMutableArray *stationList;
@property(nonatomic, retain) UITableView *stationTableView;
@property(nonatomic, retain) UILabel *label;

@end

