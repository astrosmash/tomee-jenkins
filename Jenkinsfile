#!/usr/bin/env groovy
pipeline {
  agent any

  stages {
    stage("Build") {
      steps {
        sh 'mvn -Pquick -Dsurefire.useFile=false -DdisableXmlReport=true -DuniqueVersion=false -ff -Dassemble -DskipTests -DfailIfNoTests=false -pl org.apache.tomee:openejb-daemon'
      }
    }

    stage("Confirm Build") {
      steps {
        echo "Build Step Executed!"
      }
    }
  }
}
