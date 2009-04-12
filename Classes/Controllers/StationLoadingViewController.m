//
//  StationLoadingViewController.m
//  StationFinder
//
//  Created by Ed Schmalzle on 3/22/09.
//  Copyright 2009 nerdEd. All rights reserved.
//

#import "StationLoadingViewController.h"
#import "StationListingViewController.h"

@implementation StationLoadingViewController

@synthesize stationListingViewController, radioImage;

- (void)viewDidLoad {
	
	// Animate radio image
	[self animateRadio];
	
	// Get users location
	locationManager = [[CLLocationManager alloc] init]; 
	locationManager.delegate = self; 
	[locationManager startUpdatingLocation]; 

    [super viewDidLoad];	
}

- (void)locationManager:(CLLocationManager *)manager didUpdateToLocation:(CLLocation *)newLocation fromLocation:(CLLocation *)oldLocation { 	
	
	if ( !signbit( newLocation.horizontalAccuracy ) && newLocation.horizontalAccuracy <= kCLLocationAccuracyThreeKilometers ) {		
		StationXmlReader *stationXmlReader = [[StationXmlReader alloc] init];
		
		[locationManager stopUpdatingLocation];
		
		NSError *parseError = nil;
		NSString *apiEndpointString = [NSString stringWithFormat: @"http://api.npr.org/stations?lat=%1.2f&lon=%1.2f&apiKey=MDAzMTMxODQ4MDEyMzU2ODI5MjQzNjE3NA001", newLocation.coordinate.latitude, newLocation.coordinate.longitude];
		NSLog(apiEndpointString);
		stationList = [stationXmlReader parseXMLFileAtURL:[NSURL URLWithString: apiEndpointString] parseError:&parseError];
		
		[stationXmlReader dealloc];
		
		// Load station listing view to display local stations
		stationListingViewController.stationList = stationList;	
		[self presentModalViewController:stationListingViewController animated:YES]; 
	}
} 

- (void)locationManager:(CLLocationManager *)manager didFailWithError:(NSError *) error {
}

- (void)animateRadio {
	
	NSMutableArray *radioAnimationArray = [[NSMutableArray alloc] init];
		
	for( int i = 1; i < 41; i++ ) {
		[radioAnimationArray addObject: [UIImage imageNamed: [NSString stringWithFormat:@"radio-%i.png", i]]];
	}
	
	for( int i = 40; i > 0; i-- ) {
		[radioAnimationArray addObject: [UIImage imageNamed: [NSString stringWithFormat:@"radio-%i.png", i]]];
	}
	
	radioImage.animationImages = radioAnimationArray;
	radioImage.animationDuration = 7;
	[radioImage startAnimating];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

- (void)dealloc {
	[locationManager dealloc];
    [super dealloc];
}


@end
