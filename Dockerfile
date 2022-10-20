FROM debian:bullseye

ENV DEBIAN_FRONTEND=noninteractive

RUN apt update \
  && apt install -y \
  git \
  g++ \
  wget \
  curl \
  make \
  build-essential \
  cmake \
  zlib1g-dev \
  libz-dev \
  pkg-config \
  ca-certificates \
  libssl-dev \
  libgmp-dev \
  libmpfr-dev \
  libgsl-dev \
  samtools \
  libjsoncpp-dev \
  htslib-test libhts-dev tabix \
  bamtools libbamtools-dev && apt-get clean && apt-get purge && rm -rf /var/lib/apt/lists/* /tmp/*


#RUN git clone https://github.com/grenaud/libbam.git libbam && cd libbam && make && make clean && cd ..
# https://github.com/grenaud/libbam/issues/3
RUN git clone https://github.com/grenaud/libbam && cd libbam && make || true && cp bamtools/build/src/api/bamtools_api_export.h bamtools/src/api && make || true && cp bamtools/build/src/libbamtools.a bamtools/build/src/api/ && make || true && cd libgab/gzstream/ && make || true && cd - && make && for i in $(ls -l | grep r-x | grep -v ^d | awk '{print $9}') ; do cp $i ${TARGETDIR} ; done || true

WORKDIR /mnt
