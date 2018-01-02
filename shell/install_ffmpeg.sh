#!/bin/bash
echo -e "\n Install YASM \n"
cd /root/src
wget http://www.tortall.net/projects/yasm/releases/yasm-1.3.0.tar.gz
tar -zxvf yasm-1.3.0.tar.gz
cd yasm-1.3.0
./configure
make
make install
echo -e "\n Install libx264 \n"
cd /root/src
git clone --depth 1 http://git.videolan.org/git/x264
cd x264
PKG_CONFIG_PATH="/root/soft/ffmpeg/lib/pkgconfig"  ./configure \
--prefix="/root/soft/ffmpeg" --bindir="/root/soft/ffmpeg/bin" --enable-static
make
make install
echo -e "\n Install libfdk_aac \n"
cd /root/src
git clone --depth 1 https://github.com/mstorsjo/fdk-aac
cd fdk-aac
autoreconf -fiv
./configure --prefix="/root/soft/ffmpeg" --disable-shared
make
make install
echo -e "\n Install FFmpeg \n"
cd /root/src/FFmpeg
PATH="/root/soft/ffmpeg/bin:$PATH" PKG_CONFIG_PATH="/root/soft/ffmpeg/lib/pkgconfig" ./configure \
--prefix="/root/soft/ffmpeg" --pkg-config-flags="--static" --extra-cflags="-I /root/soft/ffmpeg/ffmpeg_build/include" \
--extra-ldflags="-L /root/soft/ffmpeg/lib" --extra-libs=-lpthread --extra-libs=-lm --bindir="/root/soft/ffmpeg/bin" \
--enable-gpl --enable-libfdk_aac --enable-libfreetype --enable-libx264 --enable-nonfree
make
make install
echo -e "\n Finished"
exit