pipeline {
    agent any    

    stages {
        stage ('Get credentials and pull nginx') {
            steps{
                withCredentials([usernamePassword(credentialsId: 'docker-creds', 
                                                passwordVariable: 'MY_PASS', 
                                                usernameVariable: 'MY_USER')]) {
                    sh 'echo "Logging in as $MY_USER and $MY_PASS"'
                    sh 'docker login -u $MY_USER -p $MY_PASS'
                    sh 'docker pull nginx'
                }
            }

            // see next day 
            // post {
            //     failure {
            //         sh 'docker rmi nginx || true'
            //     }
            // }
        }
    }
}