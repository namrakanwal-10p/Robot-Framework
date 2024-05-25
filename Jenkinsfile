pipeline {
    agent any

    options {
        timeout(time: 30, unit: 'MINUTES')  // Timeout for the entire pipeline
    }

    stages {
        stage('Checkout') {
            steps {
                script {
                    def scmVars = checkout(
                        [$class: 'GitSCM', 
                         branches: [[name: '*/main']],
                         doGenerateSubmoduleConfigurations: false, 
                         extensions: [[$class: 'CloneOption', timeout: 10]],
                         userRemoteConfigs: [[url: 'https://github.com/namrakanwal-10p/Robot-Framework.git', credentialsId: 'namra']]
                        ]
                    )
                }
            }
        }

        stage('Install Dependencies') {
            steps {
                sh 'pip install -r requirements.txt'
            }
        }

        stage('Run Tests') {
            steps {
                sh 'robot --outputdir results --loglevel TRACE tests/Website_tests/'
            }
        }
    }
}
