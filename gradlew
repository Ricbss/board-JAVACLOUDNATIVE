#!/bin/sh

#
# Copyright © 2015-2021 the original authors.
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#      https://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

##############################################################################
#
#   Gradle start-up script for POSIX systems (Linux, macOS, etc.).
#   This script handles platform-specific adjustments and starts Gradle.
#
##############################################################################

# Resolve symbolic links to find the application path
app_path=$0

# Resolve all symlinks to get the real directory path
while [ -h "$app_path" ]; do
    ls=$(ls -ld "$app_path")
    link=${ls#*' -> '}
    case $link in
        /*)   app_path=$link ;;
        *)    app_path=$APP_HOME$link ;;
    esac
done

APP_HOME=$(cd "${APP_HOME:-./}" && pwd -P) || exit

APP_NAME="Gradle"
APP_BASE_NAME=${0##*/}

# Default JVM options can be overridden by JAVA_OPTS and GRADLE_OPTS
DEFAULT_JVM_OPTS="-Xmx64m -Xms64m"

# Maximum file descriptors (only adjusts on non-OSX systems)
MAX_FD="maximum"

warn () {
    echo "$*" >&2
}

die () {
    echo "$*" >&2
    exit 1
}

# Check OS type to adjust paths and behavior
cygwin=false
msys=false
darwin=false
nonstop=false

case "$(uname)" in
    CYGWIN* )     cygwin=true  ;;
    Darwin* )     darwin=true  ;;
    MSYS* | MINGW* ) msys=true ;;
    NONSTOP* )    nonstop=true ;;
esac

CLASSPATH="$APP_HOME/gradle/wrapper/gradle-wrapper.jar"

# Determine Java command
if [ -n "$JAVA_HOME" ]; then
    if [ -x "$JAVA_HOME/jre/sh/java" ]; then
        JAVACMD=$JAVA_HOME/jre/sh/java
    else
        JAVACMD=$JAVA_HOME/bin/java
    fi

    if [ ! -x "$JAVACMD" ]; then
        die "ERROR: JAVA_HOME is set to an invalid directory: $JAVA_HOME

Please set the JAVA_HOME variable in your environment to match the
location of your Java installation."
    fi
else
    JAVACMD=java
    which java >/dev/null 2>&1 || die "ERROR: JAVA_HOME is not set and no 'java' command could be found in your PATH.

Please set the JAVA_HOME variable in your environment to match the
location of your Java installation."
fi

# Adjust file descriptors if supported
if ! "$cygwin" && ! "$darwin" && ! "$nonstop"; then
    case $MAX_FD in
        max*) MAX_FD=$(ulimit -H -n) || warn "Could not query maximum file descriptor limit" ;;
    esac

    case $MAX_FD in
        '' | soft) :;; # no-op
        *) ulimit -n "$MAX_FD" || warn "Could not set maximum file descriptor limit to $MAX_FD" ;;
    esac
fi

# Convert paths for Cygwin or MSYS
if "$cygwin" || "$msys"; then
    APP_HOME=$(cygpath --path --mixed "$APP_HOME")
    CLASSPATH=$(cygpath --path --mixed "$CLASSPATH")
    JAVACMD=$(cygpath --unix "$JAVACMD")

    for arg do
        if case $arg in
               -*) false ;;  # don't modify options
               /?*) t=${arg#/} t=/${t%%/*} [ -e "$t" ] ;; # look like POSIX path
               *) false ;;
           esac
        then
            arg=$(cygpath --path --ignore --mixed "$arg")
        fi
        shift
        set -- "$@" "$arg"
    done
fi

# Collect arguments and pass them to Java
set -- \
    "-Dorg.gradle.appname=$APP_BASE_NAME" \
    -classpath "$CLASSPATH" \
    org.gradle.wrapper.GradleWrapperMain \
    "$@"

# Pass JVM options as individual arguments
eval "set -- $(printf '%s\n' "$DEFAULT_JVM_OPTS $JAVA_OPTS $GRADLE_OPTS" | xargs -n1 | sed ' s~[^-[:alnum:]+,./:=@_]~\\&~g; ' | tr '\n' ' ' )"

# Execute the Gradle wrapper with the collected arguments
exec "$JAVACMD" "$@"
