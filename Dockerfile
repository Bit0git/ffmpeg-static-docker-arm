FROM arm32v7/busybox:glibc  
ENV FFMPEGSTATICBUILD=ffmpeg-git-armhf-static
# using git build, as JVS suggests, if you want release build switch to:
# ENV FFMPEGSTATICBUILD = ffmpeg-release-armhf-static
ENV PATH=/ffmpeg:${PATH}

RUN set -ex; \
    cd /tmp; \
    wget https://johnvansickle.com/ffmpeg/builds/${FFMPEGSTATICBUILD}.tar.xz; \
    wget https://johnvansickle.com/ffmpeg/builds/${FFMPEGSTATICBUILD}.tar.xz.md5; \
    md5sum -c ${FFMPEGSTATICBUILD}.tar.xz.md5; \
    mkdir /ffmpeg; \
    tar xvf ${FFMPEGSTATICBUILD}.tar.xz -C /ffmpeg; \
    rm -f ./${FFMPEGSTATICBUILD}.tar.xz; \
    set;
    
WORKDIR /ffmpeg
ENTRYPOINT ["./ffmpeg"]
CMD ["--help"]

