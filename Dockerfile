FROM ubuntu:21.10

ENV email=email@example.com
ENV password=notyourpassword

RUN apt-get update \
    && apt-get -y install \
    --no-install-recommends \
    curl \
    gnupg2 \
    nano \
	cron \
    ca-certificates \
    && update-ca-certificates \
    && curl  \
    https://mega.nz/linux/repo/xUbuntu_21.10/amd64/megacmd_1.5.0-9.1_amd64.deb \
    --output /tmp/megacmd.deb \
    && apt install /tmp/megacmd.deb -y \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/* /tmp/megacmd.*

#copy scripts over 
COPY ./scripts/* /megacmd/scripts/
COPY ./config/* /megacmd/config/

#change permissions for entrypoint
RUN chmod +x /megacmd/scripts/init.sh

ENTRYPOINT /megacmd/scripts/init.sh
