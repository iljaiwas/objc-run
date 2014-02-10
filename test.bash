#!/bin/bash

export PATH=$PATH:.

   logC () { [[ $# == 2 ]] && tput setaf $2 || tput setaf 3; echo -e "$1"; tput setaf 15; }
logExit () {
  [[ $1 == '0' ]] && tput setaf 2  || tput setaf 1;
  [[ $1 == '0' ]] && echo -e "$2 PASSED" || echo -e "$2 FAILED";
  tput setaf 15;
  [[ $1 == '0' ]] || exit -1
}

     HELLO="examples/hello.m"
  HELLOOUT="hello world"
      ARGS="examples/print-args.m"
     WEIRD="examples/script with weird name.m"
  WEIRDOUT="Wow you ran me even if I have spaces in name!"
    EXISTS="examples/when-file-already-exists.m"
 EXISTSOUT="objc-run: file already exists at /when-file-already-exists ... exiting"
  PODTEST1="examples/MACollectionUtilitiesTest.m"
  PODTEST2="examples/CocoaPodsTest.m"

logC "Testing output of $HELLO is $HELLOOUT"
diff <( objc-run $HELLO ) - << EOF
$HELLOOUT
EOF
logExit $? $HELLO

logC "Testing output of $ARGS"
diff <( objc-run $ARGS "quoted param" ) - << EOF
argv[0]: examples/print-args
argv[1]: quoted param
EOF
logExit $? $ARGS

logC "Testing output of $WEIRD is $WEIRDOUT"
diff <( objc-run "$WEIRD" ) - << EOF
$WEIRDOUT
EOF
logExit $? $WEIRD

logC "Testing behavior when file exists with $EXISTS"
diff <( objc-run $EXISTS 2>&1 ) - << EOF
$EXISTSOUT
EOF
logExit $? $EXISTS

if which pod >/dev/null; then
    logC "Running CocoaPods Test .. $PODTEST1 (with xcodebuild output supressed)"
    objc-run $PODTEST1 > /dev/null
    logExit $? $PODTEST1
    logC "Running CocoaPods Test 2 ... $PODTEST2 (with xcodebuild output supressed)"
    objc-run $PODTEST2 -quit > /dev/null
    logExit $? $PODTEST2
fi

logC "All tests passed! Done." 6
