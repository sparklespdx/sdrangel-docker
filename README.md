### SDRAngel-docker

This is a container what for building and running SDRAngel. It is intended to run the GUI via X-forwarding to the host.

This container uses Ubuntu 18.04 for a base image so we can get HiDPI support from QT.

Currently it has LimeSDR and RTL-SDR support. I might add more if I get more radios. We install LimeSuite from source.

### TODO:
- PulseAudio installation
- User setup for X forwarding
- run.sh script
- Get rid of --priviledged mode
