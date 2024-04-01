FROM ubuntu:22.04

RUN apt update && apt install -y build-essential clang flex bison g++ gawk \
gcc-multilib g++-multilib gettext git libncurses5-dev libssl-dev \
python3-distutils rsync unzip zlib1g-dev file wget subversion git-core 

ENV FORCE_UNSAFE_CONFIGURE=1

WORKDIR /build

CMD ["tail", "-f", "/dev/null"]
