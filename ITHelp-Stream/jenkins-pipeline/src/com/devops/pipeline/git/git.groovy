#!/bin/groovy
package com.devops.pipeline.git

def gitcheckout()
{
	try {
	checkout changelog: false, poll: false, scm: [$class: 'GitSCM', branches: [[name: '*/master']], doGenerateSubmoduleConfigurations: false, extensions: [], submoduleCfg: [], userRemoteConfigs: [[credentialsId: 'ITHelpstream', url: 'https://github.com/ITHelp-Stream/shopizer.git']]]
	print "Successfully clone the Repository..Validate the logs..."
	}
	catch (error) {
    wrap([$class: 'AnsiColorBuildWrapper']) {
    print "Failed to clone the Repository..please check the logs..."
    throw error
		}
    }
}
	
	