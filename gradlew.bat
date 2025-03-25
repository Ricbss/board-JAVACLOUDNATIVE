@rem
@rem Copyright 2015 the original author or authors.
@rem
@rem Licensed under the Apache License, Version 2.0 (the "License");
@rem you may not use this file except in compliance with the License.
@rem You may obtain a copy of the License at
@rem
@rem      https://www.apache.org/licenses/LICENSE-2.0
@rem
@rem Unless required by applicable law or agreed to in writing, software
@rem distributed under the License is distributed on an "AS IS" BASIS,
@rem WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
@rem See the License for the specific language governing permissions and
@rem limitations under the License.
@rem

@if "%DEBUG%" == "" @echo off
@rem ##########################################################################
@rem
@rem  Gradle startup script for Windows
@rem
@rem ##########################################################################

@rem Set local scope for the variables with Windows NT shell
if "%OS%"=="Windows_NT" setlocal

rem Set application base directory and resolve "." and ".." paths
set DIRNAME=%~dp0
if "%DIRNAME%" == "" set DIRNAME=.
set APP_BASE_NAME=%~n0
set APP_HOME=%DIRNAME%

rem Resolve any "." and ".." in APP_HOME to make it a canonical path
for %%i in ("%APP_HOME%") do set APP_HOME=%%~fi

rem Set default JVM options (can be overridden by JAVA_OPTS and GRADLE_OPTS)
set DEFAULT_JVM_OPTS="-Xmx64m" "-Xms64m"

rem Find java.exe
if defined JAVA_HOME goto findJavaFromJavaHome

rem Try to find java in the PATH
set JAVA_EXE=java.exe
%JAVA_EXE% -version >NUL 2>&1
if "%ERRORLEVEL%" == "0" goto execute

echo.
echo ERROR: JAVA_HOME is not set and no 'java' command could be found in your PATH.
echo Please set the JAVA_HOME variable in your environment to match the location of your Java installation.
goto fail

:findJavaFromJavaHome
rem Remove quotes if any in JAVA_HOME
set JAVA_HOME=%JAVA_HOME:"=%
set JAVA_EXE=%JAVA_HOME%\bin\java.exe

rem Check if java exists in the specified JAVA_HOME
if exist "%JAVA_EXE%" goto execute

echo.
echo ERROR: JAVA_HOME is set to an invalid directory: %JAVA_HOME%
echo Please set the JAVA_HOME variable in your environment to match the location of your Java installation.
goto fail

:execute
rem Set the classpath to the gradle wrapper jar
set CLASSPATH=%APP_HOME%\gradle\wrapper\gradle-wrapper.jar

rem Execute the Gradle wrapper with the specified JVM options and classpath
"%JAVA_EXE%" %DEFAULT_JVM_OPTS% %JAVA_OPTS% %GRADLE_OPTS% "-Dorg.gradle.appname=%APP_BASE_NAME%" -classpath "%CLASSPATH%" org.gradle.wrapper.GradleWrapperMain %*

:end
rem End local scope for the variables with Windows NT shell
if "%ERRORLEVEL%"=="0" goto mainEnd

:fail
rem Set GRADLE_EXIT_CONSOLE if you need the script's return code instead of the cmd.exe /c return code
if not "" == "%GRADLE_EXIT_CONSOLE%" exit 1
exit /b 1

:mainEnd
if "%OS%"=="Windows_NT" endlocal

:omega

:mainEnd
if "%OS%"=="Windows_NT" endlocal

:omega
