//
//  nametagAppDelegate.h
//  nametag
//
//  Created by Jonathan George on 8/28/08.
//  Copyright JDG 2008. All rights reserved.
//

#import <UIKit/UIKit.h>

@class nametagViewController;

@interface nametagAppDelegate : NSObject <UIApplicationDelegate> {
	IBOutlet UIWindow *window;
	IBOutlet nametagViewController *viewController;
}

@property (nonatomic, retain) UIWindow *window;
@property (nonatomic, retain) nametagViewController *viewController;

@end

