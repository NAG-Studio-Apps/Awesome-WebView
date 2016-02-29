#!/bin/bash

function assertExists() {
	DIR=$1
	[[ ! -d $DIR ]] && mkdir $DIR
}

function assertCD() {
	assertExists $1
	cd $1 || exit 2
}

if [[ $# == 0 ]]; then 
	echo 'Help:'
	echo ''
	echo 'resources.sh [action]'
	echo ''
	echo 'Actions:'
	echo ''
	echo 'init  -  Touch all resources that are needed by iOS/Android'
	echo 'copy  -  Copy the resources from res/ to the platform folders'
	echo 'nuke  -  ;)'
	exit 1
fi

if [[ $1 == 'init' ]]; then
    echo '==> Doing touchy-touchy on some files...'
	assertCD res

	# Android
	assertCD android

	# Splash Screens
	assertCD drawable
	touch Default-200x320.png
	touch Default-320x480.png
	touch Default-480x800.png
	touch Default-720x1280.png
	touch Default-960x1600.png
	touch Default-1280x1920.png
	cd ..

	# Launcher icons
	assertCD mipmap-hdpi
	touch ic_launcher.png
	cd ..

	assertCD mipmap-ldpi
	touch ic_launcher.png
	cd ..

	assertCD mipmap-mdpi
	touch ic_launcher.png
	cd ..

	assertCD mipmap-xhdpi
	touch ic_launcher.png
	cd ..

	assertCD mipmap-xxhdpi
	touch ic_launcher.png
	cd ..

	assertCD mipmap-xxxhdpi
	touch ic_launcher.png
	cd ..

	touch playstore-icon.png
	cd ..

	# iOS
	assertCD ios

	# App Icons
	assertCD 'AppIcon.appiconset'
	touch Icon-40.png
	touch Icon-40@2x.png
	touch Icon-40@3x.png
	touch Icon-60@2x.png 
	touch Icon-60@3x.png
	touch Icon-76.png
	touch Icon-76@2x.png
	touch Icon-83.5@2x.png
	touch Icon-Small.png  
	touch Icon-Small@2x.png  
	touch Icon-Small@3x.png
	cd ..

	assertCD 'LaunchImage.launchimage'
	touch Default-320x480.png
	touch Default-640x960.png
	touch Default-640x1136.png
	touch Default-750x1334.png
	cd ..

	cd ..
	cd ..
	cd ..
fi

if [[ $1 == 'copy' ]]; then
	echo '==> Copying resources...'
fi

if [[ $1 == 'nuke' ]]; then
	echo '==> Nuking res/...'
	[[ -d 'res' ]] && rm -rf res
	[[ -d '../res' ]] && rm -rf ../res
fi

echo '==> Done'
exit 0
