//
//  StationFinderAppDelegate.m
//  StationFinder
//
//  Created by Ed Schmalzle on 2/26/09.
//  Copyright __MyCompanyName__ 2009. All rights reserved.
//

#import "StationListingViewController.h"

@implementation StationListingViewController

@synthesize stationTableView, stationList;

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
	return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

- (NSInteger) tableView: (UITableView *) tableView numberOfRowsInSection: (NSInteger *) section {
	return [stationList count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath { 
	
	static NSString *CellIdentifier = @"Station"; 
	UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier]; 
	
	if (cell == nil) { 
		cell = [[[UITableViewCell alloc] initWithFrame:CGRectZero reuseIdentifier:CellIdentifier] autorelease]; 
	} 
	
	Station *currentStation = [stationList objectAtIndex:indexPath.row];
	cell.text = [currentStation displayValue]; 
	return cell; 
}


- (void)didReceiveMemoryWarning {
	[super didReceiveMemoryWarning];
}


- (void)dealloc {
	[super dealloc];
}

@end