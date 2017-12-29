FROM centos:latest
RUN yum install -y git go sudo bash psmisc net-tools bash-completion wget \
	apr* autoconf automake bison bzip2 bzip2* cloog-ppl compat* cpp curl curl-devel \
	fontconfig fontconfig-devel freetype freetype* freetype-devel gcc gcc-c++ \
	gtk+-devel gd gettext gettext-devel glibc kernel kernel-headers keyutils  \
	keyutils-libs-devel krb5-devel libcom_err-devel libpng libpng* libpng-devel \
	libjpeg* libsepol-devel libselinux-devel libstdc++-devel libtool* libgomp libxml2 \
	libxml2-devel libXpm* libX* libtiff libtiff* make mpfr ncurses* ntp openssl \
	nasm nasm* openssl-devel patch pcre-devel perl php-common php-gd policycoreutils ppl \
	telnet t1lib t1lib* zlib-devel libxml2 libxml2-devel libxslt libxslt-devel unzip && \
	mkdir /root/software && \
	mkdir /root/config && \
	cd /root/software && \
	git clone https://github.com/alibaba/tengine.git && \
	git clone https://github.com/FFmpeg/FFmpeg.git && \
	git clone https://github.com/NeusoftSecurity/SEnginx.git && \
	git clone https://github.com/arut/nginx-rtmp-module.git && \
	wget http://nginx.org/download/nginx-1.13.8.tar.gz && \
	tar -xzf nginx-1.13.8.tar.gz && \
	cp -r nginx-rtmp-module ./tengine && \
	cp -r nginx-rtmp-module ./SEnginx && \
	cp -r nginx-rtmp-module ./nginx-1.13.8 && \
	mkdir /root/html && \
	
	
ADD conf /root/config
CMD /bin/bash
	
	
	