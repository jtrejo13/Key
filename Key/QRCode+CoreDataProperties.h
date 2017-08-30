//
//  QRCode+CoreDataProperties.h
//  Key
//
//  Created by Juan Trejo on 8/29/17.
//  Copyright © 2017 Key. All rights reserved.
//

#import "QRCode+CoreDataClass.h"


NS_ASSUME_NONNULL_BEGIN

@interface QRCode (CoreDataProperties)

+ (NSFetchRequest<QRCode *> *)fetchRequest;

@property (nullable, nonatomic, copy) NSString *category;
@property (nullable, nonatomic, retain) NSObject *image;
@property (nullable, nonatomic, retain) NSObject *members;

@end

NS_ASSUME_NONNULL_END
