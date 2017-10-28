//
//  QRCodeSettingsViewController.h
//  Key
//
//  Created by Juan Trejo on 10/28/17.
//  Copyright © 2017 Key. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "QRCodeSettingsCell.h"

@interface QRCodeSettingsViewController : UITableViewController

@property (strong, nonatomic) UITableViewCell *firstNameCell;

@property (strong, nonatomic) UITextField *firstNameText;

@end
