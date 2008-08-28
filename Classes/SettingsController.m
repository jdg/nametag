//
//  SettingsController.m
//  nametag
//
//  Created by Jonathan George on 8/28/08.
//  Copyright 2008 JDG. All rights reserved.
//

#import "SettingsController.h"
#import "nametagViewController.h"
#import "TwoColumnEditableCell.h"

#define kStdButtonWidth			300.0
#define kStdButtonHeight		40.0

@implementation SettingsController

@synthesize nameCell;

- (id)initWithStyle:(UITableViewStyle)style {
	if (self = [super initWithStyle:style]) {

	}

	return self;
}


- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
	return 1;
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
	return 1;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
	switch (indexPath.row)
	{
		case 0:
		{
			NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];  
			NSDictionary *cellItem = [[NSDictionary alloc] init];
			cellItem = [NSDictionary dictionaryWithObjectsAndKeys:@"your name", @"title", [userDefaults stringForKey:@"name"], @"value", nil];
			[nameCell setData:cellItem];
			nameCell.textField.delegate = self;
			return nameCell;
		}
	}
	
	return nil;
}

/*
 To conform to Human Interface Guildelines, since selecting a row would have no effect (such as navigation), make sure that rows cannot be selected.
 */
- (NSIndexPath *)tableView:(UITableView *)tableView willSelectRowAtIndexPath:(NSIndexPath *)indexPath {
	//	[self dismissModalViewControllerAnimated:YES];
	return nil;	
}


- (void)dealloc {
	[saveButton release];
	[headerLabel release];
	[super dealloc];
}

- (void)viewWillAppear:(BOOL)animated {
	NSLog(@"SettingsController: viewWillAppear");
	[super viewWillAppear:animated];
}

- (void)viewDidAppear:(BOOL)animated {
	NSLog(@"SettingsController: viewDidAppear");
	[super viewDidAppear:animated];
}

- (void)viewWillDisappear:(BOOL)animated {
	NSLog(@"SettingsController: viewWillDisappear");
}

- (void)viewDidDisappear:(BOOL)animated {
	NSLog(@"SettingsController: viewDidDisappear");
}

- (void)didReceiveMemoryWarning {
	[super didReceiveMemoryWarning];
}

- (void)viewDidLoad {
	NSLog(@"SettingsController viewDidLoad");
	[super viewDidLoad];
	
	// Header
	saveButton = [[UIButton buttonWithType:UIButtonTypeRoundedRect] retain];
	saveButton.frame = CGRectMake(10.0, 0.0, kStdButtonWidth, kStdButtonHeight);
	[saveButton setTitle:@"Save" forState:UIControlStateNormal];
	saveButton.backgroundColor = [UIColor clearColor];
	[saveButton addTarget:self action:@selector(action:) forControlEvents:UIControlEventTouchUpInside];	
	self.tableView.tableFooterView = saveButton;

	// Footer 
	UIImageView *anImageView = [[UIImageView alloc] initWithFrame:CGRectMake(4.0, 4.0, 320, 60)];
    anImageView.image = [UIImage imageNamed:@"settingsHeader.png"];
	self.tableView.tableHeaderView = anImageView;
	
	self.nameCell = [[TwoColumnEditableCell alloc] initWithFrame:CGRectZero];
	
	[self.tableView reloadData];
}

- (void)action:(id)sender
{
	NSLog(@"name key cell is ui text field is: %@", [nameCell.textField text]);
	
	if ([[nameCell.textField text] isEqualToString:@""]) {
		UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"What is your name?" message:@"The name field is required."
													   delegate:self cancelButtonTitle:@"OK" otherButtonTitles: nil];
		[alert show];	
		[alert release];
	} else {
		NSUserDefaults *standardUserDefaults = [NSUserDefaults standardUserDefaults];
		
		if (standardUserDefaults) {
			[standardUserDefaults setObject:[nameCell.textField text] forKey:@"name"];
			[standardUserDefaults synchronize];
		}
		[self dismissModalViewControllerAnimated:YES];
	}
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
	[self action:0];
	return YES;
}


@end

