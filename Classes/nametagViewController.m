//
//  nametagAppDelegate.m
//  nametag
//
//  Created by Jonathan George on 8/28/08.
//  Copyright JDG 2008. All rights reserved.
//

#import "nametagAppDelegate.h"
#import "nametagViewController.h"
#import "SettingsController.h"

@implementation nametagViewController

@synthesize hello, mynameis, name, infoButton;

- (void)showSettingsScreen
{
	NSLog(@"showSettingsScreen");
	SettingsController *l = [[SettingsController alloc] initWithNibName:@"SettingsView" bundle: nil];
	[self presentModalViewController:l animated:YES];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
	return YES;
}

- (void)setupLabels
{
	hello.font = [UIFont boldSystemFontOfSize:36.0];
	hello.adjustsFontSizeToFitWidth = YES;
	mynameis.font = [UIFont boldSystemFontOfSize:36.0];
	mynameis.adjustsFontSizeToFitWidth = YES;
	name.font = [UIFont fontWithName:@"Marker Felt" size:36.0];
	name.adjustsFontSizeToFitWidth = YES;

	NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];  
	name.text = [userDefaults stringForKey:@"name"];
}

- (void)action:(id)sender
{
	NSLog(@"infoButton clicked.");
	[self showSettingsScreen];
}

- (void)viewDidLoad {
	NSLog(@"Creating info button.");
	infoButton = [[UIButton buttonWithType:UIButtonTypeInfoLight] retain];
	infoButton.backgroundColor = [UIColor clearColor];
	[infoButton addTarget:self action:@selector(action:) forControlEvents:UIControlEventTouchUpInside];

	[self.view addSubview:infoButton];
}

- (void)viewWillAppear:(BOOL)animated {
	NSLog(@"viewWillAppear");
	[self setupLabels];
	[super viewWillAppear:animated];
}

- (void)viewDidAppear:(BOOL)animated {
	NSLog(@"viewDidAppear");

	NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];  
	name.text = [userDefaults stringForKey:@"name"];
	
	if ([userDefaults stringForKey:@"name"] == nil || [[userDefaults stringForKey:@"name"] isEqualToString:@""]) {
		NSLog(@"Displaying settings screen.");
		[self showSettingsScreen];
	}
	
	[super viewDidAppear:animated];
}

- (void)viewWillDisappear:(BOOL)animated {
	NSLog(@"viewWillDisappear");
}

- (void)viewDidDisappear:(BOOL)animated {
	NSLog(@"viewDidDisappear");
}

- (void)didReceiveMemoryWarning {
	NSLog(@"%@ %@", self, NSStringFromSelector(_cmd));
	[super didReceiveMemoryWarning]; // Releases the view if it doesn't have a superview
	// Release anything that's not essential, such as cached data
}


- (void)dealloc {
	[super dealloc];
}

@end
