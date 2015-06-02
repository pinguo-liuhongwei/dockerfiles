FROM pinguozhanglu/android

MAINTAINER zhanglu "zhanglu@camera360.com"

ENV HOME /home/worker
mkdir -p ${HOME}/data

RUN echo y | android update sdk --filter platform-tools,build-tools-19.0.3,sysimg-17,android-17,extra-android-support --no-ui --force

# Set up and run emulator
RUN echo no | android create avd --force -n test -t android-17 -b armeabi-v7a

ADD wait-for-emulator /usr/local/bin/
ADD start-emulator /usr/local/bin/

RUN mkdir -p ${HOME}/testProject && android create project -g -v 0.9.+ -a MainActivity -k com.example.example -t android-17 -p ${HOME}/testProject
#RUN cd /opt/tmp && ./gradlew tasks
#RUN rm -rf /opt/tmp

RUN chown -R worker.worker /home/worker/

VOLUME ${HOME}/data
WORKDIR ${HOME}

ENTRYPOINT /usr/sbin/sshd -D
