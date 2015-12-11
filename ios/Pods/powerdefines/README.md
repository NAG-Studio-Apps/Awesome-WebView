# objective-c-powerdefines
Some handy defines for objective-c that make coding a lot easier

## How to install

Put this in your Podfile:
```ruby
pod "powerdefines"
```

## Usage

Just include the powerdefines anywhere in your project like this:
```objective-c
#include <powerdefines/powerdefines.h>
```

## Defines
#### Switch NSStrings! \\^-^/
```objective-c
#define SWITCH PD_SWITCH
#define CASE PD_CASE
#define DEFAULT PD_DEFAULT

SWITCH(myColor){
  CASE(@"GREEN"){
    NSLog(@"YEAH GREEN!!!");
  }
  
  DEFAULT {
    NSLog(@"Nope. I hate %@", myColor);
  }
}
```

#### Define colors with one simple command!
```objective-c
myColor = PD_COLOR_RGBA(R, G, B, A);
myColor = PD_COLOR_RGB(R, G, B);
myColor = PD_COLOR_HEX(C);
```

#### A improved NSLog for more debug information
```objective-c
//If DEBUG is defined PD_LOG will output more debug information
//like line numbers and more
#define DEBUG
PD_LOG(@"App crash expected :|");
```
```objective-c
//If no DEBUG is defined PD_LOG will be an alias of NSLog
PD_LOG(@"App crash expected :|");
```

#### Manipulate the network-activity indicator
```objective-c
//Turn it on
PD_NETWORK_ACTIVITY_INDICATIOR_SHOW()

//Turn it off
PD_NETWORK_ACTIVITY_INDICATIOR_HIDE()

//Or set a BOOL
PD_NETWORK_ACTIVITY_INDICATIOR_VISIBLE(x)  
```

#### Get & Compare the iOS version
```objective-c
if(PD_SYSTEM_VERSION_EQUAL_TO(v)){...}

if(PD_SYSTEM_VERSION_GREATER_THAN(v)){...}

if(PD_SYSTEM_VERSION_GREATER_THAN_OR_EQUAL_TO(v)){...}

if(PD_SYSTEM_VERSION_LESS_THAN(v)){...}

if(PD_SYSTEM_VERSION_LESS_THAN_OR_EQUAL_TO(v)){...}
```

#### Get the device type
```objective-c
if(PD_DEVICE_IS_IPAD){...}

if(PD_DEVICE_IS_IPHONE){...}
```

#### Check if the Device supports Retina
```objective-c
if(PD_DEVICE_HAS_RETINA_SCREEN){...}
```

#### Check if the device supports multitasking
```objective-c
if(PD_DEVICE_SUPPORTS_MULTITASKING){...}
```

#### Invalidate and nil a timer
```objective-c
PD_INVALIDATE_TIMER(myTimer);
```

#### Access the AppDelegate
```objective-c
PD_APP_DELEGATE
```

#### Log the bounds of a view
```objective-c
PD_LOG_BOUNDS(view)
```

#### Log the frame of a view
```objective-c
PD_LOG_FRAME(view)
```

#### Cast a BOOL to NSString
```objective-c
NSString *result = PD_BOOL_TO_STRING(myBool);
```

### This documentation is not fully complete and i will extend it soon.

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
