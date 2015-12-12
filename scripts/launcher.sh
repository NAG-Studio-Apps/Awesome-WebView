#!/bin/bash
RESTORE=$(echo -en '\033[0m')
RED=$(echo -en '\033[00;31m')
GREEN=$(echo -en '\033[00;32m')
YELLOW=$(echo -en '\033[00;33m')

BASEURI="https://github.com/greensn0w/Awesome-WebView/archive"
BRANCH="master"
FORMAT=".tar.gz"
DOWNLOAD_ONLY=false
W_IOS=true
W_ANDROID=true
NAME="Awesome-WebView"
ORIGINAL_NAME="$NAME"
APP_ID="moe.lukas.awesomewebview"

function cerr() {
    echo "${RED}==> $1 ${RESTORE}"
}

function cout() {
    echo "${GREEN}==> $1 ${RESTORE}"
}

function cwarn() {
    echo "${YELLOW}==> $1 ${RESTORE}"
}

function toLowerCase() {
    echo $1 | tr "[:upper:]" "[:lower:]"
}

function printHelp() {
    echo "
Usage:
-l | --download-only ->  Only download the repo and exit                 [false]
-b | --branch        ->  Set the branch you want to download             [master]
-n | --name          ->  Set the name of your app                        [Awesome-WebView]
-d | --id            ->  Set the id of your app                          [moe.lukas.awesomewebview]
--only-ios           ->  Build Awesome-WebView with iOS support only     [false]
--only-android       ->  Build Awesome-WebView with Android support only [false]

Note: The values in square brackets are the defaults"
    exit 0
}

function download() {
    local URL=$1
    command -v wget 1>/dev/null 2>&1 || {
        cwarn "No wget found. Trying to fallback to cURL"
        command -v curl 1>/dev/null 2>&1 || {
            cerr "Neither wget nor cURL is installed."
            cerr "Please install one of them and launch the script again."
            exit 1
        }

        curl -fsSL $URL
    }

    wget --quiet --show-progress $URL
}

function prepareIos() {
    cout "Preparing the iOS project..."
    local oldName="$ORIGINAL_NAME"
    local newName=$(echo $NAME | sed 's/ /_/g')

    mv $oldName $newName
    mv "${oldName}.xcodeproj" "${newName}.xcodeproj"
    mv "${newName}.xcodeproj/xcshareddata/xcschemes/${oldName}.xcscheme" "${newName}.xcodeproj/xcshareddata/xcschemes/${newName}.xcscheme"
    find . -type f  -print0 | xargs -0 sed -i '' "s/${oldName}/${newName}/g"
}

function prepareAndroid() {
    true
    cout "Preparing the Android project..."
}

arguments=($@)
index=0
for argument in "${arguments[@]}"; do
    index=`expr $index + 1`

    case $argument in
        --help|-h)
            printHelp
        ;;

        --branch|-b)
            BRANCH="${arguments[index]}"
        ;;

        --download-only|-l)
            DOWNLOAD_ONLY=true
        ;;

        --only-ios)
            W_ANDROID=false
        ;;

        --only-android)
            W_IOS=false
        ;;

        --name|-n)
            NAME="${arguments[index]}"
        ;;

        --id|-d)
            APP_ID="${arguments[index]}"
        ;;
    esac
done

cout "Downloading..."
download "$BASEURI/$BRANCH$FORMAT"

if [[ $DOWNLOAD_ONLY == false ]]; then
    cout "Extracting..."
    tar xfz "$BRANCH$FORMAT"

    cout "Preparing desired platforms..."
    if [[ $W_ANDROID == true ]]; then
        mv "Awesome-WebView-$BRANCH/android" .
        prepareAndroid
    fi

    if [[ $W_IOS == true ]]; then
        mv "Awesome-WebView-$BRANCH/ios" .
        prepareIos
    fi

    cout "Cleaning up..."
    rm -rf "Awesome-WebView-$BRANCH"
    rm "$BRANCH$FORMAT"
fi

cout "Done!"

exit 0
