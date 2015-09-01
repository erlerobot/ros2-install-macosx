# ros2-install-macosx

#About ROS2
Version 2.0 of the Robot Operating System (ROS)

Follow https://github.com/ros2/ros2/wiki/OSX-Install-Binary and https://github.com/ros2/ros2/wiki/OSX-Development-Setup for more info.

#Prerequisites
You need Java Development Kit (JDK) installed before installing ROS 2. Check out if it is already installed and that the version is 1.8:

`find /Library/Java | grep jni.h`

If it is not like that, follow these steps:

· Go to: http://www.oracle.com/technetwork/java/javase/downloads/jdk8-downloads-2133151.html

· Accept the license terms and download the "Mac OS X x64" version of the .dmg file. Install it from .dmg


#Compilation
Once that you have JDK installed and the ROS latest package for OS X downloaded please enter this command line `./ros2-install-macosx`.

Remember to source the setup file whenever you run any example
`. install/local_setup.bash`

Try out some examples!

