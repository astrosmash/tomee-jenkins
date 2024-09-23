FROM openjdk:11-ea-17-jre-slim

ENV PATH /usr/local/simple-java-maven-app-jenkins-docs/bin:$PATH
RUN mkdir -p /usr/local/simple-java-maven-app-jenkins-docs

WORKDIR /usr/local/simple-java-maven-app-jenkins-docs

COPY . .

CMD ["java", "-jar", "target/my-app-1.0-SNAPSHOT.jar"]

