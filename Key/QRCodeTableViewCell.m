//
//  QRCodeTableViewCell.m
//  Key
//
//  Created by Juan Trejo on 8/29/17.
//  Copyright © 2017 Key. All rights reserved.
//

#import "QRCodeTableViewCell.h"

#define CODE_NAME_TAG 1
#define CODE_MEMBERS_TAG 2
#define CODE_IMG_TAG 3

@implementation QRCodeTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
    // Configure the view for the selected state
}

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        self.textLabel.font = [UIFont systemFontOfSize:20.0];
        self.detailTextLabel.font = [UIFont systemFontOfSize:14.0];
        self.detailTextLabel.textColor = [UIColor lightGrayColor];
    }
    return self;
}

- (void)layoutSubviews {
    
    [super layoutSubviews];
    
    self.imageView.bounds = CGRectMake(0, 0, 80, 80);
    //Any additional setting that you want to do with image view
    [self.imageView setAutoresizingMask:UIViewAutoresizingNone];
    
}

/*
// CODE TO CUSTOMIZE TABLE VIEW
- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // configure control(s)
        _codeName = [[UILabel alloc] initWithFrame:CGRectMake(5, 10, 300, 30)];
        _codeName.textColor = [UIColor greenColor];
        _codeName.font = [UIFont fontWithName:@"Arial" size:12.0f];

        [self addSubview:_codeName];

        _codeName = [[UILabel alloc] initWithFrame:CGRectMake(5.0, 10.0, 300.0, 15.0)];
        _codeName.tag = CODE_NAME_TAG;
        _codeName.font = [UIFont systemFontOfSize:18.0];
        _codeName.textAlignment = NSTextAlignmentLeft;
        _codeName.textColor = [UIColor blackColor];
//        _codeName.autoresizingMask = UIViewAutoresizingFlexibleLeftMargin | UIViewAutoresizingFlexibleHeight;
        [self addSubview:_codeName];


        _codeMembers = [[UILabel alloc] initWithFrame:CGRectMake(5.0, 20.0, 220.0, 25.0)];
        _codeMembers.tag = CODE_MEMBERS_TAG;
        _codeMembers.font = [UIFont systemFontOfSize:14.0];
        _codeMembers.textAlignment = NSTextAlignmentLeft;
        _codeMembers.textColor = [UIColor lightGrayColor];
//        _codeMembers.autoresizingMask = UIViewAutoresizingFlexibleLeftMargin | UIViewAutoresizingFlexibleHeight;
        [self addSubview:_codeMembers];

        _codeImage = [[UIImageView alloc] initWithFrame:CGRectMake(325.0, 10.0, 80.0, 80.0)];
        _codeImage.tag = CODE_IMG_TAG;
//        _codeImage.autoresizingMask = UIViewAutoresizingFlexibleLeftMargin | UIViewAutoresizingFlexibleHeight;
        [self addSubview:_codeImage];
    }
    return self;
}
*/

@end
