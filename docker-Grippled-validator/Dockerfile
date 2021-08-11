FROM ubuntu:latest

LABEL maintainer="lucian.trestioreanu@gmail.com"

RUN export LANGUAGE=C.UTF-8; export LANG=C.UTF-8; export LC_ALL=C.UTF-8; export DEBIAN_FRONTEND=noninteractive

COPY ./entrypoint1 /entrypoint1.sh
COPY ./entrypoint2 /entrypoint2.sh
COPY ./entrypoint3 /entrypoint3.sh
COPY ./hello.js    /hello.js
COPY /keystore/. /keystore/

RUN apt-get update -y && \
    apt-get install apt-transport-https ca-certificates wget bash gnupg iproute2 iputils-ping net-tools apt-utils nano htop -y && \
    DEBIAN_FRONTEND="noninteractive" TZ="Europe/Paris" apt-get -y install tzdata && \
    apt-get install -y gcc g++ git cmake pkg-config protobuf-compiler libprotobuf-dev libssl-dev curl && \
    curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.38.0/install.sh | bash && \
    export NVM_DIR="$([ -z "${XDG_CONFIG_HOME-}" ] && printf %s "${HOME}/.nvm" || printf %s "${XDG_CONFIG_HOME}/nvm")" && \
    [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh" && \
    nvm install v14.17.3 && \
    npm install libp2p ripple-bs58 base-64 sha256 && \
    wget https://boostorg.jfrog.io/artifactory/main/release/1.70.0/source/boost_1_70_0.tar.gz && \
    tar -xzf boost_1_70_0.tar.gz && \
    cd boost_1_70_0 && \
    ./bootstrap.sh && \
    ./b2 headers && \
    ./b2 -j 4 && \
    cd ..  && \
    export BOOST_ROOT=/boost_1_70_0 && \
    git clone https://treisto:LightWarrior0613@github.com/treisto/sntrippled.git && \
    cd sntrippled && \
    git checkout gRPC && \
    mkdir my_build && \
    cd my_build && \
    cmake -DCMAKE_BUILD_TYPE=Debug -DBoost_DEBUG=ON -DBOOST_ROOT=/boost_1_70_0 -DCMAKE_INSTALL_PREFIX=/opt/ripple .. && \
    cmake --build . --target install -- -j 4 && \
    apt-get update -y && \
    cd .. && \
    cd .. && \
    apt-get install python -y && \
    cd /sntrippled/grpc/ && \
    npm install libp2p-tcp && \
#    rm -rf /var/lib/apt/lists/* && \
    export PATH=$PATH:/opt/ripple/bin/ && \
    chmod +x /entrypoint1.sh && \
    chmod +x /entrypoint2.sh && \
    chmod +x /entrypoint3.sh && \
    chmod +x /hello.js && \
    echo '#!/bin/bash' > /usr/bin/server1_info && echo '/entrypoint1.sh server1_info' >> /usr/bin/server1_info && \
    chmod +x /usr/bin/server1_info && \
    echo '#!/bin/bash' > /usr/bin/server2_info && echo '/entrypoint2.sh server2_info' >> /usr/bin/server2_info && \
    chmod +x /usr/bin/server2_info && \
    echo '#!/bin/bash' > /usr/bin/server3_info && echo '/entrypoint3.sh server3_info' >> /usr/bin/server3_info && \
    chmod +x /usr/bin/server3_info && \
    rm /opt/ripple/etc/rippled.cfg && \
    rm /opt/ripple/etc/validators.txt && \
    cp -a /keystore/. /opt/ripple/etc/


RUN ln -s /opt/ripple/bin/rippled /usr/bin/rippled

EXPOSE 51235

#ENTRYPOINT [ "/entrypoint.sh" ]
