pipeline {
    agent any

    //optimization
    environment {
        USERNAME = 'deploy'
        HOST = 'server.example.com'
    }

    stages  {
        stage ('Execution') {            
            steps {
                withCredentials([
                    sshUserPrivateKey(credentialsId: 'prod-server-key', keyFileVariable: 'SSH_KEY'),
                    string(credentialsId: 'api-token', variable: 'TOKEN')
                ]) {
                    sh 'curl -H "Authorization: Bearer $TOKEN" https://api.example.com/notify'
                    //sh 'curl -H "Authorization: Token $TOKEN" https://api.example.com/notify'
                    //sh 'curl -H "<your-header-to-keep-token>: $TOKEN" https://api.example.com/notify'
                    sh 'ssh -i $SSH_KEY -o StrictHostKeyChecking=no $USERNAME@$HOST "systemctl restart app"'
                }
            }
        }
    }
}