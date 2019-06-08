#!/bin/groovy

package main.com.service.tools

def setMavenHome(VERSION){
	try {
     wrap([$class: 'AnsiColorBuildWrapper']) {
       env.MAVEN_VERSION="${tool "${VERSION}"}"
       echo "'${MAVEN_VERSION}'"
      //echo "'${MAVEN_HOME}'"
       sh "${MAVEN_VERSION}/bin/mvn --version"
	   }
   }
   catch (error) {
     wrap([$class: 'AnsiColorBuildWrapper']) {
        print "[ERROR]: failed to failed to set Maven ."
        throw error
     }
   }
}
