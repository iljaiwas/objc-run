#About objc-run

objc-run is a shell script which compiles and executes Objective-C source code files.

It's perfect for small programming tasks you want to handle in Objective-C, that don't justify setting up a complete Xcode project, e.g. manipulating plist files. Think of it as [CodeRunner](http://krillapps.com/coderunner/) without an user interface. 

##Installation
Just download the objc-run shell script file and install it in a directory that's in your $PATH. Make sure the executable bit is set like this:
	
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

	#!/usr/bin/env /usr/bin/objc-run
	
If you have installed objc-run in a directory different from /usr/bin, you'll need to adjust the path accordingly.

Please note that as long as this line is present, it will produce an error when compiling it directly.

##CocoaPods Integration

You can use [CocoaPods](http://cocoapods.org) modules with objc-run. Just include the contents of your podfile in a C-comment between 'podfile-start' and 'podfile-end', like this: 

	/*
	podfile-start
	platform :osx, '10.9'
	pod 'Barista'
	podfile-end
	*/
	
Here is an example file from the [Barista](https://github.com/stevestreza/Barista) project modified for usage with objc-run:

	#!/usr/bin/env /usr/bin/objc-run

	/*
	podfile-start
	platform :osx, '10.9'
	pod 'Barista'
	podfile-end
	*/

	#import <Foundation/Foundation.h>
	#import "Barista.h"
	#import "BARRouter.h"

	int main(int argc, const char * argv[])
	{
		@autoreleasepool
		{
		BARServer *server = [BARServer serverWithPort:4242];
		BARRouter *router = [[BARRouter alloc] init];
		[router addRoute:@"/" forHTTPMethod:@"GET" handler:^BOOL(BARConnection *connection, BARRequest *request, NSDictionary *parameters) {
			BARResponse *response = [[BARResponse alloc] init];
			response.responseData = [@"Hello world" dataUsingEncoding:NSUTF8StringEncoding];
			response.statusCode = 200;
			[connection sendResponse:response];
			return YES;
		}];
		[server addGlobalMiddleware:router];
		[server startListening];
		while(YES){
			[[NSRunLoop mainRunLoop] run];
		}
	}
    return 0;
}

# Self check

There is a little test script that performs some basic checks. 

Run:

    $ ./test.bash
    Done
    $ echo $?
    0

