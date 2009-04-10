//
//  StationFinderAppDelegate.h
//  StationFinder
//
//  Created by Ed Schmalzle on 2/26/09.
//  Copyright nerdEd 2009. All rights reserved.
//

#import <UIKit/UIKit.h>

@class StationLoadingViewController;

@interface StationFinderAppDelegate : NSObject <UIApplicationDelegate> {
	IBOutlet UIWindow *window;
	IBOutlet StationLoadingViewController *viewController;
}

@property (nonatomic, retain) UIWindow *window;
@property (nonatomic, retain) StationLoadingViewController *viewController;

@end

