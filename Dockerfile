FROM ubuntu:groovy

ENV email=email@example.com
ENV password=notyourpassword

RUN apt-get update \
    && apt-get -y install \
    --no-install-recommends \
    curl \
    gnupg2 \
    nano \
    ca-certificates \
    && update-ca-certificates \
    && curl  \
    https://mega.nz/linux/MEGAsync/xUbuntu_20.10/amd64/megacmd-xUbuntu_20.10_amd64.deb \
    --output /tmp/megacmd.deb \
    && apt install /tmp/megacmd.deb -y \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/* /tmp/megacmd.*

#copy a login script 
COPY megalogin.sh /usr/bin/local/megalogin.sh
#this additional sh is required otherwise the permissions wont work on the chell file
ENTRYPOINT ["sh", "/usr/bin/local/megalogin.sh"]
