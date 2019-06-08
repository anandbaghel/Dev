#!/bin/groovy

import main.com.service.git.*
import main.com.service.compile.*
import main.com.service.tools.*

def call(body)
{
   def config = [:]
   body.resolveStrategy = Closure.DELEGATE_FIRST
   body.delegate = config
   body()
   timestamps {
   def g = new git()
   def com = new buildcompile()
   def java = new  jdk()
   def m2 = new maven()
   
   
  stage ('Install all Devops Tools'){
	try {
            wrap([$class: 'AnsiColorBuildWrapper']) {
            def VERSION = "Java1.8"
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
            def VERSION = "Maven3.5.4"
            m2.setMavenHome("${VERSION}")

          }
        }
        catch (error)
        {
          wrap([$class: 'AnsiColorBuildWrapper']) {
              echo "Maven Initializing Failed..."
              throw error
          }
        }
  
  }
 
  stage ('checkout git'){
  try {
      g.gitsourcecode()
      echo "[SUCCESS] Source Code successfully downloaded"
      }
      catch (Exception error)
      {
          wrap([$class: 'AnsiColorBuildWrapper']) {
          echo "[ERROR] ${error}"
          throw error
          }
      }
    }
  stage ('Building source Code'){
  try{
          def MVN_GOALS = "clean install"
          com.compileBuild("${WORKSPACE}" ,"${MAVEN_VERSION}", "${MVN_GOALS}")
          }
          catch (Exception error){
          wrap([$class: 'AnsiColorBuildWrapper']) {
            print "[INFO]: ${error}"
            throw error
          }
  
  }
 }

  }
}
