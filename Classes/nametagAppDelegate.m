//
//  nametagAppDelegate.m
//  nametag
//
//  Created by Jonathan George on 8/28/08.
//  Copyright JDG 2008. All rights reserved.
//

#import "nametagAppDelegate.h"
#import "nametagViewController.h"

#import "Beacon.h"

@implementation nametagAppDelegate

@synthesize window;
@synthesize viewController;


- (void)applicationDidFinishLaunching:(UIApplication *)application {	
	NSString *applicationCode = @"8a0049bcff7782bb9322a6bacb788a68";
	[Beacon initAndStartBeaconWithApplicationCode:applicationCode useCoreLocation:YES];

	// Override point for customization after app launch	
    [window addSubview:viewController.view];
	[window makeKeyAndVisible];
}

- (void)applicationWillTerminate:(UIApplication *)application {
	[[Beacon shared] endBeacon];
}

- (void)dealloc {
    [viewController release];
	[window release];
	[super dealloc];
}


@end
