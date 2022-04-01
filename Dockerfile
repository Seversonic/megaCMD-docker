FROM ubuntu:21.10

ENV email=email@example.com
ENV password=notyourpassword
ENV resume='0 1 * * *'
ENV pause='0 7 * * *'

#copy scripts over 
COPY ./scripts/* /megacmd/scripts/
COPY ./config/* /megacmd/config/
COPY ./cron/* /megacmd/cron/


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



#generate uuid - needed for mega-sync command
#RUN uuidgen > /etc/machine-id \

#cleanup
#RUN apt-get purge curl \
##    uuid-runtime \
 #   && apt-get clean \
 #   && rm -rf /var/lib/apt/lists/* /tmp/megacmd.*



#change permissions for scripts
#RUN 

ENTRYPOINT /megacmd/scripts/init.sh
