# Flutter Application with Back4App Integration

> Create a Flutter app that connects to Back4App, a Backend-as-a-Service (BaaS) platform, to manage tasks.
> 
> Set-up the Back4App backend, creating the Flutter app to implement save, delete, update functionality to interact with the backend.

#### Software, Tools and SDKs


- [Windows 11 or Above](https://www.microsoft.com/software-download/windows11)
- [Android Studio](https://developer.android.com/studio)
- [GitHub](https://github.com)
- [Open JDK 17](https://openjdk.org/projects/jdk/17)
- [Chrome](https://www.google.com/chrome)
- [VS Code](https://code.visualstudio.com/)
- [Flutter SDK](https://flutter.dev)

#### Development Environment Configuration

- Install above Softwares, Tools and SDKs.
- Install Android SDK in D drive
- Set Android_Home in system path
- Download Flutter SDK from this link [Flutter](https://storage.googleapis.com/flutter_infra_release/releases/stable/windows/flutter_windows_3.16.0-stable.zip):
- Extract the zip file and place the contained flutter in the desired installation location for the Flutter SDK (for example, %USERPROFILE%\flutter, D:\dev\flutter).
- Update your path
- From the Start search bar, enter ‘env’ and select Edit environment variables for your account.
- Under User variables check if there is an entry called Path:
 -If the entry exists, append the full path to flutter\bin using ; as a separator from existing values.
 -If the entry doesn’t exist, create a new user variable named Path with the full path to flutter\bin as its value.

The following command tells you whether the flutter and dart commands originate from the same bin directory and are therefore compatible
   ```
  $ where flutter dart
  C:\path-to-flutter-sdk\bin\flutter
  C:\path-to-flutter-sdk\bin\flutter.bat
  C:\path-to-dart-sdk\bin\dart.exe        :: this should go after `C:\path-to-flutter-sdk\bin\` commands
  C:\path-to-flutter-sdk\bin\dart
  C:\path-to-flutter-sdk\bin\dart.bat
   ```
- Run ```flutter doctor``` from Terminal to validate the Flutter SDK installation.
- Configure Android Studio :
   ```
   $ flutter config --android-studio-dir=<directory>  //set the directory that Android Studio is installed to
   $ flutter doctor
   ```
- Accept  licence from Terminal:
   ```
   $ flutter doctor --android-licenses
   ```
- For Android, run below command to configure the flutter directory and Android SDK Tools from Terminal:
   ```
   $ flutter config --android-studio-dir=<your_path_to_android_studio_directory>
   $ flutter doctor --android-licenses
   $ export ANDROID_HOME=~/Library/Android/sdk
   $ export PATH=$ANDROID_HOME/emulator/:$PATH
   $ export PATH=$ANDROID_HOME/platform-tools/:$PATH
   $ export PATH=$ANDROID_HOME/cmdline-tools/latest/bin/:$PATH
   ```
- Create a emulator named (Test_Android_Device) from Android Virtual Device Manager or via Terminal:
   ```
   $ avdmanager create avd -n Test_Android_Device -k "system-images;android-25;google_apis;x86"
   ```
- Run below command to launch the Test_Android_Device from Terminal:
   ```
   $ adb devices
   $ cd $ANDROID_HOME/emulator;
   $ nohup ./emulator -avd Test_Android_Device -no-snapshot -no-boot-anim -wipe-data
   ```
- To enable Web for Flutter Application, run below command from Terminal:
  ```
  $ flutter config --enable-web
  ```

#### Running the Application

> Flutter commands to get the dependencies and necessary packages:
   ```
   $ flutter pub get
   $ flutter pub outdated
   $ flutter pub upgrade
   ``` 

> To list all the configured devices, run below command from Terminal:
   ```
   $ flutter devices
   
   4 connected devices:

   iPhone 15 Pro Max (mobile)    • 6981250D-DD66-4CCE-96D5-EF002F2AB307 • ios (simulator)
   macOS (desktop)               • macos   • darwin-arm64 (macOS 14.0 23A344 darwin-arm64)
   Chrome (web)                  • chrome  • web-javascript (Google Chrome 118.0.5993.88)
   Test_Android_Device (mobile)  • Test_Android_Device  • android (emulator)
   ```
> Launch the applicaiton from Terminal via below commands
   ```
   Chrome Browser: flutter run -d chrome
   iOS Simulator: flutter run -d <iOS_Device_Name>
   Android Emulator: flutter run -d <Android_Device_Name>
   ```
> This will launch the application in respective environment:
   ```
   $ flutter run -d chrome  
   Launching lib/main.dart on Chrome in debug mode...
   Waiting for connection from debug service on Chrome...             12.5s
   This app is linked to the debug service: ws://127.0.0.1:49834/BtFIx-Lk_fU=/ws
   Debug service listening on ws://127.0.0.1:49834/BtFIx-Lk_fU=/ws
   ```


#### Application Features

- Developed for Web and Mobile, tested on Chrome and iOS Simulator.
- Setup Back4App account, which serves as a BaaS.
- Integrated the Flutter applicaiton with Back4App backend via Secret Keys.
- Added functionlaity such as Add, Update, Delete.

#### Application Screenshots

> Back4App Dashboard

Just use:

<img src="https://techhup-cloudfrontdemo.s3.ap-south-1.amazonaws.com/screens/Picture1.png" width="800">

<img src="https://techhup-cloudfrontdemo.s3.ap-south-1.amazonaws.com/screens/Picture2.png" width="800">

> Back4App API Key
<img src="https://techhup-cloudfrontdemo.s3.ap-south-1.amazonaws.com/screens/Picture4.png" width="800">

> Configuring API Key in Flutter Application
<img src="https://techhup-cloudfrontdemo.s3.ap-south-1.amazonaws.com/screens/Picture3.png" width="800">

> Flutter Web Application
<img src="https://techhup-cloudfrontdemo.s3.ap-south-1.amazonaws.com/screens/Picture1.png" width="800">
<img src="https://techhup-cloudfrontdemo.s3.ap-south-1.amazonaws.com/screens/Picture7.png" width="800">

> Flutter Mobile Application - Android
<img src="https://techhup-cloudfrontdemo.s3.ap-south-1.amazonaws.com/screens/Picture9.jpg" width="300">


> Adding Task - Android
<img src="https://techhup-cloudfrontdemo.s3.ap-south-1.amazonaws.com/screens/Picture9.jpg" width="300">

> Task Updated in Web Application
<img src="https://techhup-cloudfrontdemo.s3.ap-south-1.amazonaws.com/screens/Picture7.png" width="800">

> Adding Task - Web Application
<img src="https://techhup-cloudfrontdemo.s3.ap-south-1.amazonaws.com/screens/Picture5.png" width="800">

> Back4App Database Updated the Status
<img src="https://techhup-cloudfrontdemo.s3.ap-south-1.amazonaws.com/screens/Picture2.png" width="800">

> Refreshing Mobile Application to get Status
<img src="https://techhup-cloudfrontdemo.s3.ap-south-1.amazonaws.com/screens/Picture12.jpg" width="300">

> Adding a Task and Deleting it from Mobile 

<img src="https://techhup-cloudfrontdemo.s3.ap-south-1.amazonaws.com/screens/Picture9.jpg" width="300">
<img src="https://techhup-cloudfrontdemo.s3.ap-south-1.amazonaws.com/screens/Picture11.jpg" width="300">


> Opening new screen with task details

<img src="https://techhup-cloudfrontdemo.s3.ap-south-1.amazonaws.com/screens/Picture10.jpg" width="300">

#### References

- https://docs.flutter.dev/get-started/install/windows
-  [Android Studio](https://developer.android.com/studio?gclid=Cj0KCQiA3uGqBhDdARIsAFeJ5r0h_EQszGUyQNZoPVjHgJajo_rLt_WoueNP4XewGERt0SDSxdNmyIMaAiTREALw_wcB&gclsrc=aw.ds)
- [Bcak4App](https://www.back4app.com/docs/flutter/parse-sdk/parse-flutter-sdk)
- https://docs.github.com/en/get-started/writing-on-github
- https://docs.flutter.dev/reference/flutter-cli

#### Assignment Submission Done By:

> Ujwal Abhishek
> 2022mt12050
>UJWAL ABHISHEK ." <2022mt12050@wilp.bits-pilani.ac.in>
