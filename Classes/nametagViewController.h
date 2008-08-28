//
//  nametagViewController.h
//  nametag
//
//  Created by Jonathan George on 8/28/08.
//  Copyright JDG 2008. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface nametagViewController : UIViewController {
	IBOutlet UILabel *hello;
	IBOutlet UILabel *mynameis;
	IBOutlet UILabel *name;

	UIButton *infoButton;
}

@property (nonatomic, retain) IBOutlet UILabel *hello;
@property (nonatomic, retain) IBOutlet UILabel *mynameis;
@property (nonatomic, retain) IBOutlet UILabel *name;

@property (nonatomic, retain) UIButton *infoButton;

@end