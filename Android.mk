# -*- mode: makefile -*-
# Copyright (C) 2009 The Android Open Source Project
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

LOCAL_PATH := $(call my-dir)


#
# Include the definitions to build the Java code.
#

include $(LOCAL_PATH)/JavaLibrary.mk


#
# Include the definitions to build the native code.
#

include $(LOCAL_PATH)/NativeCode.mk

#
# Include the definitions for the Certificate Authority (CA) certificates
#

include $(LOCAL_PATH)/CaCerts.mk

#
# Include the definitions to build the caliper benchmarks.
#
include $(LOCAL_PATH)/benchmarks/Android.mk

#
# Disable test modules if LIBCORE_SKIP_TESTS environment variable is set.
#

ifneq ($(LIBCORE_SKIP_TESTS),)
$(info ********************************************************************************)
$(info * libcore tests are skipped because environment variable LIBCORE_SKIP_TESTS=$(LIBCORE_SKIP_TESTS))
$(info ********************************************************************************)
endif


#
# "m dalvik-host" for quick minimal host build
#

ifeq ($(WITH_HOST_DALVIK),true)
    .PHONY: dalvik-host
    dalvik-host: \
        dalvik \
        $(HOST_OUT)/bin/dalvikvm \
        $(HOST_OUT)/bin/dexopt \
        $(HOST_OUT)/lib/libjavacore.so \
        $(HOST_OUT)/lib/libjavacrypto.so \
        $(HOST_OUT)/lib/libjavacoretests.so \
        cacerts-host \
        core-hostdex \
        conscrypt-hostdex \
        okhttp-hostdex \
        bouncycastle-hostdex \
        apache-xml-hostdex \
        apache-harmony-tests-hostdex \
        $(call intermediates-dir-for,JAVA_LIBRARIES,core-tests,,COMMON)/classes.jar
endif
