#!/bin/env python
# Copyright 2020 Google LLC
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     https://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

# This variable lists symbols to define to the C preprocessor
export DEFINES :=

# Uncomment this line to use software defined CFU functions in software_cfu.cc
#DEFINES += CFU_SOFTWARE_DEFINED

# Uncomment this line to skip debug code (large effect on performance)
DEFINES += NDEBUG

# This says to NOT compile the TFLM library or any models
export SKIP_TFLM=1

# Uncomment this line to skip individual profiling output (has minor effect on performance).
#DEFINES += NPROFILE

# Uncomment this line to include the ASCII animated donut demo.
DEFINES += DONUT_DEMO

# Software debugging
# DEFINES += CFU_SOFTWARE_DEFINED

# Uncommenting this moves donut code to "sram" region.  
#   Probably not supported on all targets.
# DEFINES += OPT_LINK_CODE_IN_SRAM


export EXTRA_LITEX_ARGS
EXTRA_LITEX_ARGS += --cpu-variant breaker+cfu


include ../proj.mk
