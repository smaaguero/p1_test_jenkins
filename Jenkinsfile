pipeline {
    agent any
	 options {
	    disableConcurrentBuilds()
	  }
    stages {
        stage('Ejecuto la practica 1') {
         steps {
            sh '''
            #!/bin/bash
            chmod 700 scriptInicial.sh
            ./scriptInicial.sh
            '''
            }
        }
    }
    post {
        always {
            cleanWs()
        }
    }
}
