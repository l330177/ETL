#!/usr/bin/env groovy
/**
        * Jenkinsfile groovy Pipeline for Comcast_ETL
        * by alee@willlowry.com 
	* running from scm
*/
import java.net.URL
import groovy.json.JsonSlurperClassic
import groovy.json.JsonBuilder
import groovy.json.JsonOutput
import hudson.model.*
import hudson.EnvVars
 
try {
node {
stage('start'){
echo "BUILD_URL=${env.BUILD_URL}"
echo "workspace=${workspace}"
echo "Start, ${parm1}"
def workspace = pwd()
echo "workspace=${workspace}"
} 
stage('Load'){ 
echo "Load, ${parm1}"
}
stage('Test'){
echo "Test, ${parm1}"
}
} // node
} // try end
catch (exc) {
/*
 err = caughtError
 currentBuild.result = "FAILURE"
 String recipient = 'alee@willlowry.com'
 mail subject: "${env.JOB_NAME} (${env.BUILD_NUMBER}) failed",
         body: "It appears that ${env.BUILD_URL} is failing, somebody should do something about that",
           to: recipient,
      replyTo: recipient,
 from: 'alee@willlowry.com'
*/
} finally {
  
 (currentBuild.result != "ABORTED") && node("master") {
     // Send e-mail notifications for failed or unstable builds.
     // currentBuild.result must be non-null for this step to work.
     step([$class: 'Mailer',
        notifyEveryUnstableBuild: true,
        recipients: "",
        sendToIndividuals: true])
 }
 
 // re-try exception to push error:
/*
 if (err) {
     throw err
 }
*/
}
