#!/usr/bin/env objc-run

/*
podfile-start
platform :osx, '10.8'
pod 'MACollectionUtilities'
podfile-end
*/

#import <Foundation/Foundation.h>
#import "MACollectionUtilities.h"

int main(int argc, const char * argv[])
{
	@autoreleasepool
	{
		NSArray *array = @[@"A", @"B", @"A"];
		NSString *result;
		
		result = MATCH (array, [obj isEqualToString:@"A"]);
		if (result == nil)
		{
			NSLog (@"Match failed");
			return 1;
		}
		NSLog (@"Match succeeded");
	}
    return 0;
}
