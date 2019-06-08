#!/bin/groovy

import com.devops.pipeline.git.*
import com.devops.pipeline.build.*
import com.devops.pipeline.tools.*


def call(body)
{
   def config = [:]
   body.resolveStrategy = Closure.DELEGATE_FIRST
   body.delegate = config
   body()
   
   def scm = new git()
   def java = new jdk()
   def mvn = new maven()
   def build = new mavenBuild()
  
   stage('Preparing Devops setup'){
      try {
            wrap([$class: 'AnsiColorBuildWrapper']) {
            def VERSION = "JDK1.8"
            java.setJavaHome("${VERSION}")

          }
        }
        catch (error)
        {
          wrap([$class: 'AnsiColorBuildWrapper']) {
              echo "JAVA Initializing Failed..."
              throw error
          }
        }
        try {
        wrap([$class: 'AnsiColorBuildWrapper']) {
            def VERSION = "MAVEN3"
            mvn.setMavenHome("${VERSION}")
          }
        }
        catch (error){
          wrap([$class: 'AnsiColorBuildWrapper']) {
              throw error
          }
        }
    }
    stage('Checkout Git'){
      try {
      scm.gitcheckout()
      echo "\u001B[41m[SUCCESS] Source Code successfully downloaded"
      }
      catch (Exception error)
      {
          wrap([$class: 'AnsiColorBuildWrapper']) {
          echo "\u001B[41m[ERROR] ${error}"
          throw error
          }
      }
    }
    stage('Building code Using Maven'){
        try{
          echo "${MAVEN_VERSION}"
          def GOALS = "clean compile install"
          build.createBuild("${WORKSPACE}/sm-shop" ,"${MAVEN_VERSION}", "${GOALS}")
          }
          catch (Exception error){
          wrap([$class: 'AnsiColorBuildWrapper']) {
            print "\u001B[41m[INFO]: ${error}"
            throw error
          }
      }
    }
}