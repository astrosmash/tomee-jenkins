FROM openjdk:17-jdk-slim


ENV PATH /usr/local/simple-java-maven-app-jenkins-docs/bin:$PATH
RUN mkdir -p /usr/local/simple-java-maven-app-jenkins-docs

WORKDIR /usr/local/simple-java-maven-app-jenkins-docs

COPY . .

CMD ["java", "-jar", "target/my-app-1.0-SNAPSHOT.jar"]

