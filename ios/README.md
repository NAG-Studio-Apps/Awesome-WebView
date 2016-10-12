[zip]: https://github.com/greensn0w/iOS-Awesome-WebView/archive/master.zip

# iOS-Awesome-WebView
A simple WebView with SplashScreen and Offline handling | 100% native | 100% awesome

## Features:
  - Native: 100% Objective-C
  - Light: Only 1 dependency
  - **Easy: You don't need to understand Objective-C to get this running**
  - Customizable

## Why this and not Cordova/Ionic/Phonegap/.... ?
These frameworks are nice but very bloated with API's and plugins.<br/>
I just wanted to show a responsive website and a custom error page,<br/>
so i decided to start the AwesomeWebView project.<br/>
<br/>

## The ultimate setup guide

### Step1: Basic setup
  - Clone this repository
  - Install cocoapods by typing this into a terminal -> `sudo gem install cocoapods`
  - Type `pod install` to download and install the dependencies
  - Open the AwesomeWebview**.xcworkspace**

### Step2: Setup AwesomeWebView
  - Choose the `Project Navigator` in XCode by clicking this icon in the left pane -> ![](https://i.imgur.com/e0eNTzQ.png)
  - Open the `ViewController.m` file. <br/>
    You can find it here:<br/>
    ![](https://i.imgur.com/xUi9N1x.png)
  - Right after the `#import` lines you'll find a `///////////////`-Block.<br/>
    Modify all these values if you want to.
    
### Step3: Customize the Splashscreen
  - Open `LaunchScreen.xib`
  - Customize this View.<br/>
    It's shown when your app starts.

### Step4: Customize the Offline handler
  - One of AwesomeWebView's coolest features is it's Out-Of-Box offline handling.<br/>
    If you want to you may completely customize it.
  - Open `Main.storyboard`
  - Scroll right until you see the `ErrorView`
  - Don't get confused about the Questionmark.<br/>
    XCode cannot show the image here but it will be included at compile-time.<br/>
    If you want to change it, replace the `radio.png` in the `Media` folder
  - Modify the `ErrorView` as much as you want.

### DONE!
Now you have your own native webview app.<br/>
If you built something awesome, you can immortalize yourself by editing the `Usages`-Page in the Wiki.<br/>

### Roadmap:
  - Add more views for server-side errors like 404 or 500
  - Add pull-to-refresh?
  - Easy setup script
  - (your idea ?)
