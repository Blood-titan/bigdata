#!/bin/bash

# Exit on error
set -e

echo "Starting Big Data Environment Setup..."

# Update system
sudo apt update && sudo apt upgrade -y

# 1. Install Java
echo "Installing Java..."
sudo apt install -y openjdk-8-jdk
export JAVA_HOME=/usr/lib/jvm/java-8-openjdk-amd64
echo "export JAVA_HOME=$JAVA_HOME" >> ~/.bashrc
echo "export PATH=\$PATH:\$JAVA_HOME/bin" >> ~/.bashrc

# 2. Install Hadoop
echo "Installing Hadoop..."
HADOOP_VERSION=3.3.6
wget https://downloads.apache.org/hadoop/common/hadoop-$HADOOP_VERSION/hadoop-$HADOOP_VERSION.tar.gz
tar -xzf hadoop-$HADOOP_VERSION.tar.gz
sudo mv hadoop-$HADOOP_VERSION /usr/local/hadoop
echo "export HADOOP_HOME=/usr/local/hadoop" >> ~/.bashrc
echo "export PATH=\$PATH:\$HADOOP_HOME/bin:\$HADOOP_HOME/sbin" >> ~/.bashrc
echo "export HADOOP_CONF_DIR=\$HADOOP_HOME/etc/hadoop" >> ~/.bashrc

# 3. Configure Hadoop
cat <<EOF | sudo tee /usr/local/hadoop/etc/hadoop/hadoop-env.sh
export JAVA_HOME=$JAVA_HOME
EOF

# 4. Install Hive
echo "Installing Hive..."
HIVE_VERSION=3.1.3
wget https://downloads.apache.org/hive/hive-$HIVE_VERSION/apache-hive-$HIVE_VERSION-bin.tar.gz
tar -xzf apache-hive-$HIVE_VERSION-bin.tar.gz
sudo mv apache-hive-$HIVE_VERSION-bin /usr/local/hive
echo "export HIVE_HOME=/usr/local/hive" >> ~/.bashrc
echo "export PATH=\$PATH:\$HIVE_HOME/bin" >> ~/.bashrc

# 5. Install HBase
echo "Installing HBase..."
HBASE_VERSION=2.4.17
wget https://downloads.apache.org/hbase/$HBASE_VERSION/hbase-$HBASE_VERSION-bin.tar.gz
tar -xzf hbase-$HBASE_VERSION-bin.tar.gz
sudo mv hbase-$HBASE_VERSION /usr/local/hbase
echo "export HBASE_HOME=/usr/local/hbase" >> ~/.bashrc
echo "export PATH=\$PATH:\$HBASE_HOME/bin" >> ~/.bashrc

# 6. Install Thrift
echo "Installing Thrift..."
sudo apt install -y thrift-compiler

# Finalize Environment Setup
source ~/.bashrc

echo "Installation Complete."
echo "Please restart your terminal or run: source ~/.bashrc"
