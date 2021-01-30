FROM ubuntu:latest

# Tell debconf to run in non-interactive mode
ENV DEBIAN_FRONTEND noninteractive

# Make sure the repository information is up to date
RUN apt-get update

# Install Zoom
RUN apt-get install -y ca-certificates wget software-properties-common
RUN wget https://zoom.us/client/latest/zoom_amd64.deb -P /tmp/
RUN dpkg -i /tmp/zoom_amd64.deb || true
RUN apt-get install -fy

# Install OpenSSH
RUN apt-get install -y openssh-server

# Create OpenSSH privilege separation directory
RUN mkdir /var/run/sshd

# Install Pulseaudio
RUN apt-get install -y pulseaudio

# Add the Zoom user that will run the browser
RUN adduser --disabled-password --gecos "Zoom User" --uid 5001 zoom

# Set up the launch wrapper
COPY zoom-forward /usr/local/bin/zoom-forward

# Ensure X11 forwarding works
RUN sed -i 's/#X11UseLocalhost yes/X11UseLocalhost no/' /etc/ssh/sshd_config

# Start SSH so we are ready to make a tunnel
COPY entrypoint.sh /usr/local/bin/entrypoint.sh
ENTRYPOINT /usr/local/bin/entrypoint.sh

# Expose the SSH port
EXPOSE 22
