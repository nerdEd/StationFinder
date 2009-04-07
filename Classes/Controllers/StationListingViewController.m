//
//  StationFinderAppDelegate.m
//  StationFinder
//
//  Created by Ed Schmalzle on 2/26/09.
//  Copyright __MyCompanyName__ 2009. All rights reserved.
//

#import "StationListingViewController.h"
#import "StationCell.h"

@implementation StationListingViewController

@synthesize stationList;

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
	return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

- (NSInteger) tableView: (UITableView *) tableView numberOfRowsInSection: (NSInteger *) section {
	return [stationList count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath { 
	
	static NSString *CellIdentifier = @"Station"; 
	StationCell *cell = (StationCell*) [tableView dequeueReusableCellWithIdentifier:CellIdentifier]; 
	
	if (cell == nil) { 
		cell = [self createNewStationCellFromNib];
	} 
	
	Station *currentStation = [stationList objectAtIndex:indexPath.row];
	cell.nameLabel.text = currentStation.name;
	cell.frequencyLabel.text = currentStation.frequency;
	return cell; 
}

- (StationCell *)createNewStationCellFromNib {
	NSArray* nibContents = [[NSBundle mainBundle] loadNibNamed:@"StationCell" owner:self options:nil]; 
	NSEnumerator *nibEnumerator = [nibContents objectEnumerator]; 
	StationCell* stationCell = nil; 
	NSObject* nibItem = nil; 
	while ( (nibItem = [nibEnumerator nextObject]) != nil) { 
		if ( [nibItem isKindOfClass: [StationCell class]]) { 
			stationCell = (StationCell*) nibItem; 
			if ([stationCell.reuseIdentifier isEqualToString: @"Station"]) 
				break;  
			else 
				stationCell = nil; 
		} 
	} 
	return stationCell;
}

- (void)didReceiveMemoryWarning {
	[super didReceiveMemoryWarning];
}


- (void)dealloc {
	[super dealloc];
}

@end