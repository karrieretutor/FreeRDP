FROM debian

RUN apt-get update \
    && apt-get -y install --no-install-recommends \
    ninja-build build-essential git-core debhelper \
    cdbs dpkg-dev autotools-dev cmake pkg-config xmlto \
    libssl-dev docbook-xsl xsltproc libxkbfile-dev libx11-dev \
    libwayland-dev libxrandr-dev libxi-dev libxrender-dev \
    libxext-dev libxinerama-dev libxfixes-dev libxcursor-dev \
    libxv-dev libxdamage-dev libxtst-dev libcups2-dev libpcsclite-dev \
    libasound2-dev libpulse-dev libjpeg-dev libgsm1-dev libusb-1.0-0-dev \
    libudev-dev libdbus-glib-1-dev uuid-dev libxml2-dev libgstreamer1.0-dev \
    libgstreamer-plugins-base1.0-dev \
    libavutil-dev libavcodec-dev libavresample-dev

COPY . FreeRDP

RUN cd FreeRDP \
    && cmake -DMONOLITHIC_BUILD=ON -DBUILD_SHARED_LIBS=OFF -DCMAKE_BUILD_TYPE=Release \
        -DWITH_SSE2=OFF -DWITH_ALSA=OFF -DWITH_FFMPEG=OFF -DWITH_MANPAGES=OFF \
        -DWITH_SERVER_INTERFACE=OFF -DWITH-PULSE=OFF -DWITH_GSTREAMER_1_0=OFF \
        -DWITH_X11=OFF -DWITH_SAMPLE=ON . \
    && cmake --build . --target install
