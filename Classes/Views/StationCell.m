//
//  StationCell.m
//  StationFinder
//
//  Created by Ed Schmalzle on 4/6/09.
//  Copyright 2009 nerdEd. All rights reserved.
//

#import "StationCell.h"


@implementation StationCell

@synthesize nameLabel, frequencyLabel, station;

- (id)initWithFrame:(CGRect)frame reuseIdentifier:(NSString *)reuseIdentifier {
    if (self = [super initWithFrame:frame reuseIdentifier:reuseIdentifier]) {
        // Initialization code
    }
    return self;
}


- (void)setSelected:(BOOL)selected animated:(BOOL)animated {

    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}


- (void)dealloc {
    [super dealloc];
}


@end
