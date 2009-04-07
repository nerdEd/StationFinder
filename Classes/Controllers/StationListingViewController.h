//
//  StationFinderViewController.h
//  StationFinder
//
//  Created by Ed Schmalzle on 2/26/09.
//  Copyright __MyCompanyName__ 2009. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Station.h"
#import "StationCell.h"

@interface StationListingViewController : UIViewController {
	NSMutableArray *stationList;
}

@property(nonatomic, retain) NSMutableArray *stationList;

- (StationCell *)createNewStationCellFromNib;

@end

