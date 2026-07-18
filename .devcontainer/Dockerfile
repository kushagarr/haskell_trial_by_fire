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
   hlint \
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

ARG FOURMOLU_VERSION=0.20.0.0
RUN case "$(dpkg --print-architecture)" in \
      arm64) FOURMOLU_ARCH=arm64; FOURMOLU_SHA256=11ec841cd63fcf62d2866335a1bc17388ba83f87f22acde22fce281bb6d87994 ;; \
      amd64) FOURMOLU_ARCH=x86_64; FOURMOLU_SHA256=c1e290f504087a6fa1a647b9c19546512fee018e465f7ec4842c985ab9e29abc ;; \
      *) echo "Unsupported architecture: $(dpkg --print-architecture)" >&2; exit 1 ;; \
    esac \
    && curl -fsSLo /tmp/fourmolu.zip \
      "https://github.com/fourmolu/fourmolu/releases/download/v${FOURMOLU_VERSION}/fourmolu-${FOURMOLU_VERSION}-linux-${FOURMOLU_ARCH}.zip" \
    && echo "${FOURMOLU_SHA256}  /tmp/fourmolu.zip" | sha256sum -c - \
    && unzip -q /tmp/fourmolu.zip -d /tmp/fourmolu \
    && install -m 0755 \
      "/tmp/fourmolu/fourmolu-${FOURMOLU_VERSION}-linux-${FOURMOLU_ARCH}/fourmolu" \
      /usr/local/bin/fourmolu \
    && rm -rf /tmp/fourmolu /tmp/fourmolu.zip \
    && fourmolu --version \
    && hlint --version

CMD ["/bin/bash"]
