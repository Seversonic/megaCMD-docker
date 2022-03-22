FROM ubuntu:21.10

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
    https://mega.nz/linux/repo/xUbuntu_21.10/amd64/megacmd_1.5.0-9.1_amd64.deb \
    --output /tmp/megacmd.deb \
    && apt install /tmp/megacmd.deb -y \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/* /tmp/megacmd.*

#copy a login script 
COPY start.sh /usr/bin/local/start.sh
#this additional sh is required otherwise the permissions wont work on the shell file
ENTRYPOINT ["sh", "/usr/bin/local/start.sh"]
