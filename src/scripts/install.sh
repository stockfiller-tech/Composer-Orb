#!/bin/sh

# MIT License
#
# Copyright (c) 2020 Stockfiller AB
#
# Permission is hereby granted, free of charge, to any person obtaining a copy
# of this software and associated documentation files (the "Software"), to deal
# in the Software without restriction, including without limitation the rights
# to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
# copies of the Software, and to permit persons to whom the Software is
# furnished to do so, subject to the following conditions:
#
# The above copyright notice and this permission notice shall be included in all
# copies or substantial portions of the Software.
#
# THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
# IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
# FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
# AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
# LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
# OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
# SOFTWARE.

FLAGS=""

if [ -n "${PARAM_WORKING_DIR}" ]; then
    FLAGS="${FLAGS} --working-dir=${PARAM_WORKING_DIR}"
fi

if [ -n "${PARAM_PREFER_DIST}" ]; then
    FLAGS="${FLAGS} --prefer-dist"
fi

if [ -n "${PARAM_NO_SCRIPTS}" ]; then
    FLAGS="${FLAGS} --no-scripts"
fi

if [ -n "${PARAM_IGNORE_PLATFORM_REQS}" ]; then
    FLAGS="${FLAGS} --ignore-platform-reqs"
fi

if [ -n "${PARAM_NO_DEV}" ]; then
    FLAGS="${FLAGS} --no-dev"
fi

if [ -n "${PARAM_CLASSMAP_AUTHORITATIVE}" ]; then
    FLAGS="${FLAGS} --classmap-authoritative"
fi

if [ -n "${PARAM_OPTIMIZE_AUTOLOADER}" ]; then
    FLAGS="${FLAGS} --optimize-autoloader"
fi

if [ -z "${PARAM_CACHE_VERSION}" ]; then
    FLAGS="${FLAGS} --no-cache"
fi

echo "Running command \"${PARAM_BIN}\" with flags \"${FLAGS}\""

"${PARAM_BIN}" install --no-interaction "${FLAGS}"
