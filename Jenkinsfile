#!/usr/bin/env groovy

pipeline {
    agent any 
    stages {
        stage('Echo') {
            steps {
                echo 'Hello world!'
            }
        }
        stage('Docker build') {
            steps {
                sh '''
                    docker build -f Dockerfile . --tag alisdairvravn/dummy-metis:latest
                    
                    docker push alisdairvravn/dummy-metis:latest
                '''
            }
        }
    }
}
