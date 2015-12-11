[zip]: https://github.com/greensn0w/iOS-Awesome-WebView/archive/master.zip

> #####The new release will probably come 1/2016. Sorry :(

# iOS-Awesome-WebView
A simple WebView with SplashScreen and Offline handling | 100% native | 100% awesome

## Features:
  - Native: 100% Objective-C
  - Light: Only 1 dependency
  - **Easy: You don't need to understand Objective-C to get this running**
  - Customizable

## Why this and not Cordova/Ionic/Phonegap/.... ?
These frameworks are nice but very bloated with API's and plugins.<br/>
I just wanted to show a responsive website and show a custom error page,<br/>
so i decided to start the AwesomeWebView project.<br/>
<br/>
If you think this is useful, please star it so we can reach more people :)<br/>
## The ultimate setup guide

### Step1: Basic setup
  - Clone or [download][zip] this repository
  - Install cocoapods by typing this into a terminal -> `sudo gem install cocoapods`
  - Type `pod install` to download and install the dependencies
  - Open the AwesomeWebview**.xcworkspace**

### Step2: Setup AwesomeWebView
  - Choose the `Project Navigator` in XCode by clicking this icon in the left pane -> ![](https://i.imgur.com/e0eNTzQ.png)
  - Open the `ViewController.m` file. <br/>
    You can find it here:<br/>
    ![](https://i.imgur.com/xUi9N1x.png)
  - Right after the `#import` lines you'll find a `///////////////`-Block.<br/>
    Modify all these values to your liking
  - WOO thats it!

### Step3: Customize the Splashscreen
  - Ok you're not done yet :smile:
  - Open `LaunchScreen.xib`
  - Customize this View.<br/>
    It's shown when your app starts.

### Step4: Customize the Offline handler
  - One of AwesomeWebView's coolest features is it's Out-Of-Box offline handling.<br/>
    If you want to you may completely change it to your liking
  - Open `Main.storyboard`
  - Scroll right until you see the `ErrorView`
  - Don't get confused about the Questionmark.<br/>
    XCode cannot show the image here but it will be included at compile-time.<br/>
    If you want to change it, replace the `radio.png` in the `Media` folder
  - Modify the `ErrorView` to your linking

### DONE!
Now you have your own native webview app.<br/>
If you built something awesome, you can immortalize yourself by editing the `Usages`-Page in the Wiki.<br/>
Please add your record in a format like this:<br/>
`{{APP_NAME}} by {{USERNAME/COMPANY}}`
<br/>
<br/>
### Roadmap:
  - Add more views for server-side errors like 404 or 500
  - Add pull-to-refresh?
  - Easy setup script
  - (your idea ?)

## Support me :)
If you like my work star this repo and/or tell your friends about it!
<br/>
<br/>
#####If you want to support me you can also buy me a coffee:

Gratipay: [![](https://img.shields.io/gratipay/greensn0w.svg)](https://gratipay.com/greensn0w/)

Flattr: [![](https://button.flattr.com/flattr-badge-large.png)](https://flattr.com/submit/auto?user_id=greensn0w&url=https%3A%2F%2Fgithub.com%2Fgreensn0w)

Bitcoin:  1EREBp24Dnjnp62FrM2zE4H9w7cqf8Fo5k

Litecoin: LWhTsJi76eKYsLbzUkJMeLpAZE2By1Gi4E

Dogecoin: DTQax9r18j3zZGV2CNgaxs6Bz8MKXS5DhR
