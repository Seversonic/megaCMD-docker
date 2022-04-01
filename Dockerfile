FROM ubuntu:21.10

ENV email=email@example.com
ENV password=notyourpassword

#copy scripts over 
COPY ./scripts/* /megacmd/scripts/
COPY ./config/* /megacmd/config/


##install all the things
RUN apt-get update \
    && apt-get -y install \
    --no-install-recommends \
    uuid-runtime \
    curl \
    gnupg2 \
    nano \
    cron \
    ca-certificates \
    && update-ca-certificates \
    && chmod +x /megacmd/scripts/*.sh \
    && curl https://mega.nz/linux/repo/xUbuntu_21.10/amd64/megacmd_1.5.0-12.1_amd64.deb --output /tmp/megacmd.deb \
    && apt install /tmp/megacmd.deb -y \
    && uuidgen > /etc/machine-id \
    apt-get purge curl \
    uuid-runtime \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/* /tmp/megacmd.*

ENTRYPOINT /megacmd/scripts/init.sh
