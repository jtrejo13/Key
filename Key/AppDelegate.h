//
//  AppDelegate.h
//  Key
//
//  Created by Juan Trejo on 8/28/17.
//  Copyright © 2017 Key. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreData/CoreData.h>
#import <UserNotifications/UserNotifications.h>
#import "RKSwipeBetweenViewControllers.h"
#import "QRCodeTableViewController.h"
#import "QRCodeCameraViewController.h"
#import "QRCodeSettingsViewController.h"

@interface AppDelegate : UIResponder <UIApplicationDelegate, UNUserNotificationCenterDelegate>

@property (strong, nonatomic) UIWindow *window;

@property (readonly, strong) NSPersistentContainer *persistentContainer;
@property (strong, nonatomic) UINavigationController *navigationController;
@property (strong, nonatomic) RKSwipeBetweenViewControllers *swipeController;

- (void)saveContext;

@end

