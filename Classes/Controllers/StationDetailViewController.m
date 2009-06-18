//
//  StationDetailViewController.m
//  StationFinder
//
//  Created by Ed Schmalzle on 5/6/09.
//  Copyright 2009 Ed Schmalzle. All rights reserved.
//

#import "StationDetailViewController.h"
#import "Station.h"

@implementation StationDetailViewController

@synthesize station, nameLabel, frequencyLabel, taglineLabel;

- (void)viewWillAppear: animated {
	
	nameLabel.text = station.name;
	frequencyLabel.text = station.frequency;
	taglineLabel.text = station.tagline;
}

- (IBAction)returnToListingView {
	[self dismissModalViewControllerAnimated:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning]; 
}

- (void)dealloc {
    [super dealloc];
}

@end