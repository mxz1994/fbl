#!/usr/bin/env bash

flutter create fbl;

flutter run;

下载sdk
flutter doctor 检查是否安装
1、flutter config --enable-web
2、cd <into project directory>
3、flutter create .
4、flutter run -d chrome


dio: 网络
sqflite: 数据库
pull_to_refresh: 下拉刷新，上拉加载
json_serializable: json序列化，自动生成model工厂方法
shared_preferences: 本地存储
fluttertoast: 吐司消息

## 1. 下载flutter

```
fluter doctor

flutter config --enable-web

```

## 2. 设置环境变量
ANDROID_HOME
FLUTTER_STORAGE_BASE_URL=https://storage.flutter-io.cn
PUB_HOSTED_URL=https://pub.flutter-io.cn
Path
%ANDROID_HOME%\emulator
%ANDROID_HOME%\platform-tools
%ANDROID_HOME%\tools