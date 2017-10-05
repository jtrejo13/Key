//
//  QRCodeTableViewCell.h
//  Key
//
//  Created by Juan Trejo on 8/29/17.
//  Copyright © 2017 Key. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface QRCodeTableViewCell : UITableViewCell

@property (strong, nonatomic) IBOutlet UIImageView *codeImage;
@property (strong, nonatomic) IBOutlet UILabel *codeName;
@property (strong, nonatomic) IBOutlet UILabel *codeMembers;

@end
