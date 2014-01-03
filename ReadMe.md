#About objc-run

objc-run is a shell script which compiles and executes Objective-C source code files.

It's perfect for small programming tasks you want to handle in Objective-C, that don't justify setting up a complete Xcode project, e.g. manipulating plist files. Think of it as [CodeRunner](http://krillapps.com/coderunner/) without an user interface. 

##Installation
Just download the objc-run shell script file and install it in a directory that's in your $PATH. Make sure the executable bit is set like this:
	
	chmod u+x objc-run

## BASIC USAGE
Inside the Terminal, just enter:

	objc-run myfile.m myparam1 myparam2

objc-run will attempt to compile myfile.m into an application called 'myfile'. If the file was successfully compiled, 'myfile' is launched and all remaining parameters are passed to it.

Once 'myfile' is done executing, it's removed.

## Advanced usage (#!)

You can omit the explicit invocation of objc-run on the command line and launch it like this:

	myfile.m myparam1 myparam2


Just insert this as first line in your .m file:

	#!/usr/bin/env /usr/bin/objc-run
	
If you have installed objc-run in a directory different from /usr/bin, you'll need to adjust the path accordingly.