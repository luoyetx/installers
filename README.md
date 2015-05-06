installers
==========

Scripts for installing open source tools and libraries from source code.

All scripts are tested on CentOS6 and CentOS7 with images from [Docker Hub](https://hub.docker.com/).

### Basic tools
I'm assuming your Linux system already install some basic tools.

1. wget for fetch source code
2. tar && xz && bzip2 && unzip for uncompress
3. make && gcc && g++ for compile

### Notice
Need **root** to run these scripts.

All source code will be downloaded at `/usr/local/src`. Tools and Libraries will be installed at default `prefix`, usually at `/usr/local`.

You may need to edit `/etc/ld.so.conf` and add `/usr/local/lib` && `/usr/local/lib64` for tools and libraries to work fine. Just like below.

```
# This is ld.so.conf
include ld.so.conf.d/*.conf

/usr/local/lib
/usr/local/lib64
```

### Todo

1. Currently use **YUM**, need to support **APT**.
2. Check the dependecies between source code.
3. More flexible configure
