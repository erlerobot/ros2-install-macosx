#!/bin/bash
# Software License Agreement (BSD)
#
# Author    Anita Inchauspe <anita@erlerobotics.com>
# Copyright (c) 2014-2015, Erle Robotics, Inc., All rights reserved.
#
# Redistribution and use in source and binary forms, with or without modification, are permitted provided that
# the following conditions are met:
# * Redistributions of source code must retain the above copyright notice, this list of conditions and the
#   following disclaimer.
# * Redistributions in binary form must reproduce the above copyright notice, this list of conditions and the
#   following disclaimer in the documentation and/or other materials provided with the distribution.
# * Neither the name of Clearpath Robotics nor the names of its contributors may be used to endorse or
#   promote products derived from this software without specific prior written permission.
#
# THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS" AND ANY EXPRESS OR IMPLIED
# WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A
# PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT HOLDER OR CONTRIBUTORS BE LIABLE FOR
# ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED
# TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION)
# HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING
# NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE
# POSSIBILITY OF SUCH DAMAGE.

#For more info: https://github.com/ros2/ros2/wiki/OSX-Install-Binary
#               https://github.com/ros2/ros2/wiki/OSX-Development-Setup

#Install Homebrew
ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

#Install more stuff you need 
brew tap osrf/ros2
brew tap ros/deps
brew install homebrew/science/opencv --without-python
brew install python3 wget cmake cppcheck opensplice gtest
pip3 install empy setuptools nose vcstool

#Unpack the latest package for OS X
mkdir -p ~/ros2_install
cd ~/ros2_install

#The name of the package may change in the future
tar xf ~/Downloads/ros2-rc2-package-osx.tar.bz2

#Create a workspace and clone repos

read -p "Please type a name for the workspace:  " nom
echo $nom
mkdir -p ~/$nom/src
cd ~/$nom
wget https://raw.githubusercontent.com/ros2/ros2/release-alpha1/ros2.repos
vcs import ~/$nom/src < ros2.repos
echo "......\"$nom\" workspace created....."

#Build ROS2 code
src/ament/ament_tools/scripts/ament.py build --build-tests --symlink-install

#Source
. ~/ros2_install/ros2-osx/setup.bash
