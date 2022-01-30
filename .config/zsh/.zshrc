# _______| |__  _ __ ___ 
#|_  / __| '_ \| '__/ __|
# / /\__ \ | | | | | (__ 
#/___|___/_| |_|_|  \___|
#
# Author: github@66RING
# /home/ring/.config/zsh/.zprofile
source ~/.config/zsh/lf_setting.zsh
source ~/.config/zsh/plugin.zsh
source ~/.config/zsh/aliases.zsh

export JDTLS_HOME=/usr/share/java/jdtls
export CLASSPATH=./:/home/ring/Documents/code/undergraduate_code/algo/princeton-algs4/stdlib.jar:/home/ring/Documents/code/undergraduate_code/algo/princeton-algs4/algs4.jar

export PATH="$PATH:/home/ring/Documents/code/undergraduate_code/os/lab/software/pintos/src/utils"


export ELINKS_CONFDIR="$XDG_CONFIG_HOME"/elinks
export GNUPGHOME="$XDG_DATA_HOME"/gnupg


 
#  _                   
# | |_ _ __ ___  _ __  
# | __| '_ ` _ \| '_ \ 
# | |_| | | | | | |_) |
#  \__|_| |_| |_| .__/ 
#               |_|    
#

# eldk-5.6
# export PATH=$PATH:/opt/eldk-5.6/powerpc/sysroots/i686-eldk-linux/usr/bin:/opt/eldk-5.6/powerpc/sysroots/i686-eldk-linux/usr/bin/powerpc-linux:/opt/eldk-5.6/powerpc/sysroots/powerpc-linux/usr/bin/powerpc-linux
# export ARCH=powerpc
# export CROSS_COMPILE=powerpc-linux-

# musl.cc
# export PATH=$PATH:/home/ring/var/toolchain/musl.cc/powerpc-linux-musl-cross/bin:/home/ring/var/toolchain/musl.cc/powerpc-linux-musl-cross/powerpc-linux-musl/bin:/home/ring/var/toolchain/musl.cc/powerpc-linux-musl-cross/usr/bin
# export ARCH=powerpc
# export CROSS_COMPILE=powerpc-linux-musl-


# x86
# export PATH=$PATH:/home/ring/var/toolchain/x86_64-linux-musl-cross/bin:/home/ring/var/toolchain/x86_64-linux-musl-cross/x86_64-linux-musl/bin
# export ARCH=x86_64
# export CROSS_COMPILE=x86_64-linux-musl-

# x86, x86-64-core-i7--glibc--stable, gcc 5.4
# export PATH=$PATH:/home/ring/var/toolchain/x86-64-core-i7--glibc--stable/bin:/home/ring/var/toolchain/x86-64-core-i7--glibc--stable/x86_64-buildroot-linux-gnu/bin
# export ARCH=x86_64
# export CROSS_COMPILE=x86_64-linux-
# export GCCPREFIX=x86_64-linux-
# export LD_LIBRARY_PATH=/home/ring/var/toolchain/x86-64-core-i7--glibc--stable/lib

# windows
# export ARCH=Win32
# export CROSS_COMPILE=i686-w64-mingw32-

