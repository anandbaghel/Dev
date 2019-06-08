#!/bin/groovy

package main.com.service.tools

def setJavaHome(VERSION){
try {
     wrap([$class: 'AnsiColorBuildWrapper']) {
	 env.JAVA_HOME="${tool "${VERSION}"}"
     env.PATH="${env.JAVA_HOME}/bin:${env.PATH}"
     }
	 }
	 catch (error) {
     	wrap([$class: 'AnsiColorBuildWrapper']) {
         print "[ERROR]: failed to set JAVA_HOME to.."
        throw error
     }
   }

}
