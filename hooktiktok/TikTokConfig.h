//
//  TikTokConfig.h
//  hooktiktok
//
//  Created by chenxk on 2019/3/18.
//

#import <Foundation/Foundation.h>
#import <objc/runtime.h>

NS_ASSUME_NONNULL_BEGIN

@interface TikTokConfig : NSObject
//是否开启国家或地区选择
@property (readonly, nonatomic, assign) BOOL openSelect;

@property (readonly, nonatomic, copy) NSString *countryCode;

@property (readonly, nonatomic, copy) NSString *mcc;

@property (readonly, nonatomic, copy) NSString *mnc;

/**
 取消限制某些视频下载
 */
@property (readonly, nonatomic, assign) BOOL authorizedToDownload;

/**
 是否需要水印
 */
@property (readonly, nonatomic, assign) BOOL hasWatermark;

/**
 视频结束水印
 */
@property (readonly, nonatomic, assign) BOOL hasEndWatermark;

+ (instancetype)manager;

/**
 重新读取配置信息
 */
- (void)reload;


@end

NS_ASSUME_NONNULL_END
