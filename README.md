# xcsoar-lua-txt
Lua based scripts for XCSoar to allow sending text messages (SMS) from Android phones.

The main intent is to **communicate your glider's position to your base** via text messages (SMS).

<p>
<img src="https://user-images.githubusercontent.com/1215492/206404317-9509edfa-d4e4-4048-aa8c-a1890f514399.jpg" alt="the add-on in XCSoar" width="225"/>
<img src="https://user-images.githubusercontent.com/1215492/206404350-d7f3a938-e6a2-435f-892b-b05e049761a7.jpg" alt="the text message" width="300"/>
</p>

# 1. User Guide

This is an add-on for XCSoar, for Android only at this stage. It allows you to send text messages from XCSoar with a click of a button.    
The main intent is to send your position to a mobile phone, for whatever reason (landed out, ops normal, ...)   

It's a thing **I've made mostly for myself**, then decided to publish it since people expressed interest; it's a script, it's not designed to be particularly user-friendly. But if you're minimally IT-literate, and you pay enough attention to detail, you should be able to take advantage of this quite easily.   

The installation is manual on purpose: to mess around with scripts, you have to know what you're doing. Also, the procedure described in the instructions fit for an out-of-the-box installation of XCSoar, but being XCSoar quite customisable, I can't be sure of what you've done in yours, so I can't the required assumptions that an automated installation process would require.   

I've purposefully decided not to fork XCSoar, but make this an add-on instead, so that you can use this in conjunction with any of the other "versions" of XCSoar existing.
I'm not sure whether this add-on works on [TopHat](https://www.tophatsoaring.org/). If you find out, please let me know.

Feedback is very welcome, in form of [issues](https://github.com/brunotag/xcsoar-lua-txt/issues) in this Github repository.

## 1.1 Prerequisites (Android)

0 - [XCSoar](https://play.google.com/store/apps/details?id=org.xcsoar&hl=en_NZ&gl=US) Android App - duh!   
1 - [GSM Modem](https://play.google.com/store/apps/details?id=com.gsmmodem&hl=en_NZ&gl=US) Android App - the free version is fine, if you are ok with ads (credits: [Sindhi Developers](https://play.google.com/store/apps/developer?id=Sindhi+Developers))    
2 - [GSM Helper Tool](https://github.com/sadiqodho/GSM-Helper-Tool) Android App - this one isn't available on the Play Store, you need to install it from the .apk. Open [this link](https://github.com/sadiqodho/GSM-Helper-Tool/blob/master/download-app/latest-helper-tool-app.apk?raw=true) from your phone to do so (credits: [Muhammad Sadiq Odho](https://github.com/sadiqodho))   
3 - (optional, but recommended) a text editor for Android, for example [Text Editor](https://play.google.com/store/apps/details?id=com.byteexperts.texteditor&hl=en_NZ&gl=US) (credits: [Byte Mobile](https://play.google.com/store/apps/developer?id=Byte+Mobile&hl=en_NZ&gl=US))

## 1.2 Installation (Android)

0 - Install all the prerequisites - duh! - ensure that GSM Helper Tool has the "SMS" permission from your Android phone   
1 - (optional but recommended) make a backup copy of your XCSoarData folder from you Android phone   
2 - Copy the [/gestures](/gestures) and [/lua](/lua) folders, as they are, in your XCSoarData folder, on your Android phone   
3 - Open XCSoar   
4 - Navigate Config => System => Look => Language, Input   
5 - Tap the "Events" option. "txt.xci" should appear as an option. Tap it, click Select   
6 - Restart XCSoar. On the main screen, top right, you should now see a new button, TXT. Don't click it yet, next step is config   

## 1.3 Configuration (basic)

### 1.3.1 Configure GSM Modem

optional - If you want to learn more about GSM Modem, follow the [tutorial by the author](https://sindhitutorials.com/blog/gsm-modem-free-sms-android-app/).

### 1.3.1.1 Configure GSM Modem Settings

1 - Open GSM Modem     
2 - Tap Settings   
3 - Enter an available Port Number - a good one is 8787   
4 - Ensure "Receive SMS at URL" and "Outgoing No of SMS per minutes" are NOT selected   
5 - Tap Save   
6 - For good measure, close and reopen GSM Modem   

### 1.3.1.2 Configure GSM Modem "User Management"

1 - Open GSM Modem     
2 - Tap Users   
3 - Tap the round plus + sign       
4 - Enter "usr" in Username   
5 - Enter "zzz" in Password   
6 - Tick "Enable"   
7 - Click "Save"
note: these credentials are only local, they don't need to be secure. You can change them, but if you do so, you have also to update them in [config.lua](/lua/txt/config.lua)
8 - For good measure, close and reopen GSM Modem   

### 1.3.2 Configure our Add On

1 - Open the Text Editor application on your Android phone   
2 - From Text Editor, open [config.lua](/lua/txt/config.lua) on your phone. It will be in XCSoarData/lua/txt/config.lua   
3 - Edit the config file. You should at least change the phone number(s), the glider registration, and for gsm_modem_config the port, the username, and the password, according to what you entered in GSM Modem.   

Example: [config.lua](/lua/txt/config.lua)
```
return {
    glider = "I-SEXY",
    significant_other = "+3912345678"
    retrieve_phone = "+64987654321",
    opsnormal_phone = "+64123456789",
    friend_you_like_to_brag_with_phone = "+6411111111",
    unit = "feet",                      --or "metric"
    format = "simple",                  --or "g-maps"
    gsm_modem_config = {
        ip = "localhost",
        port = "8787",                  --http://xxx.xxx.xxx.xxx:[port] in your "GSM Modem" Android app
        username = "foo",               --you'll set this up in your "GSM Modem" Android app (USERS)
        password = "bar",               --same
    }
}
```

## 1.4 Use (basic)

1 - Open GSM Helper Tool. Leave it open in the background   
2 - Open GSM Modem. Start it (click the red "OFF" button, which should turn to a green "ON") Leave it open in the background   
3 - Open XCSoar. If testing, the SIM mode will ensure you have GPS coordinates to text      
4 - In XCSoar, open the menu, then navigate TXT => Ops Normal. You should see an "Ok, message sent" confirmation message, and a txt message should be soon received by the `opsnormal_phone` number you previously intered in config.lua

## 1.5 Advanced    

Before proceeding, **a word of Warning** - don't worry too much, you shouldn't be able to break XCSoar by stuffing this part up, but do worry a little bit: you could break the txt messaging add on.    
Make backups before proceding. Do this at home, or at least with a laptop nearby, not at the airfield, from the glider, just before launching.   

### 1.5.1 How to customise the default Ops Normal and Land Out modes

1 - Open the Text Editor application on your Android phone   
2 - From Text Editor, open one of the two out of the box provided functions, [_ops-normal.lua](lua/txt/_ops-normal.lua) or [_landing-out.lua](lua/txt/_landing-out.lua)    
(note: you can also make these changes from a computer, then copy the file back into XCSoarData)   
3 - Edit the value of the `status` field to customise the text message   
4 - Edit the list of phone numbers: you can add them in [config.lua](/lua/txt/config.lua) first, then reference them (as per default), or add them directly, between double quotes in that case.

Example:
[_ops-normal.lua](lua/txt/_ops-normal.lua)
``` 
local txt_engine = require("txt/lib/txt-engine");
local config = require("txt/config");

txt_engine.send({
    message = {
        glider = config.glider,
        status = "everything ok!",
        format = config.format
    },
    phones = {
        config.opsnormal_phone,
        config.significant_other,
        config.retrieve_phone,
        "+640001111100"
    },
    unit = config.unit,
    gsm_modem_config = config.gsm_modem_config,
});
```

### 1.5.2 How to add new buttons
The whole thing is based on XCSoar Lua & Events. 
You're a glider pilot, so you must be a smart chap: I'm pretty sure you can work it out by reverse-engineering the [txt.xci](gestures/txt.xci), which defines the custom buttons.
That's how I figured this out in the first place. Otherwise, please wait for the tutorial, which is...   
[...COMING SOON...]

## 1.6 Troubleshooting

### 1.6.1 Couldn't connect to server
#### 1.6.1.1 Problem
<img src="https://user-images.githubusercontent.com/1215492/206405872-a24603aa-f294-44e3-a345-ecb9e41ebf07.jpg" alt="the add-on in XCSoar" width="300"/>

#### 1.6.1.1 Solution
- Did you remember to open [GSM Helper Tool](https://github.com/sadiqodho/GSM-Helper-Tool) and leave it open in background?   
- Did you remember to open [GSM Modem](https://play.google.com/store/apps/details?id=com.gsmmodem&hl=en_NZ&gl=US), start it as described at 1.3.1, and leave it open in background?


# 2. Contribution Guide
... meh ... it's so small.. just open a PR, communicate the intent, we'll take it from there.
Or open an issue if you can't be bothered coding in Lua :-)
