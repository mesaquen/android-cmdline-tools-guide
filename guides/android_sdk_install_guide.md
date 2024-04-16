---
title: "Android SDK command line tools only"
subtitle: A comprehensive guide on how to setup your development environment
subject: A comprehensive guide on how to setup android development environment
author: Mesaque Francisco

keywords:
  - "android"
  - "sdk"
  - "emulator"
  - "command line"
...

# Android SDK install guide

This guide was created to assist in setting up the development environment for Android mobile applications. My current environment is based on GNU/Linux, but I believe the steps described here can be adapted to your reality on other operating systems.

If you have any questions or suggestions, feel free to contact me through my GitHub ([@mesaquen](https://github.com/mesaquen)).

## Command line tools

- Go to [android sdk download
  page](https://developer.android.com/studio#command-line-tools-only)
- Look for "Command line tools only"
- Download the commandline tools for your operating system

### Extracting and setting up the environment variables

Create a directory named `.android_sdk` and extract the command line tools you downloaded earlier:

```code
mkdir .android_sdk
unzip commandlinetools-linux-9477386_latest.zip -d ~/.android_sdk/
```

Export the following environment variables in your .bashrc file:

```code
export ANDROID_SDK_ROOT="$HOME/.android_sdk"
export PATH="$ANDROID_SDK_ROOT/cmdline-tools/latest/bin:$PATH"
export PATH="$ANDROID_SDK_ROOT/emulator:$PATH"
```

### Install the latest cmdline-tools

```code
$ANDROID_SDK_ROOT/cmdline-tools/bin/sdkmanager \
--sdk_root=$ANDROID_SDK_ROOT "cmdline-tools;latest"
```

Once you've installed the command line tools, the sdkmanager should be able to recognize the SDK location, and you won't need to provide the sdk_root flag anymore.

### Install the platforms, build-tools and extras

```code
sdkmanager "platforms;android-33" "build-tools;33.0.2"
sdkmanager "extras;google;m2repository" "extras;android;m2repository"
sdkmanager "platform-tools" "tools"
sdkmanager --licenses
```

## Installed packages

To see a list of the installed packages, run:

```code
sdkmanager --list_installed
```

## AVD: Android Virtual Device

Before creating an AVD, you'll need to download the system images. To see a list of available images, run:

```code
sdkmanager --list | grep system-images
```

### Install the chosen system image

```code
sdkmanager "system-images;android-33;google_apis_playstore;x86_64"
```

### Creating the AVD

Create an AVD using the following command:

```code
avdmanager create avd -n device \
--device pixel -k "system-images;android-33;google_apis_playstore;x86_64"
```

To get a list of available virtual devices, run:

```code
avdmanager list avd
```

## Emulator

You can start the emulator by passing the name of the AVD with the
command:

```code
emulator @device
```

Here "device" is the name of the AVD.
