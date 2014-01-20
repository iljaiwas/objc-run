#!/bin/bash
set -o errexit  # stop the script at the first error

export PATH=$PATH:.

diff <( objc-run examples/hello.m ) - << EOF
hello world
EOF

diff <( objc-run examples/print-args.m "quoted param" ) - << EOF
argv[0]: examples/print-args
argv[1]: quoted param
EOF

diff <( objc-run "examples/script with weird name.m" ) - << EOF
Wow you ran me even if I have spaces in name!
EOF

diff <( objc-run examples/when-file-already-exists.m 2>&1 ) - << EOF
objc-run: file already exists at /when-file-already-exists ... exiting
EOF

if which pod >/dev/null; then
    objc-run examples/MACollectionUtilitiesTest.m
    objc-run examples/CocoaPodsTest.m -quit
fi

echo Done
