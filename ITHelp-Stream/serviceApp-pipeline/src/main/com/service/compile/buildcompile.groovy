#!/bin/groovy

package main.com.service.compile

def compileBuild(POM_PATH, MAVEN_VERSION, MVN_GOALS){
    try {
    wrap([$class: 'AnsiColorBuildWrapper']) {
	sh "'${MAVEN_VERSION}'/bin/mvn -f '${POM_PATH}' ${MVN_GOALS}"
    print "[INFO]: Successfully Executing the Build..."
	}
	}
    catch (error) {
     wrap([$class: 'AnsiColorBuildWrapper']) {
        print "[ERROR]: Build is failed.. please check the console logs"
        throw error
     }
   }
}
