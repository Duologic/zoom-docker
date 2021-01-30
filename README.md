# Zoom in Docker

Yet another Zoom in Docker setup, it works for me and that is all I want to support.

It is full of assumption, so please read the code before execution.

Heavily inspired by https://github.com/jlund/docker-chrome-pulseaudio

# PulseAudio config:

```
# Allow Pulseaudio Forwarding from SSH
load-module module-native-protocol-tcp auth-ip-acl=127.0.0.1 auth-anonymous=1
```
