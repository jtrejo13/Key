//
//  ProfileManager.m
//  Key
//
//  Created by Juan Trejo on 9/16/17.
//  Copyright © 2017 Key. All rights reserved.
//

#import "ProfileManager.h"

@implementation ProfileManager

+ (ProfileManager *)sharedInstance
{
    static ProfileManager* _sharedManager;
    if (!_sharedManager) {
        static dispatch_once_t oncePredicate;
        dispatch_once(&oncePredicate, ^{
            _sharedManager = [[super allocWithZone:nil] init];
        });
    }
    return _sharedManager;
}

+ (id)allocWithZone:(struct _NSZone *)zone
{
    return [self sharedInstance];
}

- (id)copyWithZone:(struct _NSZone *)zone
{
    return self;
}

- (id)init
{
    self = [super init];
    if (self) {
        
        _socialMediaCodes = @[
            @"fb",
            @"ig",
            @"sc",
            @"tw",
            @"in",
            @"vmo",
            @"pin",
            @"git",
            @"sck",
            @"ybe",
            @"tum",
            @"red",
            @"fckr",
            @"sdncld",
            @"stfy",
            @"vine"
         ];
        
        _socialMediaNames = @{
            @"fb"      : @"Facebook",
            @"ig"      : @"Instagram",
            @"sc"      : @"Snapchat",
            @"tw"      : @"Twitter",
            @"in"      : @"LinkedIn",
            @"vmo"     : @"Venmo",
            @"pin"     : @"Pinterest",
            @"git"     : @"GitHub",
            @"sck"     : @"Slack",
            @"ybe"     : @"Youtube",
            @"tum"     : @"Tumblr",
            @"red"     : @"Reddit",
            @"fckr"    : @"Flickr",
            @"sdncld"  : @"SoundCloud",
            @"stfy"    : @"Spotify",
            @"vine"    : @"Vine"
        };
        /*
        _socialMediaNames = @{
            @"fb"      : [NSNumber numberWithUnsignedInteger:facebook],
            @"ig"      : [NSNumber numberWithUnsignedInteger:instagram],
            @"sc"      : [NSNumber numberWithUnsignedInteger:snapchat],
            @"tw"      : [NSNumber numberWithUnsignedInteger:twitter],
            @"in"      : [NSNumber numberWithUnsignedInteger:linkedin],
            @"vmo"     : [NSNumber numberWithUnsignedInteger:venmo],
            @"pin"     : [NSNumber numberWithUnsignedInteger:pinterest],
            @"git"     : [NSNumber numberWithUnsignedInteger:github],
            @"sck"     : [NSNumber numberWithUnsignedInteger:slack],
            @"ybe"     : [NSNumber numberWithUnsignedInteger:youtube],
            @"tum"     : [NSNumber numberWithUnsignedInteger:tumblr],
            @"red"     : [NSNumber numberWithUnsignedInteger:reddit],
            @"fckr"    : [NSNumber numberWithUnsignedInteger:flickr],
            @"sdncld"  : [NSNumber numberWithUnsignedInteger:soundcloud],
            @"stfy"    : [NSNumber numberWithUnsignedInteger:spotify]
        };
         */
        
        _socialMediaLinks = @{
            @"fb"       :	@"https://facebook.com/",
            @"ig"       :	@"https://instagram.com/_u/",
            @"sc"       :	@"https://snapchat.com/add/",
            @"tw"       :	@"https://twitter.com/",
            @"in"       :	@"https://linkedin.com/in/",
            @"vmo"      :	@"https://venmo.com/",
            @"pin"      :	@"https://pinterest.com/",
            @"git"      :	@"https://github.com/",
            @"sck"      :	@".slack.com/",
            @"ybe"      :	@"https://youtube.com/",
            @"tum"      :	@".tumblr.com/",
            @"red"      :	@"https://www.reddit.com/user/",
            @"fckr"     :   @"https://www.flickr.com/photos",
            @"sdncld"   :   @"https://soundcloud.com/",
            @"stfy"     :	@"https://open.spotify.com/user/",
            @"vine"     :   @"http"
        };
    }
    return self;
}

-(NSDictionary*)getSocialMediaUserInfoFromResult:(NSString*)scanResult
{
    NSMutableDictionary* socialMediaUserInfo = [[NSMutableDictionary alloc] init];
    
    NSArray* scannedAccounts = [scanResult componentsSeparatedByString:@"\n"];

    for (NSString* account in scannedAccounts) {
        NSArray* accountInfo = [account componentsSeparatedByString:@":"];
        NSString* socialMediaName = [_socialMediaNames objectForKey:accountInfo[0]];
        NSString* username = accountInfo[1];
        NSString* socialMediaURL = [_socialMediaLinks objectForKey:accountInfo[0]];
        
        [socialMediaUserInfo setObject:[NSArray arrayWithObjects:username, socialMediaURL, nil] forKey:socialMediaName];
    }
    return socialMediaUserInfo;
}

-(NSString *)getStringFromSocialMedia:(SocialMedia)media {
    
    return @"";
}

@end
