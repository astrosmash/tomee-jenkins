#!/usr/bin/env groovy
pipeline {
  agent any

  stages {
    stage("Build") {
      steps {
        sh 'mvn -Pquick -Dsurefire.useFile=false -DdisableXmlReport=true -DuniqueVersion=false -ff -Dassemble -DskipTests -DfailIfNoTests=false -pl org.apache.tomee:openejb-daemon'
      }
    }

    stage("Confirm Build Artifact") {
      steps {
        sh "ls -lah /var/lib/jenkins/workspace/tomee-jenkins/server/openejb-daemon/target/openejb-daemon-*.jar"
        echo "Build Step Executed!"
      }
    }

    stage('Docker Build and Push') {
      steps {
        echo 'Docker build app'
        script {
          docker.withRegistry('', DOCKER_PASS) {
            docker_image = docker.build "${IMAGE_NAME}"
            docker_image.push("${IMAGE_TAG}")
            docker_image.push("latest")
          }
        }
      }
    }

    stage('Cleanup Artifacts') {
      steps {
        script {
          sh "docker rmi ${IMAGE_NAME}:${IMAGE_TAG}"
          sh "docker rmi ${IMAGE_NAME}:latest"
        }
      }
    }
  }
}

