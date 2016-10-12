# Android-Awesome-WebView
A simple WebView with SplashScreen and Offline handling | 100% native | 100% awesome

## Features:
  - Native: 100% Java
  - Light: No dependencies
  - **Easy: You don't need to understand Java to get this running**
  - Customizable

## Why this and not Cordova/Ionic/Phonegap/.... ?
These frameworks are nice but very bloated with API's and plugins.<br/>
I just wanted to show a responsive website and custom error page,<br/>
so i decided to start the AwesomeWebView project.<br/>
<br/>

##The ultimate setup guide

### Step1: Basic setup
  - Clone this repository
  - Open Android Studio
  - Click `Import Project` and select the AwesomeWebView folder
  
  ![](http://i.imgur.com/dQIyWDq.png)
  - Android Studio may ask you to "sync" your project. <br/>
    Just accept this and install the Android Dependencies

### Step2: Setup AwesomeWebView
  - Go into `Customs.java` and modify the values
  - Optionally `Localization.java` for futher customization

### Step3: Customize the Splashscreen
  - Open `res/layout/activity_splash.xml`
![](http://i.imgur.com/BQyGtSR.png)
  - Replace the texts by double-clicking them <br/>
    The grey bar at the top is hidden at runtime
    
  - Alternatively remove the texts and add an image

### Step4: Customize the Offline handler
  - One of AwesomeWebView's coolest features is it's ootb offline handling.<br/>
    If you want to, you may completely customize it.
  - Open `res/layout/activity_offline.xml`
![](http://i.imgur.com/wgaXJxQ.png)
  - All labels are editable by double-klicking as usual
  - The image can be replaced by placing a new `radio.png` inside `src/main/res/drawable`
![](http://i.imgur.com/2LsJiMI.png)

### Step 5: Make it yours
 - Open `manifests/AppManifest.xml`
 - Replace `package="me.ciwix.awesome_webview"` by the package name of your app.<br/>
This is usually a reverse domain name like `com.yourcompany.coolApp`
 - Open `res/values/strings.xml`
 - Replace the `Awesome WebView` in `<string name="app_name">Awesome WebView</string>` with your app's name

### DONE!
Now you have your own native webview app.<br/>
If you built something awesome, you can immortalize yourself by editing the `Usages`-Page in the Wiki.<br/>
<br/>

### Roadmap:
  - Add more views for server-side errors like 404 or 500
  - Add pull-to-refresh?
  - Easy setup script
  - (your idea ?)
