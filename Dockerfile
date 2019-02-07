FROM arm32v7/busybox:glibc  
ENV FFMPEGSTATICBUILD = ffmpeg-git-armhf-static.tar.xz

RUN set -ex; \
    cd /tmp; \
    wget https://johnvansickle.com/ffmpeg/builds/$(FFMPEGSTATICBUILD).tar.xz; \
    mkdir /ffmpeg; \
    tar xvf -C /ffmpeg ${FFMPEGSTATICBUILD}.tar.xz; \
    rm -f ./$(FFMPEGSTATICBUILD).tar.xz; \
    
WORKDIR /ffmpeg
