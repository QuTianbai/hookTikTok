// See http://iphonedevwiki.net/index.php/Logos

#if TARGET_OS_SIMULATOR
#error Do not support the simulator, please use the real iPhone Device.
#endif

#import <CoreGraphics/CoreGraphics.h>
#import <CoreFoundation/CoreFoundation.h>
#import <CoreTelephony/CTCarrier.h>
#import <UIKit/UIKit.h>

#import "TikTokConfig.h"
#import "TikTok_Header.h"

#define kNotificationName "com.cjack.hooktiktok-preferencesChanged"


static void notificationCallback(CFNotificationCenterRef center, void *observer, CFStringRef name, const void *object, CFDictionaryRef userInfo) {
    [[TikTokConfig manager] reload];
}


%hook CTCarrier

- (NSString *)mobileCountryCode
{
    return [TikTokConfig manager].mcc;
}

- (NSString *)isoCountryCode
{
    return [TikTokConfig manager].countryCode;
}

- (NSString *)mobileNetworkCode
{
    return [TikTokConfig manager].mnc;
}
%end



%hook AWEShareServiceUtils

+(void)_shareAwemeForSaveVideo:(id)arg2 forBTDShareType:(long long)arg3 preprocess:(id)arg4 delegateType:(unsigned long long)arg5 completion:(id)arg6
{
    //下载需要的视频源地址
    AWEAwemeModel *data = arg2;
    AWEVideoModel *model = data.video;
    [model setHasWatermark:[TikTokConfig manager].hasWatermark];
    if(model.endWatermarkDownloadURL != nil)
    {
        [model setHasEndWatermark:[TikTokConfig manager].hasEndWatermark];
    }
    %orig(data, arg3, arg4, arg5, arg6);
}
%end

%hook AWEAwemeModel
//添加存放下载文件路径
%property(nonatomic, copy) NSString *fileURL;

%end

%hook AWEDynamicWaterMarkExporter

+(void)addWaterMarkWithUrl:(id)arg2 composeOptions:(long long)arg3 model:(id)arg4 needSaveToAlbum:(bool)arg5 userName:(id)arg6 videoOutputSize:(struct CGSize)arg7 edgeData:(id)arg8 canDirectAddVideoheader:(bool)arg9 progress:(id)arg10 complete:(id)arg11 onlyForCrop:(bool)arg12 watermarkTaskType:(unsigned long long)arg13 removeSourceFile:(bool)arg14 {
    AWEAwemeModel *model = arg4;
    model.fileURL = arg2;
    %orig(arg2, arg3, arg4, arg5, arg6, arg7, arg8, arg9, arg10, arg11, arg12, arg13, arg14);
}

-(void)waterMarkExporterFinished:(id)arg2
{
    if([TikTokConfig manager].hasWatermark)
    {
        %orig(arg2);
    }
    else
    {
        AWEAwemeModel *model = [self model];
        %orig(model.fileURL);
    }
}
%end

%hook AWEUserModel

- (BOOL)authorizedToDownload
{
    if([TikTokConfig manager].authorizedToDownload)
    {
        return YES;
    }
    else
    {
        return %orig;
    }
}
%end

%ctor
{
    notificationCallback(NULL, NULL, NULL, NULL, NULL);
    CFNotificationCenterAddObserver(CFNotificationCenterGetDarwinNotifyCenter(),
                                    NULL,
                                    notificationCallback,
                                    CFSTR(kNotificationName),
                                    NULL,
                                    CFNotificationSuspensionBehaviorCoalesce);
    %init(_ungrouped);

//    NSLog(@"supportedLanguages:%@", [[ALPLocalizationsManager sharedInstance] supportedLanguages]);
}





