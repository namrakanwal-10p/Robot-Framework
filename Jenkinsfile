pipeline {
    agent any

    stages {
        stage('Checkout') {
            steps {
                // Increase Git checkout timeout to 10 minutes
                script {
                    def scmVars = checkout(
                        [$class: 'GitSCM', 
                         branches: [[name: '*/main']],
                         doGenerateSubmoduleConfigurations: false, 
                         extensions: [[$class: 'CloneOption', timeout: 10]],
                         userRemoteConfigs: [[url: 'https://github.com/namrakanwal-10p/Robot-Framework.git', credentialsId: 'your-credentials-id']]
                        ]
                    )
                }
            }
        }

        stage('Install Dependencies') {
            steps {
                // Install dependencies if needed (e.g., Python packages)
                bat 'pip install -r requirements.txt'
            }
        }

        stage('Run Tests') {
            steps {
                // Execute your Robot Framework script
                bat 'robot --outputdir results --loglevel TRACE tests/Website_tests/lists_of_books.robot'
            }
        }
    }
}
