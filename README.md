installers
==========

Scripts for installing open source tools and libraries from source code.

All scripts are tested in CentOS6.6 with images from [Docker Hub](https://hub.docker.com/).

### Basic tools
I'm assuming your Linux system already install some basic tools.

1. wget for fetch source code
2. tar && xz && unzip for uncompress
3. gcc && g++ for compile

### Notice
Need **root** to run these scripts.

You may need to edit `/etc/ld.so.conf` and add `/usr/local/lib` && `/usr/local/lib64` for tools and libraries to work fine. Just like below.

```
# This is ld.so.conf
include ld.so.conf.d/*.conf

/usr/local/lib
/usr/local/lib64
```
