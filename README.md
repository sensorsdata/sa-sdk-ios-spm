# sa-sdk-ios-spm

## 隐私清单

SensorsAnalyticsSDK 5.0.12 的动态 XCFramework 在每个 framework 根目录中包含 `PrivacyInfo.xcprivacy`：

```text
SensorsAnalyticsSDK/SensorsAnalyticsSDK.xcframework/
├── ios-arm64/SensorsAnalyticsSDK.framework/PrivacyInfo.xcprivacy
└── ios-arm64_x86_64-simulator/SensorsAnalyticsSDK.framework/PrivacyInfo.xcprivacy
```

清单使用 SDK 源码中的 `SensorsAnalyticsSDK/Resources/Core/PrivacyInfo.xcprivacy`，声明设备 ID、崩溃数据、其他诊断数据，以及 SystemBootTime（`35F9.1`）和 UserDefaults（`CA92.1`）的使用原因。

`Package.swift` 继续使用 `.binaryTarget`。动态 framework 嵌入 App 时会携带清单，不需要新增资源 target，也不需要将 library product 设置为 `.dynamic`。清单应放在各个 `.framework` 内；仅放在 package 根目录或 `.xcframework` 根目录不会将它包含到 App 中。参见 [Apple 隐私清单打包说明](https://developer.apple.com/documentation/bundleresources/adding-a-privacy-manifest-to-your-app-or-third-party-sdk)。

更新 SDK 时，应在 framework 构建工程中将清单加入对应 target 的 Copy Bundle Resources，确认真机和模拟器产物都包含清单，再生成 XCFramework 并签名。向已签名的 framework 添加或修改清单会使原资源签名失效；本次补入清单后，发布前需要在打包环境重新签名。详见 [神策隐私清单与签名说明](https://manual.sensorsdata.cn/sa/docs/tech_sdk_client_wwdc_privacy/v0300)。

已于 2026-10-12 使用 Xcode 26.6，通过临时 App 的本地 Swift Package 依赖验证：模拟器构建、启动并加载 SDK 成功，运行时可读取清单；未签名的 iOS Archive 生成成功。模拟器 App 和真机归档中嵌入的清单均与提供的文件完全一致。模拟器构建时，Xcode 自动重新签名了嵌入 App 的 framework，最终 App 的签名校验通过。此验证未覆盖真机运行、发行签名及 App Store 上传校验。

接入方 Archive 后应检查 `Products/Applications/<App>.app/Frameworks/SensorsAnalyticsSDK.framework/PrivacyInfo.xcprivacy`，并在 Xcode Organizer 中生成 Privacy Report，核对 SDK 与 App 的实际数据使用情况。

## 神策埋点 SDK 官网
如需了解神策埋点 SDK 的更多商业授权信息，请访问[神策埋点 SDK 官网](https://jssdk.debugbox.sensorsdata.cn/)获取更多详细信息。

## 联系我们
若您有商业合作或产品集成需求，请通过下面的渠道联系我们获取专业服务与支持。

| 加微信号：skycode008，或扫码添加联系人 <img src="https://github.com/sensorsdata/sa-sdk-android/blob/master/WechatIMG180.jpg" width="300" height="450" /> | 扫码关注「神策埋点 SDK」公众号 ![gzh](https://github.com/sensorsdata/sa-sdk-android/blob/master/gzh.jpeg) |
| ------ | ------ |
