//
//  TwoColumnEditableCell.m
//  highrise
//
//  Created by Jonathan George on 8/23/08.
//  Copyright 2008 JDG. All rights reserved.
//

#import "TwoColumnEditableCell.h"

#define kTextFieldWidth							100.0	// initial width, but the table cell will dictact the actual width

@implementation TwoColumnEditableCell

@synthesize titleLabel, textField;

- (id)initWithFrame:(CGRect)frame reuseIdentifier:(NSString *)reuseIdentifier {
	if (self = [super initWithFrame:frame reuseIdentifier:reuseIdentifier]) {
		// Initialization code
		
		// we need a view to place our labels on.
		UIView *myContentView = self.contentView;
		
		/*
		 init the title label.
		 set the text alignment to align on the left
		 add the label to the subview
		 release the memory
		 */
		self.titleLabel = [self newLabelWithPrimaryColor:[UIColor blackColor] selectedColor:[UIColor whiteColor] fontSize:16.0 bold:YES];
		self.titleLabel.textAlignment = UITextAlignmentRight; // default
		[myContentView addSubview:self.titleLabel];
		[self.titleLabel release];
		
		/*
		 init the url label. (you will see a difference in the font color and size here!
		 set the text alignment to align on the left
		 add the label to the subview
		 release the memory
		 */
		self.textField = [[UITextField alloc] initWithFrame:CGRectZero];

		self.textField.borderStyle = UITextBorderStyleNone;
		self.textField.textColor = [UIColor blackColor];
		self.textField.font = [UIFont systemFontOfSize:17.0];
		self.textField.backgroundColor = [UIColor whiteColor];
		self.textField.autocorrectionType = UITextAutocorrectionTypeNo;	// no auto correction support
		
		self.textField.keyboardType = UIKeyboardTypeDefault;
		self.textField.returnKeyType = UIReturnKeyDone;
		
		self.textField.clearButtonMode = UITextFieldViewModeWhileEditing;	// has a clear 'x' button to the right

		[myContentView addSubview:self.textField];
		[self.textField release];
		
	}
	return self;
}

/*
 this function will layout the subviews for the cell
 if the cell is not in editing mode we want to position them
 */
- (void)layoutSubviews {
	
    [super layoutSubviews];
	
	// getting the cell size
    CGRect contentRect = self.contentView.bounds;
	
	// In this example we will never be editing, but this illustrates the appropriate pattern
    if (!self.editing) {
		
		// get the X pixel spot
        CGFloat boundsX = contentRect.origin.x;
		CGRect frame;
		
        /*
		 Place the title label.
		 place the label whatever the current X is plus 10 pixels from the left
		 place the label 4 pixels from the top
		 make the label 200 pixels wide
		 make the label 20 pixels high
		 */
		frame = CGRectMake(boundsX + 3, 10, 100, 20);
		self.titleLabel.frame = frame;

		frame = CGRectMake(boundsX + 120, 10, kTextFieldWidth + 50, 20);
		self.textField.frame = frame;
	}
}
/*
 this function was taken from an XML example
 provided by Apple
 
 I can take no credit in this
 */
- (UILabel *)newLabelWithPrimaryColor:(UIColor *)primaryColor selectedColor:(UIColor *)selectedColor fontSize:(CGFloat)fontSize bold:(BOOL)bold
{
	/*
	 Create and configure a label.
	 */
	
    UIFont *font;
    if (bold) {
        font = [UIFont boldSystemFontOfSize:fontSize];
    } else {
        font = [UIFont systemFontOfSize:fontSize];
    }
	
    /*
	 Views are drawn most efficiently when they are opaque and do not have a clear background, so set these defaults.  To show selection properly, however, the views need to be transparent (so that the selection color shows through).  This is handled in setSelected:animated:.
	 */
	UILabel *newLabel = [[UILabel alloc] initWithFrame:CGRectZero];
	newLabel.backgroundColor = [UIColor whiteColor];
	newLabel.opaque = YES;
	newLabel.textColor = primaryColor;
	newLabel.highlightedTextColor = selectedColor;
	newLabel.font = font;
	newLabel.adjustsFontSizeToFitWidth = YES;
	
	return newLabel;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
	
	[super setSelected:selected animated:animated];
	
	// Configure the view for the selected state
}

/*
 this function gets in data from another area in the code
 you can see it takes a NSDictionary object
 it then will set the label text
 */
-(void)setData:(NSDictionary *)dict {
	self.titleLabel.text = [dict objectForKey:@"title"];
	self.textField.text  = [dict objectForKey:@"value"];
}



- (void)dealloc {
	[titleLabel dealloc];
	[textField dealloc];
	[super dealloc];
}

@end
