# Flutter SDK Mobile

## Yêu cầu
- OS Platform:
    - Android -> `minSdkVersion: 23`
    - IOS -> `iOS Deployment Target: 9.0`
- Permissions: khai báo và cấp quyền lúc runtime
    - Android: Trong file `AndroidManifest.xml`
        ```
        <uses-permission android:name="android.permission.INTERNET" />
        <uses-permission android:name="android.permission.RECORD_AUDIO"/>
        ```

    - IOS: Trong file `Info.plist`
        ```
        <key>NSAppTransportSecurity</key>
        <dict>
            <key>NSAllowsArbitraryLoads</key><true/>
        </dict>
        <key>NSMicrophoneUsageDescription</key>
        <string>{Your permission microphone description}</string>
        ```

## Cài đặt
Sử dụng terminal:
```bash
$ flutter pub add call_flutter_plugin
```
Linking module:
- IOS:
    - Trong `ios/Podfile`:
        ```
        ...
        # Khai báo thư viện
        platform :ios, '9.0'
        source "https://gitlab.linphone.org/BC/public/podspec.git"

        target 'Your Project' do
            ...
            use_frameworks!
            use_modular_headers!

            flutter_install_all_ios_pods File.dirname(File.realpath(__FILE__))

            # Khai báo thư viện 
            pod 'linphone-sdk-novideo' , '5.1.36'
        end
        ```
    - Trong folder `ios` mở terminal, nhập dòng lệnh:
        ```bash
        $ rm -rf Pods/
        $ pod install
        ```

## Khai báo module
```
import 'package:call_flutter_plugin/call_flutter_plugin.dart';
import 'package:call_flutter_plugin/callkit/utils/sip_event.dart';
import 'package:call_flutter_plugin/callkit/utils/transport_type.dart';
import 'package:call_flutter_plugin/graph/extensions/extensions.dart';
import 'package:call_flutter_plugin/callkit/model/sip_configuration.dart';

// TODO: Using module
```
