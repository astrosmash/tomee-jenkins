FROM openjdk:8-jre

ENV PATH /usr/local/tomee/bin:$PATH
RUN mkdir -p /usr/local/tomee ~/.gnupg

WORKDIR /usr/local/tomee

COPY . .

CMD ["java", "-jar", "openejb-daemon-10.0.0-M3-SNAPSHOT.jar"]

