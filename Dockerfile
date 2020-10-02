FROM 0x01be/ludo:build as build

FROM 0x01be/xpra

COPY --from=build /ludo/ludo /opt/ludo/bin/ludo
COPY --from=build /ludo/assets /workspace/assets

USER root

RUN apk add --no-cache --virtual ludo-runtime-dependencies \
    glfw \
    openal-soft \
    libxcursor \
    libxrandr \
    libxi \
    libx11 \
    libxv \
    mesa-dri-swrast

USER xpra

ENV PATH ${PATH}:/opt/ludo/bin/
ENV COMMAND "ludo"

