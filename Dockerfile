FROM debian:jessie
MAINTAINER Salif Guigma <salif.guigma@gmail.com>


RUN buildDeps=" \
            		gcc \
            		g++ \
                python \
            		make \
                clang \
                curl \
                ca-certificates \

          "; \
          set -x \
          && apt-get update && apt-get install -y  $buildDeps --no-install-recommends \
          vim \
          git \
          && apt-get clean \
          && rm -rf /var/lib/apt/lists/* \
          && curl  -sS -o /tmp/node.tar.gz -L https://nodejs.org/dist/v6.10.0/node-v6.10.0.tar.gz \
          && tar -zxf /tmp/node.tar.gz -C /tmp \
          && cd /tmp/node-v6.10.0 \
          && ./configure --with-intl=full-icu --download=all \
          && make -j4 && make install \
