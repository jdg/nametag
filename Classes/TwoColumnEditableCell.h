//
//  TwoColumnEditableCell.h
//  highrise
//
//  Created by Jonathan George on 8/23/08.
//  Copyright 2008 JDG. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface TwoColumnEditableCell : UITableViewCell {
	UILabel *titleLabel;
	UITextField	*textField;

	CGRect *textFieldRect;
}

-(void)setData:(NSDictionary *)dict;

-(UILabel *)newLabelWithPrimaryColor:(UIColor *)primaryColor selectedColor:(UIColor *)selectedColor fontSize:(CGFloat)fontSize bold:(BOOL)bold;

@property (nonatomic, retain) UILabel *titleLabel;
@property (nonatomic, retain) UITextField *textField;

@end
