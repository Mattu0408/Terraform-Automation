pipeline {
    agent any

    parameters {
        choice(
            name: 'ACTION',
            choices: ['plan', 'apply'],
            description: 'Select the action to perform'
        )
        string(
            name: 'BRANCH',
            defaultValue: 'main',
            description: 'Branch to checkout (e.g., main, develop, feature/my-branch)'
        )
    }
    stages {
        stage('Checkout') {
            steps {
                echo "Checking out branch ${params.BRANCH}"
                checkout scmGit(branches: [[name: "*/${params.BRANCH}"]], extensions: [], userRemoteConfigs: [[url: 'https://github.com/Mattu0408/Terraform-Automation.git']])
            }
        }
    
        stage ("terraform init") {
            steps {
                sh ("terraform init -reconfigure") 
            }
        }

        stage ("Action") {
            steps {
                script {
                    switch (params.ACTION) {
                        case 'plan':
                            echo 'Executing Plan...'
                            sh "terraform plan"
                            break
                        case 'apply':
                            echo 'Executing Apply...'
                            sh "terraform apply --auto-approve"
                            break
                        default:
                            error 'Unknown action'
                    }
                }
            }
        }
    }
}
