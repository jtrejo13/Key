//
//  QRCode+CoreDataProperties.m
//  Key
//
//  Created by Juan Trejo on 8/29/17.
//  Copyright © 2017 Key. All rights reserved.
//

#import "QRCode+CoreDataProperties.h"

@implementation QRCode (CoreDataProperties)

+ (NSFetchRequest<QRCode *> *)fetchRequest {
	return [[NSFetchRequest alloc] initWithEntityName:@"QRCode"];
}

@dynamic category;
@dynamic image;
@dynamic members;

@end
