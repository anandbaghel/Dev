#!/bin/groovy

import main.com.service.git.*
import main.com.service.compile.*
import main.com.service.tools.*
import main.com.service.config.*
import main.com.service.docker.*
import main.com.service.kube.*

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
            def VERSION = "Jdk1.8"
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
  stage ('Prepare Job configuration'){
  try {
            wrap([$class: 'AnsiColorBuildWrapper']) {
            def jen = new jenkinsConfig()
			jen.setupJenkinsConfig()
          }
        }
        catch (error)
        {
          wrap([$class: 'AnsiColorBuildWrapper']) {
              echo "Configuration Initializing Failed..."
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
 stage ('Archive Artifacts'){
 try {
            wrap([$class: 'AnsiColorBuildWrapper']) {
            def arc = new archive()
			arc.createArch()
		 }
        }
        catch (error)
        {
          wrap([$class: 'AnsiColorBuildWrapper']) {
              echo "Configuration Initializing Failed..."
              throw error
          }
        }
 
 }
 stage ('Deleting Docker Images'){
 try {
            wrap([$class: 'AnsiColorBuildWrapper']) {
           // def doc = new serviceDocker()
			//doc.deleteDockerImage()
		 }
        }
        catch (error)
        {
          wrap([$class: 'AnsiColorBuildWrapper']) {
              echo "Docker images deletion Failed..."
              throw error
          }
        }
	}
 stage ('Create Docker Images'){
 try {
            wrap([$class: 'AnsiColorBuildWrapper']) {
            def doc = new serviceDocker()
	    //def DOCKER_IMAGE_NAME= "serviceapp:1.2.3"
	    //def DOCKERFILE_PATH= "${WORKSPACE}/sm-shop/Dockerfile"
	    doc.createDockerImage("nogiboina/serviceapp:1.2.3", "sm-shop/Dockerfile")
		 }
        }
        catch (error)
        {
          wrap([$class: 'AnsiColorBuildWrapper']) {
              echo "Docker Image creation Failed..."
              throw error
          }
        }
 	}
stage ('Pusing Docker Images'){
 try {
            wrap([$class: 'AnsiColorBuildWrapper']) {
            def doc = new serviceDocker()
	        doc.pushDockerImage("docker.io/nogiboina","serviceapp:1.2.3")
			sleep 120
		 }
        }
        catch (error)
        {
          wrap([$class: 'AnsiColorBuildWrapper']) {
              echo "Docker Image creation Failed..."
              throw error
          }
        }
 	}
	
stage ('Create Kube Service'){
 try {
            wrap([$class: 'AnsiColorBuildWrapper']) {
            def kube = new kubeResources()
	       kube.createService("sm-shop/serviceApp/serviceapp-service.yml")
			sleep 120
		 }
        }
        catch (error)
        {
          wrap([$class: 'AnsiColorBuildWrapper']) {
              echo "Docker Image creation Failed..."
              throw error
          }
        }
 	}
	

  }
}
