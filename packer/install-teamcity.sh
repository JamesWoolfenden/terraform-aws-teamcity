#!/bin/bash
sudo yum install java-1.8.0-openjdk -y
curl -L https://download.jetbrains.com/teamcity/TeamCity-2019.2.1.tar.gz | tar zx
TeamCity/bin/runAll.sh start
