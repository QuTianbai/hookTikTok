//
//  TikTok_Header.h
//  analysisTikTokDylib
//
//  Created by chenxk on 2019/3/22.
//  Copyright © 2019 zhengshuokeji. All rights reserved.
//

#ifndef TikTok_Header_h
#define TikTok_Header_h

#import <Foundation/Foundation.h>

@interface AWEVideoModel

@property (nonatomic) BOOL hasWatermark;

@property (nonatomic) BOOL hasEndWatermark;

@property(readonly, nonatomic) id endWatermarkDownloadURL;

@end


@interface AWEAwemeModel

@property(retain, nonatomic) AWEVideoModel *video;

@property(nonatomic, copy) NSString *fileURL;

@end

@interface AWEDynamicWaterMarkExporter

- (id)model;

@end
#endif /* TikTok_Header_h */
