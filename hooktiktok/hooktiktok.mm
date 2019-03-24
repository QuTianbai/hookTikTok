#line 1 "/Users/chenxk/Documents/myworkspace/hooktiktok/hooktiktok/hooktiktok.xm"


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



#include <substrate.h>
#if defined(__clang__)
#if __has_feature(objc_arc)
#define _LOGOS_SELF_TYPE_NORMAL __unsafe_unretained
#define _LOGOS_SELF_TYPE_INIT __attribute__((ns_consumed))
#define _LOGOS_SELF_CONST const
#define _LOGOS_RETURN_RETAINED __attribute__((ns_returns_retained))
#else
#define _LOGOS_SELF_TYPE_NORMAL
#define _LOGOS_SELF_TYPE_INIT
#define _LOGOS_SELF_CONST
#define _LOGOS_RETURN_RETAINED
#endif
#else
#define _LOGOS_SELF_TYPE_NORMAL
#define _LOGOS_SELF_TYPE_INIT
#define _LOGOS_SELF_CONST
#define _LOGOS_RETURN_RETAINED
#endif

@class AWEShareServiceUtils; @class AWEUserModel; @class AWEDynamicWaterMarkExporter; @class CTCarrier; @class AWEAwemeModel; 
static NSString * (*_logos_orig$_ungrouped$CTCarrier$mobileCountryCode)(_LOGOS_SELF_TYPE_NORMAL CTCarrier* _LOGOS_SELF_CONST, SEL); static NSString * _logos_method$_ungrouped$CTCarrier$mobileCountryCode(_LOGOS_SELF_TYPE_NORMAL CTCarrier* _LOGOS_SELF_CONST, SEL); static NSString * (*_logos_orig$_ungrouped$CTCarrier$isoCountryCode)(_LOGOS_SELF_TYPE_NORMAL CTCarrier* _LOGOS_SELF_CONST, SEL); static NSString * _logos_method$_ungrouped$CTCarrier$isoCountryCode(_LOGOS_SELF_TYPE_NORMAL CTCarrier* _LOGOS_SELF_CONST, SEL); static NSString * (*_logos_orig$_ungrouped$CTCarrier$mobileNetworkCode)(_LOGOS_SELF_TYPE_NORMAL CTCarrier* _LOGOS_SELF_CONST, SEL); static NSString * _logos_method$_ungrouped$CTCarrier$mobileNetworkCode(_LOGOS_SELF_TYPE_NORMAL CTCarrier* _LOGOS_SELF_CONST, SEL); static void (*_logos_meta_orig$_ungrouped$AWEShareServiceUtils$_shareAwemeForSaveVideo$forBTDShareType$preprocess$delegateType$completion$)(_LOGOS_SELF_TYPE_NORMAL Class _LOGOS_SELF_CONST, SEL, id, long long, id, unsigned long long, id); static void _logos_meta_method$_ungrouped$AWEShareServiceUtils$_shareAwemeForSaveVideo$forBTDShareType$preprocess$delegateType$completion$(_LOGOS_SELF_TYPE_NORMAL Class _LOGOS_SELF_CONST, SEL, id, long long, id, unsigned long long, id); static void (*_logos_meta_orig$_ungrouped$AWEDynamicWaterMarkExporter$addWaterMarkWithUrl$composeOptions$model$needSaveToAlbum$userName$videoOutputSize$edgeData$canDirectAddVideoheader$progress$complete$onlyForCrop$watermarkTaskType$removeSourceFile$)(_LOGOS_SELF_TYPE_NORMAL Class _LOGOS_SELF_CONST, SEL, id, long long, id, bool, id, struct CGSize, id, bool, id, id, bool, unsigned long long, bool); static void _logos_meta_method$_ungrouped$AWEDynamicWaterMarkExporter$addWaterMarkWithUrl$composeOptions$model$needSaveToAlbum$userName$videoOutputSize$edgeData$canDirectAddVideoheader$progress$complete$onlyForCrop$watermarkTaskType$removeSourceFile$(_LOGOS_SELF_TYPE_NORMAL Class _LOGOS_SELF_CONST, SEL, id, long long, id, bool, id, struct CGSize, id, bool, id, id, bool, unsigned long long, bool); static void (*_logos_orig$_ungrouped$AWEDynamicWaterMarkExporter$waterMarkExporterFinished$)(_LOGOS_SELF_TYPE_NORMAL AWEDynamicWaterMarkExporter* _LOGOS_SELF_CONST, SEL, id); static void _logos_method$_ungrouped$AWEDynamicWaterMarkExporter$waterMarkExporterFinished$(_LOGOS_SELF_TYPE_NORMAL AWEDynamicWaterMarkExporter* _LOGOS_SELF_CONST, SEL, id); static BOOL (*_logos_orig$_ungrouped$AWEUserModel$authorizedToDownload)(_LOGOS_SELF_TYPE_NORMAL AWEUserModel* _LOGOS_SELF_CONST, SEL); static BOOL _logos_method$_ungrouped$AWEUserModel$authorizedToDownload(_LOGOS_SELF_TYPE_NORMAL AWEUserModel* _LOGOS_SELF_CONST, SEL); 

#line 23 "/Users/chenxk/Documents/myworkspace/hooktiktok/hooktiktok/hooktiktok.xm"



static NSString * _logos_method$_ungrouped$CTCarrier$mobileCountryCode(_LOGOS_SELF_TYPE_NORMAL CTCarrier* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd) {
    return [TikTokConfig manager].mcc;
}


static NSString * _logos_method$_ungrouped$CTCarrier$isoCountryCode(_LOGOS_SELF_TYPE_NORMAL CTCarrier* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd) {
    return [TikTokConfig manager].countryCode;
}


static NSString * _logos_method$_ungrouped$CTCarrier$mobileNetworkCode(_LOGOS_SELF_TYPE_NORMAL CTCarrier* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd) {
    return [TikTokConfig manager].mnc;
}







static void _logos_meta_method$_ungrouped$AWEShareServiceUtils$_shareAwemeForSaveVideo$forBTDShareType$preprocess$delegateType$completion$(_LOGOS_SELF_TYPE_NORMAL Class _LOGOS_SELF_CONST __unused self, SEL __unused _cmd, id arg2, long long arg3, id arg4, unsigned long long arg5, id arg6) {
    
    AWEAwemeModel *data = arg2;
    AWEVideoModel *model = data.video;
    [model setHasWatermark:[TikTokConfig manager].hasWatermark];
    if(model.endWatermarkDownloadURL != nil)
    {
        [model setHasEndWatermark:[TikTokConfig manager].hasEndWatermark];
    }
    _logos_meta_orig$_ungrouped$AWEShareServiceUtils$_shareAwemeForSaveVideo$forBTDShareType$preprocess$delegateType$completion$(self, _cmd, data, arg3, arg4, arg5, arg6);
}




static char _logos_property_key$_ungrouped$AWEAwemeModel$fileURL;__attribute__((used)) static NSString * _logos_method$_ungrouped$AWEAwemeModel$fileURL$(AWEAwemeModel* __unused self, SEL __unused _cmd){ return objc_getAssociatedObject(self, &_logos_property_key$_ungrouped$AWEAwemeModel$fileURL); }__attribute__((used)) static void _logos_method$_ungrouped$AWEAwemeModel$setFileURL$(AWEAwemeModel* __unused self, SEL __unused _cmd, NSString * arg){ objc_setAssociatedObject(self, &_logos_property_key$_ungrouped$AWEAwemeModel$fileURL, arg, OBJC_ASSOCIATION_COPY_NONATOMIC); }





static void _logos_meta_method$_ungrouped$AWEDynamicWaterMarkExporter$addWaterMarkWithUrl$composeOptions$model$needSaveToAlbum$userName$videoOutputSize$edgeData$canDirectAddVideoheader$progress$complete$onlyForCrop$watermarkTaskType$removeSourceFile$(_LOGOS_SELF_TYPE_NORMAL Class _LOGOS_SELF_CONST __unused self, SEL __unused _cmd, id arg2, long long arg3, id arg4, bool arg5, id arg6, struct CGSize arg7, id arg8, bool arg9, id arg10, id arg11, bool arg12, unsigned long long arg13, bool arg14) {
    AWEAwemeModel *model = arg4;
    model.fileURL = arg2;
    _logos_meta_orig$_ungrouped$AWEDynamicWaterMarkExporter$addWaterMarkWithUrl$composeOptions$model$needSaveToAlbum$userName$videoOutputSize$edgeData$canDirectAddVideoheader$progress$complete$onlyForCrop$watermarkTaskType$removeSourceFile$(self, _cmd, arg2, arg3, arg4, arg5, arg6, arg7, arg8, arg9, arg10, arg11, arg12, arg13, arg14);
}


static void _logos_method$_ungrouped$AWEDynamicWaterMarkExporter$waterMarkExporterFinished$(_LOGOS_SELF_TYPE_NORMAL AWEDynamicWaterMarkExporter* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd, id arg2) {
    if([TikTokConfig manager].hasWatermark)
    {
        _logos_orig$_ungrouped$AWEDynamicWaterMarkExporter$waterMarkExporterFinished$(self, _cmd, arg2);
    }
    else
    {
        AWEAwemeModel *model = [self model];
        _logos_orig$_ungrouped$AWEDynamicWaterMarkExporter$waterMarkExporterFinished$(self, _cmd, model.fileURL);
    }
}





static BOOL _logos_method$_ungrouped$AWEUserModel$authorizedToDownload(_LOGOS_SELF_TYPE_NORMAL AWEUserModel* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd) {
    if([TikTokConfig manager].authorizedToDownload)
    {
        return YES;
    }
    else
    {
        return _logos_orig$_ungrouped$AWEUserModel$authorizedToDownload(self, _cmd);
    }
}


static __attribute__((constructor)) void _logosLocalCtor_38b3eff8(int __unused argc, char __unused **argv, char __unused **envp)
{
    notificationCallback(NULL, NULL, NULL, NULL, NULL);
    CFNotificationCenterAddObserver(CFNotificationCenterGetDarwinNotifyCenter(),
                                    NULL,
                                    notificationCallback,
                                    CFSTR(kNotificationName),
                                    NULL,
                                    CFNotificationSuspensionBehaviorCoalesce);
    {Class _logos_class$_ungrouped$CTCarrier = objc_getClass("CTCarrier"); MSHookMessageEx(_logos_class$_ungrouped$CTCarrier, @selector(mobileCountryCode), (IMP)&_logos_method$_ungrouped$CTCarrier$mobileCountryCode, (IMP*)&_logos_orig$_ungrouped$CTCarrier$mobileCountryCode);MSHookMessageEx(_logos_class$_ungrouped$CTCarrier, @selector(isoCountryCode), (IMP)&_logos_method$_ungrouped$CTCarrier$isoCountryCode, (IMP*)&_logos_orig$_ungrouped$CTCarrier$isoCountryCode);MSHookMessageEx(_logos_class$_ungrouped$CTCarrier, @selector(mobileNetworkCode), (IMP)&_logos_method$_ungrouped$CTCarrier$mobileNetworkCode, (IMP*)&_logos_orig$_ungrouped$CTCarrier$mobileNetworkCode);Class _logos_class$_ungrouped$AWEShareServiceUtils = objc_getClass("AWEShareServiceUtils"); Class _logos_metaclass$_ungrouped$AWEShareServiceUtils = object_getClass(_logos_class$_ungrouped$AWEShareServiceUtils); MSHookMessageEx(_logos_metaclass$_ungrouped$AWEShareServiceUtils, @selector(_shareAwemeForSaveVideo:forBTDShareType:preprocess:delegateType:completion:), (IMP)&_logos_meta_method$_ungrouped$AWEShareServiceUtils$_shareAwemeForSaveVideo$forBTDShareType$preprocess$delegateType$completion$, (IMP*)&_logos_meta_orig$_ungrouped$AWEShareServiceUtils$_shareAwemeForSaveVideo$forBTDShareType$preprocess$delegateType$completion$);Class _logos_class$_ungrouped$AWEAwemeModel = objc_getClass("AWEAwemeModel"); { class_addMethod(_logos_class$_ungrouped$AWEAwemeModel, @selector(fileURL), (IMP)&_logos_method$_ungrouped$AWEAwemeModel$fileURL$, [[NSString stringWithFormat:@"%s@:", @encode(NSString *)] UTF8String]);class_addMethod(_logos_class$_ungrouped$AWEAwemeModel, @selector(setFileURL:), (IMP)&_logos_method$_ungrouped$AWEAwemeModel$setFileURL$, [[NSString stringWithFormat:@"v@:%s", @encode(NSString *)] UTF8String]);} Class _logos_class$_ungrouped$AWEDynamicWaterMarkExporter = objc_getClass("AWEDynamicWaterMarkExporter"); Class _logos_metaclass$_ungrouped$AWEDynamicWaterMarkExporter = object_getClass(_logos_class$_ungrouped$AWEDynamicWaterMarkExporter); MSHookMessageEx(_logos_metaclass$_ungrouped$AWEDynamicWaterMarkExporter, @selector(addWaterMarkWithUrl:composeOptions:model:needSaveToAlbum:userName:videoOutputSize:edgeData:canDirectAddVideoheader:progress:complete:onlyForCrop:watermarkTaskType:removeSourceFile:), (IMP)&_logos_meta_method$_ungrouped$AWEDynamicWaterMarkExporter$addWaterMarkWithUrl$composeOptions$model$needSaveToAlbum$userName$videoOutputSize$edgeData$canDirectAddVideoheader$progress$complete$onlyForCrop$watermarkTaskType$removeSourceFile$, (IMP*)&_logos_meta_orig$_ungrouped$AWEDynamicWaterMarkExporter$addWaterMarkWithUrl$composeOptions$model$needSaveToAlbum$userName$videoOutputSize$edgeData$canDirectAddVideoheader$progress$complete$onlyForCrop$watermarkTaskType$removeSourceFile$);MSHookMessageEx(_logos_class$_ungrouped$AWEDynamicWaterMarkExporter, @selector(waterMarkExporterFinished:), (IMP)&_logos_method$_ungrouped$AWEDynamicWaterMarkExporter$waterMarkExporterFinished$, (IMP*)&_logos_orig$_ungrouped$AWEDynamicWaterMarkExporter$waterMarkExporterFinished$);Class _logos_class$_ungrouped$AWEUserModel = objc_getClass("AWEUserModel"); MSHookMessageEx(_logos_class$_ungrouped$AWEUserModel, @selector(authorizedToDownload), (IMP)&_logos_method$_ungrouped$AWEUserModel$authorizedToDownload, (IMP*)&_logos_orig$_ungrouped$AWEUserModel$authorizedToDownload);}


}





