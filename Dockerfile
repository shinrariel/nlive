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
	mkdir /root/soft && \
	mkdir /root/src && \
	mkdir /root/config && \
	mkdir /root/web && \
	mkdir /root/web/html && \
	mkdir /root/soft/tengine && \
	mkdir /root/soft/senginx && \
	mkdir /root/soft/nginx && \
	mkdir /root/web/hls && \
	mkdir /root/web/vod && \
	mkdir /root/soft/ffmpeg && \
	mkdir /root/logs && \
	cd /root/src && \
	git clone https://github.com/alibaba/tengine.git && \
	git clone https://github.com/FFmpeg/FFmpeg.git && \
	git clone https://github.com/NeusoftSecurity/SEnginx.git && \
	git clone https://github.com/arut/nginx-rtmp-module.git && \
	git clone https://github.com/winshining/nginx-http-flv-module.git && \
	wget http://nginx.org/download/nginx-1.13.8.tar.gz && \
	tar -xzf nginx-1.13.8.tar.gz && \
	cp -r nginx-rtmp-module ./tengine && \
	cp -r nginx-rtmp-module ./SEnginx && \
	cp -r nginx-rtmp-module ./nginx-1.13.8 && \
	cd /root/src/tengine && \
	./configure --prefix=/root/soft/tengine --with-http_ssl_module --add-module=./nginx-http-flv-module && \
	make && \
	make install && \
	cd /root/src/SEnginx && \
	./configure --prefix=/root/soft/senginx --with-http_ssl_module --add-module=./nginx-http-flv-module && \
	make && \
	make install && \
	cd /root/src/nginx-1.13.8 && \
	./configure --prefix=/root/soft/nginx --with-http_ssl_module --add-module=./nginx-http-flv-module && \
	make && \
	make install && \
	cd /root && \
	rm -rf /root/soft/tengine/html && \
	ln -s /root/web/html /root/soft/tengine/html && \
	rm -rf /root/soft/senginx/html && \
	ln -s /root/web/html /root/soft/senginx/html && \
	rm -rf /root/soft/nginx/html && \
	ln -s /root/web/html /root/soft/nginx/html && \
	ln -s /root/soft/tengine/conf /root/config/tengine_conf && \
	ln -s /root/soft/nginx/conf /root/config/nginx_conf && \
	ln -s /root/soft/senginx/conf /root/config/senginx_conf && \
	ln -s /root/soft/tengine/logs /root/logs/tengine_logs && \
	ln -s /root/soft/nginx/logs /root/logs/nginx_logs && \
	ln -s /root/soft/senginx/logs /root/logs/senginx_logs && \
	mv /root/soft/tengine/conf/nginx.conf /root/soft/tengine/conf/nginx.conf.bak && \
	mv /root/soft/nginx/conf/nginx.conf /root/soft/nginx/conf/nginx.conf.bak && \
	mv /root/soft/senginx/conf/nginx.conf /root/soft/senginx/conf/nginx.conf.bak
	
ADD conf /root/config
RUN cp /root/config/nginx.conf /root/soft/tengine/conf && \
	cp /root/config/nginx.conf /root/soft/nginx/conf && \
	cp /root/config/nginx.conf /root/soft/senginx/conf
ADD html /root/web/html
CMD /bin/bash
	
	
	