# Fedora 20 based container for minidlna
#
FROM fedora:20
MAINTAINER Usman Iqbal "usmanatron@users.noreply.github.com"

# Update the base package
RUN yum update --assumeyes

# Add the RPMFusion repositories to get minidlna
RUN yum localinstall --nogpgcheck http://download1.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm http://download1.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm --assumeyes
RUN yum install minidlna --assumeyes

# Define the media volume
VOLUME /data

# Add the config file
ADD minidlna.conf /etc/minidlna.conf

# Expose the required ports:
# UDP 1900 for UPnP
# 8200 for the web interface
EXPOSE 1900/udp 8200
