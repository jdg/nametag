//
//  SettingsController.h
//  nametag
//
//  Created by Jonathan George on 8/28/08.
//  Copyright 2008 JDG. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TwoColumnEditableCell.h"
#import "nametagViewController.h"


@interface SettingsController : UITableViewController < UITextFieldDelegate > {
	CGSize cellSize;
	
	TwoColumnEditableCell *nameCell;
	
	UIView *headerView;
	UILabel *headerLabel;
	UIImage *headerImage;
	
	UIButton *saveButton;
}

@property(nonatomic,retain) TwoColumnEditableCell *nameCell;

@end
