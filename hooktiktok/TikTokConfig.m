//
//  TikTokConfig.m
//  hooktiktok
//
//  Created by chenxk on 2019/3/18.
//

#import "TikTokConfig.h"

#define kSettingsPath @"/private/var/mobile/Library/Preferences/com.cjack.hooktiktok.plist"


static TikTokConfig *config;

@interface TikTokConfig ()

@property (readwrite, nonatomic, strong) NSMutableDictionary *prefs;

@property (readwrite, nonatomic, copy) NSString *countryCode;

@property (readwrite, nonatomic, copy) NSString *mcc;

@property (readwrite, nonatomic, copy) NSString *mnc;

/**
 取消限制某些视频下载
 */
@property (readwrite, nonatomic, assign) BOOL authorizedToDownload;

/**
 是否需要水印
 */
@property (readwrite, nonatomic, assign) BOOL hasWatermark;

/**
 视频结束水印
 */
@property (readwrite, nonatomic, assign) BOOL hasEndWatermark;
@end

@implementation TikTokConfig

+ (instancetype)manager
{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        config = [[TikTokConfig alloc] init];
    });
    return config;
}

- (instancetype)init
{
    self = [super init];
    if (self) {
        //读取本地配置
        self.prefs = [[NSMutableDictionary alloc] initWithContentsOfFile:kSettingsPath];
        [self updateValue];
    }
    return self;
}

- (void)updateValue
{
    self.countryCode = self.prefs[@"asd"][@"code"];
    self.mcc = self.prefs[@"asd"][@"mcc"];
    self.mnc = self.prefs[@"asd"][@"mnc"];
    self.hasWatermark = [self.prefs objectForKey:@"hasWatermark"] == nil?NO:[self.prefs[@"hasWatermark"] boolValue];
    self.hasEndWatermark = [self.prefs objectForKey:@"hasEndWatermark"] == nil?NO:[self.prefs[@"hasEndWatermark"] boolValue];
    self.authorizedToDownload = [self.prefs objectForKey:@"cancelAuthorized"] == nil?YES:[self.prefs[@"cancelAuthorized"] boolValue];
}

- (void)reload
{
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(6 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        self.prefs = [[NSMutableDictionary alloc] initWithContentsOfFile:kSettingsPath];
        [self updateValue];
    });
}

@end
