//
//  QRCodeDetailViewController.h
//  Key
//
//  Created by Juan Trejo on 10/5/17.
//  Copyright © 2017 Key. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface QRCodeDetailViewController : UIViewController <UINavigationBarDelegate>

@property (strong, nonatomic) UIImage* codeImage;
@property (strong, nonatomic) NSString* codeTitle;

@end
