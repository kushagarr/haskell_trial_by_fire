FROM debian:latest

RUN rm /bin/sh && ln -s /bin/bash /bin/sh

RUN apt-get update -y \
   && apt-get install -y pkg-config \
   build-essential \
   libpq-dev \
   libsasl2-dev \
   libecpg-dev \
   docker-cli \
   git \
   curl \
   wget \
   unzip \
   ca-certificates \
   ntpsec \
   procps \
   htop \
   bubblewrap \
   && rm -rf /var/lib/apt/lists/*

ENV LANG=C.UTF-8 \
    LC_ALL=C.UTF-8

RUN apt-get update \
    && apt-get install -y libgmp-dev \
    zlib1g-dev \
    libtinfo-dev

RUN curl -fsSL https://chatgpt.com/codex/install.sh | CODEX_NON_INTERACTIVE=1 sh


ENV BOOTSTRAP_HASKELL_GHC_VERSION=9.14.1 \
    BOOTSTRAP_HASKELL_CABAL_VERSION=3.16.1.0
RUN curl --proto '=https' --tlsv1.2 -sSf https://get-ghcup.haskell.org | sh
RUN source ~/.bashrc && ghcup install hls 2.14.0.0

CMD ["/bin/bash"]
