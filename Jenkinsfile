pipeline {
    agent any

    stages {
        stage('Build') {
            steps {
                sh 'zip -r /var/lib/jenkins/pratik/Piipeline-test.zip index.html'
            }
        }
        stage('Test') {
            steps {
                echo 'testing..'
            }
        }
        stage('Deploy') {
            steps {
                sh '/deploy_80.sh'
            }
        }
    }
}
