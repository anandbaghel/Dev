#!/bin/groovy

package main.com.service.config

def createArch(){

try {
     wrap([$class: 'AnsiColorBuildWrapper']) {
	 archiveArtifacts '**/**/*.war'
	 }
	 }
	 catch (error) {
     wrap([$class: 'AnsiColorBuildWrapper']) {
         print "[ERROR]: failed to setup the Jenkins Configuration.."
        throw error
     }
   }

}
