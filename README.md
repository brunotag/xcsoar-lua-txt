# xcsoar-lua-txt
Lua based scripts for XCSoar to allow sending text messages (SMS) from Android phones.

The main intent is to **communicate your glider's position to your base** via text messages (SMS).

# 1. User Guide

This is an add-on for XCSoar, for Android only at this stage. It allows you to send text messages from XCSoar with a click of a button.    
The main intent is to send your position to a mobile phone, for whatever reason (landed out, ops normal, ...)

## 1.1 Prerequisites (Android)

0 - [XCSoar](https://play.google.com/store/apps/details?id=org.xcsoar&hl=en_NZ&gl=US) Android App - duh!   
1 - [GSM Modem](https://play.google.com/store/apps/details?id=com.gsmmodem&hl=en_NZ&gl=US) Android App - the free version is fine, if you are ok with ads   
2 - [GSM Helper Tool](https://github.com/sadiqodho/GSM-Helper-Tool) Android App - this one isn't available on the Play Store, you need to install it from the .apk   
3 - (optional, but recommended) a text editor for Android, for example [Text Editor](https://play.google.com/store/apps/details?id=com.byteexperts.texteditor&hl=en_NZ&gl=US)

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

1 - Open GSM Modem     
2 - Tap Settings   
3 - Enter an available Port Number - a good one is 8787   
4 - Ensure "Receive SMS at URL" and "Outgoing No of SMS per minutes" are NOT selected   
5 - Tap Save. Tap Close.   
optional - If you want to learn more about GSM Modem, follow the [tutorial by the author](https://sindhitutorials.com/blog/gsm-modem-free-sms-android-app/).

### 1.3.2 Configure our Add On

1 - Open the Text Editor application   
2 - From Text Editor, open [config.lua](/lua/txt/config.lua) on your phone. It will be in XCSoarData/lua/txt/config.lua   
3 - Edit the config file. You should at least change the phone number(s), the glider registration, and for gsm_modem_config the port, the username, and the password, according to what you entered in GSM Modem.   

## 1.4 Use (basic)

1 - Open GSM Helper Tool. Leave it open in the background   
2 - Open GSM Modem. Start it (click the red "OFF" button, which should turn to a green "ON") Leave it open in the background   
3 - Open XCSoar. If testing, the SIM mode will ensure you have GPS coordinates to text      
4 - Navigate TXT => Ops Normal. You should see an "Ok, message sent" confirmation message, and a txt message should be soon received by the `opsnormal_phone` number you previously intered in config.lua

## 1.5 Advanced 
[TODO]

## 1.6 Troubleshooting
[TODO]

# 2. Contribution Guide
... meh ... it's so small.. just open a PR, communicate the intent, we'll take it from there.
Or open an issue if you can't be bothered coding in Lua :-)
