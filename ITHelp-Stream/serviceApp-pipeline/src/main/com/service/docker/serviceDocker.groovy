#!/bin/groovy

package main.com.service.docker

def  deleteDockerImage(){
try {
    wrap([$class: 'AnsiColorBuildWrapper']) {
	print "INFO => Deleting Docker images.. please wait..."
        sh "cd ${WORKSPACE}"
	sh "docker rmi -f \$(docker images)"
	}
	}
    catch (error) {
     wrap([$class: 'AnsiColorBuildWrapper']) {
        print "[ERROR]: Failed to delete Image.. please check the console logs"
        throw error
     }
   }
}

def createDockerImage(String APP_IMAGE_NAME , String DOCKERFILE_PATH){
try {
    wrap([$class: 'AnsiColorBuildWrapper']) {
	print "INFO => triggering docker build for $APP_IMAGE_NAME please wait..."
        sh "cd ${WORKSPACE}"
	sh "docker build -t ${APP_IMAGE_NAME} --file=${DOCKERFILE_PATH} ${WORKSPACE}/sm-shop"
	}
	}
    catch (error) {
     wrap([$class: 'AnsiColorBuildWrapper']) {
        print "[ERROR]: Failed to create Image.. please check the console logs"
        throw error
     }
   }
}


def pushDockerImage(String REGISTERY_NAME , String DOCKER_IMAGE){
try {
    wrap([$class: 'AnsiColorBuildWrapper']) {
	print "INFO => triggering docker push for $DOCKER_IMAGE please wait..."
        sh "cd ${WORKSPACE}"
	sh "docker push ${REGISTERY_NAME}/${DOCKER_IMAGE}"
	}
	}
    catch (error) {
     wrap([$class: 'AnsiColorBuildWrapper']) {
        print "[ERROR]: Failed to push Image.. please check the console logs"
        throw error
     }
   }
}