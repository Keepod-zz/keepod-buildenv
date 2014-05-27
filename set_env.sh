#!/usr/bin/env bash

apt-get -q update
DEBIAN_FRONTEND=noninteractive apt-get -y -q dist-upgrade

apt-get install -y openjdk-7-jdk

update-alternatives --config java
sudo update-alternatives --config javac

DEBIAN_FRONTEND=noninteractive apt-get -y -q install git gnupg flex bison gperf build-essential   zip curl libc6-dev libncurses5-dev:i386 x11proto-core-dev   libx11-dev:i386 libreadline6-dev:i386 libgl1-mesa-glx:i386   libgl1-mesa-dev g++-multilib mingw32 tofrodos   python-markdown libxml2-utils xsltproc zlib1g-dev:i386

if [[ ! -f /usr/lib/i386-linux-gnu/libGL.so ]]; then    
	ln -s /usr/lib/i386-linux-gnu/mesa/libGL.so.1 /usr/lib/i386-linux-gnu/libGL.so
fi

if [[ ! -d /home/vagrant/bin ]]; then
	sudo -u vagrant mkdir /home/vagrant/bin
fi

if [[ ! -f /home/vagrant/bin/repo ]]; then
	sudo -u vagrant curl -fsS https://storage.googleapis.com/git-repo-downloads/repo -o /home/vagrant/bin/repo
	sudo -u vagrant chmod a+x /home/vagrant/bin/repo
fi
