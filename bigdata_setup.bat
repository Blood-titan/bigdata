@echo off
SETLOCAL ENABLEEXTENSIONS

:: Set versions
SET HADOOP_VERSION=3.3.6
SET HIVE_VERSION=3.1.3
SET HBASE_VERSION=2.4.17

:: Create directories
mkdir C:\bigdata
cd C:\bigdata

:: Download Hadoop
echo Downloading Hadoop...
curl -O https://downloads.apache.org/hadoop/common/hadoop-%HADOOP_VERSION%/hadoop-%HADOOP_VERSION%.tar.gz
"C:\Program Files\7-Zip\7z.exe" x hadoop-%HADOOP_VERSION%.tar.gz -aoa
"C:\Program Files\7-Zip\7z.exe" x hadoop-%HADOOP_VERSION%.tar -aoa
move hadoop-%HADOOP_VERSION% hadoop

:: Download Hive
echo Downloading Hive...
curl -O https://downloads.apache.org/hive/hive-%HIVE_VERSION%/apache-hive-%HIVE_VERSION%-bin.tar.gz
"C:\Program Files\7-Zip\7z.exe" x apache-hive-%HIVE_VERSION%-bin.tar.gz -aoa
"C:\Program Files\7-Zip\7z.exe" x apache-hive-%HIVE_VERSION%-bin.tar -aoa
move apache-hive-%HIVE_VERSION%-bin hive

:: Download HBase
echo Downloading HBase...
curl -O https://downloads.apache.org/hbase/%HBASE_VERSION%/hbase-%HBASE_VERSION%-bin.tar.gz
"C:\Program Files\7-Zip\7z.exe" x hbase-%HBASE_VERSION%-bin.tar.gz -aoa
"C:\Program Files\7-Zip\7z.exe" x hbase-%HBASE_VERSION%-bin.tar -aoa
move hbase-%HBASE_VERSION% hbase

:: Set environment variables
echo Setting environment variables...
setx HADOOP_HOME "C:\bigdata\hadoop"
setx HIVE_HOME "C:\bigdata\hive"
setx HBASE_HOME "C:\bigdata\hbase"
setx PATH "%PATH%;C:\bigdata\hadoop\bin;C:\bigdata\hive\bin;C:\bigdata\hbase\bin"

:: Install Thrift
echo Installing Thrift...
choco install thrift -y

echo.
echo ====================================================
echo    Big Data Tools Setup Complete on Windows!
echo    Restart your Command Prompt to use them.
echo ====================================================
pause
