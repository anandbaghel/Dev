#! /bin/groovy

package main.com.service.kube

def  createDeployment(String DEPLOY_FILE_PATH){
try {
    wrap([$class: 'AnsiColorBuildWrapper']) {
	print "INFO => creating kubernetes pods.. please wait..."
        sh "cd ${WORKSPACE}"
	sh "kubectl create -f ${DEPLOY_FILE_PATH}"
	}
	}
    catch (error) {
     wrap([$class: 'AnsiColorBuildWrapper']) {
        print "[ERROR]: Failed to create pods.. please check the console logs"
        throw error
     }
   }
}


def  createService(String SERVICE_FILE_PATH){
try {
    wrap([$class: 'AnsiColorBuildWrapper']) {
        print "INFO => creating kubernetes service.. please wait..."
        sh "cd ${WORKSPACE}"
        sh "kubectl create -f ${SERVICE_FILE_PATH}"
        }
        }
    catch (error) {
     wrap([$class: 'AnsiColorBuildWrapper']) {
        print "[ERROR]: Failed to create service.. please check the console logs"
        throw error
     }
   }
}

