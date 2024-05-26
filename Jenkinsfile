pipeline {
    agent any

    environment {
        BROWSER = 'chrome'  // Or 'firefox' depending on your setup
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
                bat 'pip install -r requirements.txt'
            }
        }

        stage('Run Tests') {
            steps {
                bat "robot --variable BROWSER:%BROWSER% --outputdir results --loglevel TRACE tests/Website_tests/Click_alerts.robot"
            }
        }
    }

    post {
        always {
            archiveArtifacts artifacts: 'results/**/*', allowEmptyArchive: true
            publishHTML(target: [
                allowMissing: false,
                alwaysLinkToLastBuild: false,
                keepAll: true,
                reportDir: 'results',
                reportFiles: 'log.html,report.html',
                reportName: 'Robot Framework Test Report'
            ])
        }
    }
}
