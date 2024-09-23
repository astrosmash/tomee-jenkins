#!/usr/bin/env groovy
pipeline {
  agent any

  environment {
      APP_NAME = "simple-java-maven-app-jenkins-docs"
      DOCKER_USER = "registry"
      DOCKER_PASS = 'docker' // Secret name to use to sign into Docker registry
      IMAGE_NAME = "${DOCKER_USER}" + "/" + "${APP_NAME}"

  }

  stages {
    stage("Build") {
      steps {
        sh 'mvn package'
      }
    }

    stage("Confirm Build Artifact") {
      steps {
        sh "ls -lah /var/lib/jenkins/workspace/target/my-app-1.0-SNAPSHOT.jar"
        echo "Build Step Executed!"
      }
    }

    stage('Docker Build and Push') {
      steps {
        echo 'Docker build app'
        script {
          docker.withRegistry('https://localhost:5000', DOCKER_PASS) {
            docker_image = docker.build "${IMAGE_NAME}"
            docker_image.push("latest")
          }
        }
      }
    }

    stage('Cleanup Artifacts') {
      steps {
        script {
          sh "docker rmi ${IMAGE_NAME}:latest"
        }
      }
    }
  }
}

