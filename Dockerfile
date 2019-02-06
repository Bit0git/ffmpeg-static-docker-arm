FROM arm32v7/busybox:glibc  
ENV FFMPEGSTATICBUILD = ffmpeg-git-armhf-static.tar.xz

RUN cd /tmp; \
    wget https://johnvansickle.com/ffmpeg/builds/$(FFMPEGSTATICBUILD).tar.xz; \
    tar xvf ${FFMPEGSTATICBUILD}.tar.xz; \
WORKDIR /ffmpeg
