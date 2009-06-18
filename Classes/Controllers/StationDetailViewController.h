//
//  StationDetailViewController.h
//  StationFinder
//
//  Created by Ed Schmalzle on 5/6/09.
//  Copyright 2009 Ed Schmalzle. All rights reserved.
//

#import <UIKit/UIKit.h>

@class Station;

@interface StationDetailViewController : UIViewController {
	IBOutlet UILabel *nameLabel;
	IBOutlet UILabel *frequencyLabel;
	IBOutlet UILabel *descriptionLabel;
	
	Station *station;
}

@property(nonatomic, retain) Station *station;
@property(nonatomic, retain) UILabel *nameLabel;
@property(nonatomic, retain) UILabel *frequencyLabel;
@property(nonatomic, retain) UILabel *descriptionLabel;

- (IBAction) returnToListingView;

@end
