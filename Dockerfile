FROM openjdk:8-jre

ENV PATH /usr/local/tomee/bin:$PATH
RUN mkdir -p /usr/local/tomee

WORKDIR /usr/local/tomee

COPY . .

CMD ["java", "-jar", "server/openejb-daemon/target/openejb-daemon-10.0.0-M3-SNAPSHOT.jar"]

