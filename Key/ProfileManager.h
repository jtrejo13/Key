//
//  ProfileManager.h
//  Key
//
//  Created by Juan Trejo on 9/16/17.
//  Copyright © 2017 Key. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef enum : NSUInteger {
    facebook,
    instagram,
    snapchat,
    twitter,
    linkedin,
    venmo,
    pinterest,
    github,
    slack,
    youtube,
    tumblr,
    reddit,
    flickr,
    soundcloud,
    spotify
} SocialMedia;

@interface ProfileManager : NSObject

+ (ProfileManager*)sharedInstance;
- (NSDictionary*)getSocialMediaUserInfoFromResult:(NSString*)scanResult;

@property (nonatomic, strong) NSDictionary* socialMediaNames;
@property (nonatomic, strong) NSDictionary* socialMediaLinks;

@end

