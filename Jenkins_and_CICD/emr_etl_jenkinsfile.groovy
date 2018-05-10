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
        echo "Prior to start, checkout the code"
        checkout scm
        stage('Start - clone repo'){
            echo "BUILD_URL=${env.BUILD_URL}"
            echo "workspace=${workspace}"
            echo "Start, ${DataScope}"

            echo "Start, checkout scm"
            
            def workspace = pwd()
            echo "workspace=${workspace}"
            sh 'ls -la'

        } 
        stage('Load - Start Hadoop for ETL'){ 
            //echo "Load, ${parm1}"
            sh '~/.local/bin/aws s3 cp s3://ccdh-data/hadoop-emr-steps/step4-run-sqoop.sh ./'
            sh 'ls -la'
            dir ('AWS_Scripts_And_Templates/hadoop/emr_step_artifacts/emr_steps_load_subset') {
                sh 'ls -la'
            }

        }
        stage('Test'){
            echo "Test, ${DataScope}"
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
