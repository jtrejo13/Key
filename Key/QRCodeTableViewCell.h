//
//  QRCodeTableViewCell.h
//  Key
//
//  Created by Juan Trejo on 8/29/17.
//  Copyright © 2017 Key. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface QRCodeTableViewCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UIImageView *codeImage;
@property (weak, nonatomic) IBOutlet UILabel *members;

@end
