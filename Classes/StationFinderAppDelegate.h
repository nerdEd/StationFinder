//
//  StationFinderAppDelegate.h
//  StationFinder
//
//  Created by Ed Schmalzle on 2/26/09.
//  Copyright __MyCompanyName__ 2009. All rights reserved.
//

#import <UIKit/UIKit.h>

@class StationFinderViewController;

@interface StationFinderAppDelegate : NSObject <UIApplicationDelegate> {
	IBOutlet UIWindow *window;
	IBOutlet StationFinderViewController *viewController;
}

@property (nonatomic, retain) UIWindow *window;
@property (nonatomic, retain) StationFinderViewController *viewController;

@end

