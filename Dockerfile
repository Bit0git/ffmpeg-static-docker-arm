FROM arm32v7/busybox:glibc AS create 
ARG FFMPEGSTATICBUILD=ffmpeg-git-armhf-static
# using git build, as JVS suggests, if you want release build switch to:
# ARG FFMPEGSTATICBUILD = ffmpeg-release-armhf-static
ARG FFMPEGURL=https://johnvansickle.com/ffmpeg/builds/$FFMPEGSTATICBUILD.tar.xz
ADD ${FFMPEGURL} /tmp/ffmpeg.tar.xz
RUN cd /tmp && tar xJf ffmpeg.tar.xz

FROM scratch
COPY --from=create /tmp/ffmpeg*/ffmpeg /bin/
ENTRYPOINT ["/bin/ffmpeg"]
CMD ["--help"]



