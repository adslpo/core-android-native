#!/bin/bash

sdk=$(which ndk-build)
cp $(pwd)/shell_params.h $(pwd)/legacy_native/jni/headers/
cp $(pwd)/shell_params.h $(pwd)/selinux_native/jni/headers/

###########################################
############ BUILDING LEGACY ##############
###########################################

echo -e "\n\nBUILDING LEGACY NATIVE\n\n"
sleep 1

$sdk -C $(pwd)/legacy_native/jni/

###########################################
############ BUILDING SELINUX #############
###########################################

sleep 1
echo -e "\n\nBUILDING LEGACY NATIVE\n\n"
sleep 1

cp $(pwd)/selinux_native/jni/runner.mk $(pwd)/selinux_native/jni/Android.mk

echo -e "Compiling runner...\n"
$sdk -C $(pwd)/selinux_native/jni/

# Update runner binary
perl -e 'print "\x1d\x30\x25\xd9\x28\x70\xf4\xe1\xe6\x53\x68\x78\x07\x3e\xc4\x78"' >> $(pwd)/selinux_native/libs/armeabi/runner

echo -e "Generating runner header...\n"
$(pwd)/selinux_native/jni/gen_runner.py $(pwd)/selinux_native/libs/armeabi/runner $(pwd)/selinux_native/jni/headers/runner_bin.h

perl -e 'print "#define RUNNER_ID \"\\x1d\\x30\\x25\\xd9\\x28\\x70\\xf4\\xe1\\xe6\\x53\\x68\\x78\\x07\\x3e\\xc4\\x78\"\n\n"' >> $(pwd)/selinux_native/jni/headers/runner_bin.h

cp $(pwd)/selinux_native/jni/selinux.mk $(pwd)/selinux_native/jni/Android.mk
echo -e "Compiling all...\n"
$sdk -C $(pwd)/selinux_native/jni/



###########################################
############ COPYING BINARY   #############
###########################################

#cp $(pwd)/selinux_native/libs/armeabi/runner $(pwd)/bin/selinux
cp $(pwd)/selinux_native/libs/armeabi/selinux_check $(pwd)/bin
cp $(pwd)/selinux_native/libs/armeabi/selinux_exploit $(pwd)/bin
cp $(pwd)/selinux_native/libs/armeabi/selinux_suidext $(pwd)/bin
cp $(pwd)/selinux_native/libs/armeabi/selinux4_exploit $(pwd)/bin
cp $(pwd)/selinux_native/libs/armeabi/selinux4_check $(pwd)/bin

cp $(pwd)/legacy_native/libs/armeabi/expl_check $(pwd)/bin
#cp $(pwd)/legacy_native/libs/armeabi/librunner.so $(pwd)/bin
cp $(pwd)/legacy_native/libs/armeabi/local_exploit $(pwd)/bin
cp $(pwd)/legacy_native/libs/armeabi/suidext $(pwd)/bin


