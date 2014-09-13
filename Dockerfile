# Fedora 20 based container for minidlna
#
FROM fedora:20
MAINTAINER Usman Iqbal "usmanatron@users.noreply.github.com"

RUN yum update --assumeyes
RUN yum install minidlna --assumeyes

# TODO: Further installation steps?

# Define the media volume
VOLUME /data

# Add the config file
ADD minidlna.conf /etc/minidlna.conf

# Expose the required ports:
# UDP 1900 for UPnP
# 8200 for the web interface
EXPOSE 1900/udp
EXPOSE 8200
