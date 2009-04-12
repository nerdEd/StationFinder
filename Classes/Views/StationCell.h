//
//  StationCell.h
//  StationFinder
//
//  Created by Ed Schmalzle on 4/6/09.
//  Copyright 2009 nerdEd. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Station.h"

@interface StationCell : UITableViewCell {
	IBOutlet UILabel *nameLabel;
	IBOutlet UILabel *frequencyLabel;
	
	Station *station;
}

@property(nonatomic, retain) UILabel *nameLabel;
@property(nonatomic, retain) UILabel *frequencyLabel;
@property(nonatomic, retain) Station *station;

@end
