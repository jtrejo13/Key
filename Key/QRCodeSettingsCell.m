//
//  QRCodeSettingsCell.m
//  Key
//
//  Created by Juan Trejo on 10/28/17.
//  Copyright © 2017 Key. All rights reserved.
//

#import "QRCodeSettingsCell.h"

@implementation QRCodeSettingsCell

- (void)awakeFromNib {
    [super awakeFromNib];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (id)initWithProfile:(NSString*)profile ImageName:(NSString*)imageName {
    self = [super initWithStyle:UITableViewCellStyleDefault reuseIdentifier:nil];
    if (self) {
        self.textLabel.font = [UIFont systemFontOfSize:20.0];
        self.textLabel.text = profile;
        self.backgroundColor = [UIColor colorWithRed:1.0f green:1.0f blue:1.0f alpha:0.5f];
        self.imageView.image = [UIImage imageNamed:imageName];
        
        _textField = [[UITextField alloc] init];
        [self configureTextField:_textField];
        [self.contentView addSubview:_textField];
        _textField.hidden = YES;
    }
    return self;
}

- (void)layoutSubviews {
    
    [super layoutSubviews];
    self.imageView.bounds = CGRectMake(0, 0, 40, 40);
    [self.imageView setAutoresizingMask:UIViewAutoresizingNone];
    
}

- (void)configureTextField:(UITextField*)field {
    field.textColor = [UIColor colorWithRed:0.0 green:122.0/255.0 blue:1.0 alpha:1.0];
    field.text = @"@";
    field.autocorrectionType = UITextAutocorrectionTypeNo;
    field.borderStyle = UITextBorderStyleNone;
    field.frame = CGRectMake(80, 10, 170, 30);
    field.clearButtonMode = UITextFieldViewModeWhileEditing;
    field.contentVerticalAlignment = UIControlContentVerticalAlignmentCenter;
    field.font = [UIFont systemFontOfSize:20];
}

@end
