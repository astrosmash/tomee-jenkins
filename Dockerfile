FROM openjdk:8-jre

ENV PATH /usr/local/tomee/bin:$PATH
RUN mkdir -p /usr/local/tomee

WORKDIR /usr/local/tomee

COPY /var/lib/jenkins/workspace/tomee-jenkins/server/openejb-daemon/target/openejb-daemon-*.jar /usr/local/tomee/

CMD ["java", "-jar", "openejb-daemon-10.0.0-M3-SNAPSHOT.jar"]

