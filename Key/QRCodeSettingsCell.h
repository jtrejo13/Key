//
//  QRCodeSettingsCell.h
//  Key
//
//  Created by Juan Trejo on 10/28/17.
//  Copyright © 2017 Key. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface QRCodeSettingsCell : UITableViewCell

@property (strong, nonatomic) UIImageView *logo;
@property (strong, nonatomic) UILabel     *name;

- (id)initWithProfile:(NSString*)profile ImageName:(NSString*)imageName;
@end
