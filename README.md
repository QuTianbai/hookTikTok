# hookTikTok

iOS越狱版插件，对TikTok(国际版抖音)进行hook，以实现某些功能。当前只在iOS12越狱手机上做测试，TikTok版本10.4.0。如果是要在非越狱手机上使用的话，可以参照[AYTikTokPod](https://github.com/AYJk/AYTikTokPod)。

#### 开发工具
[MonkeyDev](https://github.com/AloneMonkey/MonkeyDev)


#### 功能
1. 可选择是否下载有水印视频。
2. 可选择是否下载有结尾的水印视频
3. 可选不同国家或地址。
4. 可取消某些视频限制下载

#### 设置界面
![设置页面](IMG_0040.PNG)
![设置页面](IMG_0041.PNG)

#### 安装

1. 越狱商店
插件已经上传`BigBoss`，可以搜索下载。

2. 编译文件
将release中的`deb`文件传到设备中，然后执行如下命令

```shell
dpkg -i <package>.deb
killall -HUP SpringBoard
```
3. 通过[MonkeyDev](https://github.com/AloneMonkey/MonkeyDev)安装到设备中

#### 参考链接

[TikTok(抖音国际版)逆向，全球的小姐姐们，我来啦！](https://juejin.im/post/5c19a38ae51d453e0a209256)