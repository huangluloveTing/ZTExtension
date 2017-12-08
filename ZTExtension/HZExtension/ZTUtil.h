//
//  ZTUtil.h
//  ZTExtension
//
//  Created by 黄露 on 2017/12/8.
//  Copyright © 2017年 huanglu. All rights reserved.
//

#import <UIKit/UIKit.h>

static NSString * const ZTPrefs_About = @"prefs:root=General&path=About";
static NSString * const ZTPrefs_Accessibility = @"prefs:root=General&path=ACCESSIBILITY";
static NSString * const ZTPrefs_Airplane_Mode = @"prefs:root=AIRPLANE_MODE";
static NSString * const ZTPrefs_Auto_Lock  = @"prefs:root=General&path=AUTOLOCK";
static NSString * const ZTPrefs_Brightness = @"prefs:root=Brightness";
static NSString * const ZTPrefs_Bluetooth  = @"prefs:root=General&path=Bluetooth";
static NSString * const ZTPrefs_Date_Time  = @"prefs:root=General&path=DATE_AND_TIME";
static NSString * const ZTPrefs_FaceTime = @"prefs:root=FACETIME";
static NSString * const ZTPrefs_General = @"prefs:root=General";
static NSString * const ZTPrefs_Keyboard = @"prefs:root=General&path=Keyboard";
static NSString * const ZTPrefs_iCloud = @"prefs:root=CASTLE";
static NSString * const ZTPrefs_iCloud_Storage_Backup = @"prefs:root=CASTLE&path=STORAGE_AND_BACKUP";
static NSString * const ZTPrefs_International = @"prefs:root=General&path=INTERNATIONAL";
static NSString * const ZTPrefs_Location_Services = @"prefs:root=LOCATION_SERVICES";
static NSString * const ZTPrefs_Music = @"prefs:root=MUSIC";
static NSString * const ZTPrefs_Music_Equalizer = @"prefs:root=MUSIC&path=EQ";
static NSString * const ZTPrefs_Music_Volume_Limit = @"prefs:root=MUSIC&path=VolumeLimit";
static NSString * const ZTPrefs_Network =@"prefs:root=General&path=Network";
static NSString * const ZTPrefs_Nike_iPod = @"prefs:root=NIKE_PLUS_IPOD";
static NSString * const ZTPrefs_Notes = @"prefs:root=NOTES";
static NSString * const ZTPrefs_Notification = @"prefs:root=NOTIFICATI*****_ID";
static NSString * const ZTPrefs_Phone = @"prefs:root=Phone";
static NSString * const ZTPrefs_Photos = @"prefs:root=Photos";
static NSString * const ZTPrefs_Profile = @"prefs:root=General&path=ManagedConfigurationList";
static NSString * const ZTPrefs_Reset = @"prefs:root=General&path=Reset";
static NSString * const ZTPrefs_Safari = @"prefs:root=Safari";
static NSString * const ZTPrefs_Siri = @"prefs:root=General&path=Assistant";
static NSString * const ZTPrefs_Sounds = @"prefs:root=Sounds";
static NSString * const ZTPrefs_Software_Update = @"prefs:root=General&path=SOFTWARE_UPDATE_LINK";
static NSString * const ZTPrefs_Store = @"prefs:root=STORE";
static NSString * const ZTPrefs_Twitter = @"prefs:root=TWITTER";
static NSString * const ZTPrefs_Usage = @"prefs:root=General&path=USAGE";
static NSString * const ZTPrefs_VPN = @"prefs:root=General&path=Network/VPN";
static NSString * const ZTPrefs_Wallpaper = @"prefs:root=Wallpaper";
static NSString * const ZTPrefs_WiFi = @"prefs:root=WIFI";

@interface ZTUtil : NSObject

+ (void) openSystemSetting:(NSString *)sysytemName;

@end
