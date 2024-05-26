pipeline {
    agent any

    environment {
        BROWSER = 'chrome' // Set the default browser to use for tests
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
                bat "robot --variable BROWSER:%BROWSER% --variable OPTIONS:headless --outputdir results --loglevel DEBUG tests/Website_tests/SuiteExecutor/TestSuite.robot"
            }
        }
    }

    post {
        always {
            echo 'Archiving artifacts and publishing reports...'
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
