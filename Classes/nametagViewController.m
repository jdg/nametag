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

@synthesize hello, mynameis, name, infoButton, tagColors, nameButton;

- (void)showSettingsScreen
{
	NSLog(@"showSettingsScreen");
	SettingsController *l = [[SettingsController alloc] initWithNibName:@"SettingsView" bundle: nil];
	[self presentModalViewController:l animated:YES];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
	switch (interfaceOrientation) {
		case UIInterfaceOrientationLandscapeRight:
			return NO;
			break;
		case UIInterfaceOrientationLandscapeLeft:
			return NO;
			break;
		case UIInterfaceOrientationPortraitUpsideDown:
			return NO;
			break;
		default:
			break;
	}

	return NO;
}

- (void)setupLabels
{
	hello.font = [UIFont boldSystemFontOfSize:36.0];
	hello.adjustsFontSizeToFitWidth = YES;
	mynameis.font = [UIFont boldSystemFontOfSize:36.0];
	mynameis.adjustsFontSizeToFitWidth = YES;
	name.font = [UIFont fontWithName:@"Marker Felt" size:36.0];
	name.adjustsFontSizeToFitWidth = YES;
	name.userInteractionEnabled = YES;

	nameButton = [[UIButton buttonWithType:UIButtonTypeCustom] retain];
	nameButton.frame = name.frame;
	nameButton.backgroundColor = [UIColor clearColor];
	[nameButton addTarget:self	action:@selector(action:) forControlEvents:UIControlEventTouchUpInside];	
	[self.view addSubview:nameButton];
	
	NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];  
	name.text = [userDefaults stringForKey:@"name"];

	current_color_index = 0;
	
	if ([userDefaults integerForKey:@"current_color_index"] == nil) {
		NSLog(@"Current color index is nil.");
		current_color_index = 0;
	} else {
		NSLog(@"Color index is: %d", [userDefaults integerForKey:@"current_color_index"]);
		current_color_index = [userDefaults integerForKey:@"current_color_index"];
	}
}

- (void)action:(id)sender
{
	NSLog(@"Button clicked.");
	[self showSettingsScreen];
}

- (void)viewDidLoad {
	NSLog(@"Creating info button.");
	[infoButton addTarget:self action:@selector(action:) forControlEvents:UIControlEventTouchUpInside];

	NSLog(@"Setting up self.tagColors..");
	self.tagColors = [NSArray arrayWithObjects:[UIColor redColor], [UIColor blueColor], [UIColor greenColor],
					   [UIColor cyanColor], [UIColor brownColor], [UIColor purpleColor], [UIColor orangeColor],
					   [UIColor grayColor], nil];
}

- (void)viewWillAppear:(BOOL)animated {
	NSLog(@"viewWillAppear");
	[self setupLabels];
	[self updateBackgroundColor];
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
	[super didReceiveMemoryWarning];
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
	NSLog(@"touchesBegan - color index: %d", current_color_index);

	current_color_index = current_color_index + 1;
	NSLog(@"We have XYZ self.tagColors: %d", [self.tagColors count]);

	if (current_color_index >= [self.tagColors count]) {
		NSLog(@"Resetting color index.");
		current_color_index = 0;
	}

	
	NSLog(@"Resetting color index.");
	NSUserDefaults *standardUserDefaults = [NSUserDefaults standardUserDefaults];
	NSLog(@"Resetting color index.");
	if (standardUserDefaults) {
		NSLog(@"Setting string to %d", current_color_index);
		[standardUserDefaults setInteger:current_color_index forKey:@"current_color_index"];
		[standardUserDefaults synchronize];
	}

	[self updateBackgroundColor];
}


- (void)updateBackgroundColor
{
	NSLog(@"updateBackgroundColor");
	self.view.backgroundColor = [self.tagColors objectAtIndex:current_color_index];
}

- (void)dealloc {
	[self.tagColors release];
	[super dealloc];
}

@end
