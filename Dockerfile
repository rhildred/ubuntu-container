FROM ubuntu:18.04

# Must have packages
RUN apt-get update && apt-get install -y vim nano curl git sudo

# Add none root user
RUN  useradd rhuser -u 1000 && echo "rhuser:rhuser" | chpasswd && adduser rhuser sudo
RUN sed -i /etc/sudoers -re 's/^%sudo.*/%sudo   ALL=(ALL:ALL) NOPASSWD: ALL/g'
USER rhuser
