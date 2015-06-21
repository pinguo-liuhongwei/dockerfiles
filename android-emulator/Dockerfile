FROM pinguozhanglu/android
MAINTAINER zhanglu "zhanglu@camera360.com"

ENV HOME /home/worker
RUN mkdir -p ${HOME}/data/logs/supervisor \
    && mkdir -p ${HOME}/data/run/supervisor \
    && mkdir -p ${HOME}/data/android

ADD run.sh /
ADD config /home/worker/

RUN crontab -u worker /home/worker/cron \
    && rm -rf /home/worker/cron \
    && service crond start
RUN chmod a+x /run.sh \
    && chmod a+x /home/worker/bin/*
RUN chown -R worker.worker /home/worker/ \
    && su worker -c 'chmod 700 /home/worker/.ssh' \
    && su worker -c 'chmod 600 /home/worker/.ssh/authorized_keys'

# Set up and run emulator
ENV ANDROID_HOME ${HOME}/android-sdk-linux
ENV PATH ${PATH}:${ANDROID_HOME}/tools:${ANDROID_HOME}/platform-tools
RUN echo no | su worker -c 'android create avd --force -n avd1 -t android-22 -b armeabi-v7a'
    && sed -i \
    -e 's/^hw\.ramSize=[0-9]*/hw.ramSize=1024/g' \
    -e 's/^vm\.heapSize=[0-9]*/vm.heapSize=768/g' \
    /home/worker/.android/avd/avd1.avd/config.ini

VOLUME ${HOME}/data/android
WORKDIR ${HOME}

ENTRYPOINT ["/run.sh"]
