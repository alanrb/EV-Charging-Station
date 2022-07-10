# Add Flutter to existing app

![Screenshot](https://raw.githubusercontent.com/alanrb/EV-Charging-Station/main/screenshot/android_main.png)

**Add-to-app**
It’s sometimes not practical to rewrite your entire application in Flutter all at once. For those situations, Flutter can be integrated into your existing application piecemeal, as a library or module. That module can then be imported into your Android or iOS (currently supported platforms) app to render a part of your app’s UI in Flutter. Or, just to run shared Dart logic.

In a few steps, you can bring the productivity and the expressiveness of Flutter into your own app.

The  `add-to-app`  feature supports integrating multiple instances of any screen size. This can help scenarios such as a hybrid navigation stack with mixed native and Flutter screens, or a page with multiple partial-screen Flutter views.

Having multiple Flutter instances allows each instance to maintain independent application and UI state while using minimal memory resources. See more in the  [multiple Flutters](https://docs.flutter.dev/development/add-to-app/multiple-flutters)  page.


Let’s assume that you have an existing app at  `some/path/EVChargingStationAndroid`, and that you want your Flutter project as a sibling:

```
cd some/path/
$ flutter create -t module --org com.github.alanrb ev_charging_station_flutter
```

```
some/path/
├── ev_charging_station_flutter/
│   └── build/host/outputs/repo
│   └── .ios/
│       └── Flutter/
│         └── podhelper.rb
└── EVChargingStationAndroid/
│   └── settings.gradle
└── EVChargingStationiOS/
│   └── Podfile
│   └── Flutter
│       └── Debug
│       └── Release

```

## Android
### Setup - Depend on the Android Archive (AAR)

Let’s assume you built a Flutter module at  `some/path/ev_charging_station_flutter`, and then run:

```
cd some/path/ev_charging_station_flutter
flutter build aar
```

You will get the output:
```ruby

💪 Building with sound null safety 💪

Running Gradle task 'assembleAarDebug'...                          43.4s
✓ Built build/host/outputs/repo.
Running Gradle task 'assembleAarProfile'...                        40.8s
✓ Built build/host/outputs/repo.
Running Gradle task 'assembleAarRelease'...                        41.3s
✓ Built build/host/outputs/repo.

Consuming the Module
  1. Open <host>/app/build.gradle
  2. Ensure you have the repositories configured, otherwise add them:

      String storageUrl = System.env.FLUTTER_STORAGE_BASE_URL ?: "https://storage.googleapis.com"
      repositories {
        maven {
            url '/some/path/EV-Charging-Station/ev_charging_station_flutter/build/host/outputs/repo'
        }
        maven {
            url "$storageUrl/download.flutter.io"
        }
      }

  3. Make the host app depend on the Flutter module:

    dependencies {
      debugImplementation 'com.github.alanrb.ev_charging_station_flutter:flutter_debug:1.0'
      profileImplementation 'com.github.alanrb.ev_charging_station_flutter:flutter_profile:1.0'
      releaseImplementation 'com.github.alanrb.ev_charging_station_flutter:flutter_release:1.0'
    }


  4. Add the `profile` build type:

    android {
      buildTypes {
        profile {
          initWith debug
        }
      }
    }

To learn more, visit https://flutter.dev/go/build-aar
```

Let’s open the [settings.gradle](https://github.com/alanrb/EV-Charging-Station/blob/main/EVChargingStationAndroid/settings.gradle) and edit the section under `dependencyResolutionManagement`
```ruby
pluginManagement {  
  
  repositories {  
  gradlePluginPortal()  
        google()  
        mavenCentral()  
    }  
}  
dependencyResolutionManagement {  
  repositoriesMode.set(RepositoriesMode.PREFER_SETTINGS)  
    String storageUrl = System.env.FLUTTER_STORAGE_BASE_URL ?: "https://storage.googleapis.com"  
  repositories {  
  google()  
        mavenCentral()  
        maven {  
  url '../ev_charging_station_flutter/build/host/outputs/repo'  
  }  
  maven {  
  url "$storageUrl/download.flutter.io"  
  }  
 }}  
rootProject.name = "EVChargingStation"  
include ':app'
```
Next step, open  [app/build.gradle](https://github.com/alanrb/EV-Charging-Station/blob/main/EVChargingStationAndroid/app/build.gradle)  in host app `EVChargingStationAndroid` so that it includes the dependency:
```gradle
debugImplementation 'com.github.alanrb.ev_charging_station_flutter:flutter_debug:1.0'  
profileImplementation 'com.github.alanrb.ev_charging_station_flutter:flutter_profile:1.0'  
releaseImplementation 'com.github.alanrb.ev_charging_station_flutter:flutter_release:1.0'
```
```
some/path/
├── ev_charging_station_flutter/
│   └── build/
│       └── host
│           └── outputs
│                └── repo
│   └── .ios/
│       └── Flutter/
│         └── podhelper.rb
└── EVChargingStationAndroid/
│   └── settings.gradle
│   └── app
│       └── build.gradle
└── EVChargingStationiOS/
│   └── Podfile
│   └── Flutter
│       └── Debug
│       └── Release

```
## iOS
### Setup - Embed application and plugin frameworks in Xcode and Flutter framework with CocoaPods

Now, we have to create a  **Podfile**.
If you already have a  **Podfile**  created in your iOS project, then you can skip the first step.
Run this command from the iOS project directory:
```bash
pod init
```

Alternatively, instead of distributing the large **Flutter.framework** to other developers, machines, or continuous integration systems, you can instead generate **Flutter** as CocoaPods podspec. This produces a `Flutter.podspec` instead of an engine **Flutter.framework**. The App.framework and plugin frameworks will be generated as described in [Option B](https://docs.flutter.dev/development/add-to-app/ios/project-setup#option-b---embed-frameworks-in-xcode).

```
flutter build ios-framework --cocoapods --output=../EVChargingStationiOS/Flutter
```

```ruby
Building frameworks for com.github.alanrb.evChargingStationFlutterSDK in debug mode...
 ├─Creating Flutter.podspec...                                       2ms
 ├─Building App.xcframework...                                     33.6s
Running pod install...                                           1,546ms
 ├─Building plugins...                                             12.7s
 └─Moving to ../EVChargingStationiOS/Flutter/Debug                 132ms
Building frameworks for com.github.alanrb.evChargingStationFlutterSDK in release mode...
 ├─Creating Flutter.podspec...                                       1ms
 ├─Building App.xcframework...                                     60.2s
 ├─Building plugins...                                             13.7s
 └─Moving to ../EVChargingStationiOS/Flutter/Release               162ms
Frameworks written to /some/path/EV-Charging-Station/ev_charging_station_flutter/../EVChargingStationiOS/Flutter.
```

Host apps `EVChargingStationiOS` using CocoaPods to add Flutter to Podfile:
```bash
pod 'Flutter', :podspec => 'Flutter/Debug/Flutter.podspec'
```
```
some/path/
├── ev_charging_station_flutter/
│   └── build/host/outputs/repo
│   └── .ios/
│       └── Flutter/
│         └── podhelper.rb
└── EVChargingStationAndroid/
│   └── settings.gradle
└── EVChargingStationiOS/
│   └── Podfile
│   └── Flutter
│       └── Debug
│       └── Release

```
