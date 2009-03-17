//
//  StationFinderAppDelegate.m
//  StationFinder
//
//  Created by Ed Schmalzle on 2/26/09.
//  Copyright __MyCompanyName__ 2009. All rights reserved.
//

#import "StationFinderViewController.h"

@implementation StationFinderViewController

@synthesize stationTableView, stationList;

// Upon loading the view we want to immediately determine the users location and build a station list
- (void)viewDidLoad {
	
	[super viewDidLoad];
	[activitySpinner startAnimating];
	
	// Get users location
	locationManager = [[CLLocationManager alloc] init]; 
	locationManager.delegate = self; 
	[locationManager startUpdatingLocation]; 
	
}

- (void)locationManager:(CLLocationManager *)manager didUpdateToLocation:(CLLocation *)newLocation fromLocation:(CLLocation *)oldLocation { 	
	
	[locationManager stopUpdatingLocation];
	
	StationXmlReader *stationXmlReader = [[StationXmlReader alloc] init];
	
	NSError *parseError = nil;
	NSString *apiEndpointString = [NSString stringWithFormat: @"http://api.npr.org/stations?lat=%1.2f&lon=%1.2f&apiKey=MDAzMTMxODQ4MDEyMzU2ODI5MjQzNjE3NA001", newLocation.coordinate.latitude, newLocation.coordinate.longitude];
	NSLog(apiEndpointString);
	stationList = [stationXmlReader parseXMLFileAtURL:[NSURL URLWithString: apiEndpointString] parseError:&parseError];
	
	[activitySpinner setHidden:YES];
	[label setHidden:YES];
	
	[stationTableView reloadData];
	[stationTableView setHidden:NO];
} 

- (void)locationManager:(CLLocationManager *)manager didFailWithError:(NSError *) error {
}

// The application only makes sense in portrait view
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
	[locationManager dealloc];
	[super dealloc];
}

@end