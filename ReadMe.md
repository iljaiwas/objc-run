[![Build Status](https://travis-ci.org/iljaiwas/objc-run.png?branch=master)](https://travis-ci.org/iljaiwas/objc-run)

#About objc-run


objc-run is a shell script which compiles and executes Objective-C source code files. It integrates with [CocoaPods](http://cocoapods.org).

It's perfect for small programming tasks you want to handle in Objective-C, that don't justify setting up a complete Xcode project, e.g. manipulating plist files. Think of it as [CodeRunner](http://krillapps.com/coderunner/) without an user interface. 

##Installation

If you have [homebrew](http://brew.sh) installed, just run
    
	brew install objc-run

Otherwise, download the objc-run shell script file and install it in a directory that's in your $PATH. Make sure the executable bit is set like this:
	
	chmod u+x objc-run

## Basic Usage
Inside the Terminal, just enter:

	objc-run myfile.m myparam1 myparam2

objc-run will attempt to compile myfile.m into an application called 'myfile'. If the file was successfully compiled, 'myfile' is launched and all remaining parameters are passed to it.

Once 'myfile' is done executing, it's removed.

## Advanced usage (#!)

You can omit the explicit invocation of objc-run on the command line and launch it like this:

	myfile.m myparam1 myparam2


Just insert this as first line in your .m file:

	#!/usr/bin/env objc-run
	
Make sure objc-run, or a link to it, is accessible from your $PATH.

Please note that as long as this line is present, it will produce an error when compiling it directly.

##CocoaPods Integration

You can use [CocoaPods](http://cocoapods.org) modules with objc-run. Just include the contents of your podfile in a C-comment between 'podfile-start' and 'podfile-end', like this: 

	/*
	podfile-start
	platform :osx, '10.9'
	pod 'Barista'
	podfile-end
	*/
	
[Here](examples/CocoaPodsTest.m) is an example file from the [Barista](https://github.com/stevestreza/Barista) project modified for usage with objc-run.

# Self check

There is a little test script that performs some basic checks. 

Run:

    $ ./test.bash
    Done
    $ echo $?
    0

