FROM ubuntu:rolling

# Install dependencies
# "fcitx-ui-qimpanel" is not actually used by wechat, we are just using it to bring bunch of GUI essential packages.
RUN apt-get update
RUN apt-get install -y --no-install-recommends \
        build-essential \
        ca-certificates \
        locales \
        locales-all \
        gnupg \
        locales \
        locales-all \
        dbus-x11 \
        libasound2 \
        fonts-noto-cjk \
        fonts-noto-color-emoji \
        fcitx-ui-qimpanel 

# Add source and install wechat
RUN echo "deb http://archive.ubuntukylin.com/ubuntukylin focal-partner main" > /etc/apt/sources.list.d/wechat.list && \
    apt-key adv --keyserver keyserver.ubuntu.com --recv-keys 56583E647FFA7DE7
RUN apt-get update
RUN apt-get install -y --no-install-recommends \
        weixin 

RUN apt-get clean

ENV LC_ALL zh_CN.UTF-8
ENV LANG zh_CN.UTF-8
ENV LANGUAGE en_US.UTF-8

CMD ["weixin", "--no-sandbox"]
