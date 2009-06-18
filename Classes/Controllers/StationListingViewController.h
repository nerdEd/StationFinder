//
//  StationFinderViewController.h
//  StationFinder
//
//  Created by Ed Schmalzle on 2/26/09.
//  Copyright Ed Schmalzle 2009. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Station.h"
#import "StationCell.h"

@class StationDetailViewController;

@interface StationListingViewController : UIViewController {
	NSMutableArray *stationList;
	IBOutlet StationDetailViewController *stationDetailViewController;
}

@property(nonatomic, retain) NSMutableArray *stationList;
@property(nonatomic, retain) StationDetailViewController *stationDetailViewController;

- (StationCell *)createNewStationCellFromNib;

@end