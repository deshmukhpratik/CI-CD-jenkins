pipeline {
    agent any

    
    stages {
        stage('git') {
            steps{
               git credentialsId: 'git_credentials', url: 'https://gitlab.com/tekno-shaft-projects/tata-capital-li-ui.git'
            }
        }     
         stage('Build'){
            steps {
                script {
                     sh '''
                     sudo ssh -tt shaunak@${IP} << EOF
                     cd /home/shaunak/
                     sudo apachectl stop
                     sudo ./deploy.sh
                     exit 0
                     EOF
                     '''
                }     
            }
        }
        stage('pointing change'){
            steps {
                script {
                     sh '''
                     sudo ssh -tt shaunak@${IP} << EOF
                     sudo mv /etc/httpd/conf/httpd.conf /etc/httpd/conf/httpd.80.bkp
                     sudo mv /etc/httpd/conf/httpd.8080.bkp /etc/httpd/conf/httpd.conf
                     sudo apachectl restart
                     exit 0
                     EOF
                     '''
                }     
            }
        }
        stage('Deploy') {
            input {
                message "Can we Proceed?"
                ok "Yes"
                submitter "apache live"
                parameters {
                    string(name: 'Pointing change on 80', defaultValue: 'apachelive', description: '')
                }
            }
            steps {
                script {
                     sh '''
                     sudo ssh -tt shaunak@${IP} << EOF
                     sudo mv /etc/httpd/conf/httpd.conf /etc/httpd/conf/httpd.8080.bkp
                     sudo mv /etc/httpd/conf/httpd.80.bkp /etc/httpd/conf/httpd.conf
                     sudo apachectl restart
                     exit 0
                     EOF
                     '''
                }     
            }   
        }    
    }
}
