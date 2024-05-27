pipeline {
    agent any

    environment {
        BROWSER = 'chrome'  // Set the browser to use for tests, change to 'firefox' if needed
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

        stage('Verify Directory Structure') {
            steps {
                echo 'Checking the tests directory structure...'
                bat 'dir tests'
                bat 'dir tests\\Website_tests'
            }
        }

        stage('Verify Robot Framework Installation') {
            steps {
                echo 'Verifying Robot Framework installation...'
                bat 'robot --version'
            }
        }

        stage('Install Dependencies') {
            steps {
                echo 'Installing dependencies...'
                bat 'pip install -r requirements.txt'
            }
        }

        stage('Run Tests') {
            steps {
                echo 'Running tests...'
                script {
                    try {
                        bat "robot --variable BROWSER:%BROWSER% --outputdir results --loglevel TRACE tests\\Website_tests\\SuiteExecuter\\Testsuite.robot"
                    } catch (Exception e) {
                        echo 'Error during test execution'
                        echo e.toString()
                        currentBuild.result = 'FAILURE'
                    }
                }
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
