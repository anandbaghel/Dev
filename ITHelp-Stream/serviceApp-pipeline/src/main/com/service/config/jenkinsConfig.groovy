#!/bin/groovy

package main.com.service.config

def setupJenkinsConfig(){

try {
     wrap([$class: 'AnsiColorBuildWrapper']) {
	properties([buildDiscarder(logRotator(artifactDaysToKeepStr: '10', artifactNumToKeepStr: '10', daysToKeepStr: '10', numToKeepStr: '10'))])
	 }
	 }
	 catch (error) {
     wrap([$class: 'AnsiColorBuildWrapper']) {
         print "[ERROR]: failed to setup the Jenkins Configuration.."
        throw error
     }
   }

}
