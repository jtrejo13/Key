//
//  AppDelegate.h
//  Key
//
//  Created by Juan Trejo on 8/28/17.
//  Copyright © 2017 Key. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreData/CoreData.h>
#import "RKSwipeBetweenViewControllers.h"
#import "QRCodeTableViewController.h"
#import "QRCodeCameraViewController.h"

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

@property (readonly, strong) NSPersistentContainer *persistentContainer;

- (void)saveContext;


@end

