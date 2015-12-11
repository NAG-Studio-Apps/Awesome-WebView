> #####The new release will probably come 1 or 2/2016. Sorry :(

# Android-Awesome-WebView
A simple WebView with SplashScreen and Offline handling | 100% native | 100% awesome

## Features:
  - Native: 100% Java
  - Light: NO dependencies
  - **Easy: You don't need to understand Java to get this running**
  - Customizable

## Why this and not Cordova/Ionic/Phonegap/.... ?
These frameworks are nice but very bloated with API's and plugins.<br/>
I just wanted to show a responsive website and show a custom error page,<br/>
so i decided to start the AwesomeWebView project.<br/>
<br/>

##The ultimate setup guide

### Step1: Basic setup
  - Clone or [download](https://github.com/greensn0w/Android-Awesome-WebView/archive/master.zip) this repository
  - Open Android Studio
  - Click `Import Project` and select the AwesomeWebView folder
  
  ![](http://i.imgur.com/dQIyWDq.png)
  - Android Studio may ask you to "sync" your project. <br/>
    Just accept this and install the Android Dependencies

### Step2: Setup AwesomeWebView
  - Go into `Customs.java` and modify the values to your liking
  - Now open `Localization.java` and replace the values if you want to
  - WOO thats it!

### Step3: Customize the Splashscreen
  - Ok you're not done yet :smile:
  - Open `res/layout/activity_splash.xml`
![](http://i.imgur.com/BQyGtSR.png)
  - Replace the texts by double-clicking them <br/>
    The grey bar at the top is hidden at runtime

### Step4: Customize the Offline handler
  - One of AwesomeWebView's coolest features is it's Out-Of-Box offline handling.<br/>
    If you want to you may completely change it to your liking
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
Please add your record in a format like this:<br/>
`{{APP_NAME}} by {{USERNAME/COMPANY}}`
<br/>

### Roadmap:
  - Add more views for server-side errors like 404 or 500
  - Add pull-to-refresh?
  - Easy setup script
  - (your idea ?)

## Support me :)
If you like my work star this repo and/or tell your friends about it!
<br/>
#####If you want to support me you can also buy me a coffee:

Gratipay: [![](https://img.shields.io/gratipay/greensn0w.svg)](https://gratipay.com/greensn0w/)

Flattr: [![](https://button.flattr.com/flattr-badge-large.png)](https://flattr.com/submit/auto?user_id=greensn0w&url=https%3A%2F%2Fgithub.com%2Fgreensn0w)

Bitcoin:  1EREBp24Dnjnp62FrM2zE4H9w7cqf8Fo5k

Litecoin: LWhTsJi76eKYsLbzUkJMeLpAZE2By1Gi4E

Dogecoin: DTQax9r18j3zZGV2CNgaxs6Bz8MKXS5DhR
