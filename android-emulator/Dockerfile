FROM zhanglu/android

MAINTAINER zhanglu "zhanglu@camera360.com"

ENV HOME /home/worker
RUN mkdir -p ${HOME}/data/logs/supervisor
RUN mkdir -p ${HOME}/data/run/supervisor
RUN mkdir -p ${HOME}/data/android

# RUN echo y | android update sdk --filter platform-tools,build-tools-19.0.3,sysimg-17,android-17,extra-android-support --no-ui --force

# Set up and run emulator
# RUN echo no | android create avd --force -n test -t android-19 -b armeabi-v7a

# RUN mkdir -p ${HOME}/testProject && android create project -g -v 2.2.+ -a MainActivity -k com.example.example -t android-19 -p ${HOME}/testProject
#RUN cd /opt/tmp && ./gradlew tasks
#RUN rm -rf /opt/tmp

ADD run.sh /
ADD config /home/worker/

RUN chmod a+x /run.sh
RUN chown -R worker.worker /home/worker/

VOLUME ${HOME}/data/android
WORKDIR ${HOME}

ENTRYPOINT ["/run.sh"]
