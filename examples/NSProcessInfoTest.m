#!/usr/bin/env objc-run

@import Foundation;

int main(int argc, char *argv[]) {
	@autoreleasepool {
		NSLog (@"arguments: %@", [[NSProcessInfo processInfo] arguments]);
	}
}
