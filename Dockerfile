FROM alpine

RUN apk add --no-cache --virtual ludo-build-dependencies \
    git \
    build-base \
    go \
    glfw-dev \
    mesa-dev \
    openal-soft-dev \
    libxcursor-dev \
    libxrandr-dev \
    libxi-dev \
    libx11-dev

ENV LUDO_REVISION master
RUN git clone --recursive --branch ${LUDO_REVISION} https://github.com/libretro/ludo.git /ludo

WORKDIR /ludo

RUN make

