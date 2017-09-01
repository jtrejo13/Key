//
//  ViewController.h
//  Key
//
//  Created by Juan Trejo on 8/28/17.
//  Copyright © 2017 Key. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <AVFoundation/AVFoundation.h>

@interface QRCodeCameraViewController : UIViewController <AVCaptureMetadataOutputObjectsDelegate>

@property (weak, nonatomic) IBOutlet UIView *viewScanner;

@property (weak, nonatomic) IBOutlet UILabel *lblStatus;

@property (weak, nonatomic) IBOutlet UIBarButtonItem *bbitemStart;

- (IBAction)startStopReading:(UIBarButtonItem *)sender;


@end
