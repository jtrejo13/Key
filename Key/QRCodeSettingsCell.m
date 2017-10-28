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

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        self.textLabel.font = [UIFont systemFontOfSize:20.0];
    }
    return self;
}

- (id)initWithProfileName:(NSString*)name {
    self = [super initWithStyle:UITableViewCellStyleDefault reuseIdentifier:nil];
    if (self) {
        self.textLabel.font = [UIFont systemFontOfSize:20.0];
        self.textLabel.text = name;
        self.backgroundColor = [UIColor colorWithRed:1.0f green:1.0f blue:1.0f alpha:0.5f];
        NSString *filePath = [[NSBundle mainBundle] pathForResource:@"facebook" ofType:@"png"];
        self.imageView.image = [UIImage imageWithContentsOfFile:filePath];
    }
    return self;
}

- (void)layoutSubviews {
    
    [super layoutSubviews];
    
    self.imageView.bounds = CGRectMake(0, 0, 40, 40);
    //Any additional setting that to do with image view
    [self.imageView setAutoresizingMask:UIViewAutoresizingNone];
    
}

@end
