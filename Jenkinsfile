pipeline {
    agent any

    stages {
        stage('Checkout') {
            steps {
                // Fetch code from Git repository
                git url: 'https://github.com/namrakanwal-10p/Robot-Framework.git', credentialsId: 'namra'
            }
        }

        stage('Install Dependencies') {
            steps {
                // Install dependencies if needed (e.g., Python packages)
                sh 'pip install -r requirements.txt'
            }
        }

        stage('Run Tests') {
            steps {
                // Execute your Robot Framework script
                sh 'robot --outputdir results --loglevel TRACE tests/Website_tests/'
            }
        }
    }
}
