pipeline {
    agent {
        docker {
            image 'python:3.12-slim'
        }
    }

    stages {
        stage('Versión de Python') {
            steps {
                sh 'python --version'
            }
        }

        stage('Instalar dependencias') {
            steps {
                sh 'pip install -r ./myapp/requirements.txt'
            }
        }

        stage('Ejecutar pruebas') {
            steps {
                sh 'python -m pytest'
            }
        }

        stage('Ejecutar app') {
            steps {
                sh 'python ./myapp/hello.py'
            }
        }
    }
}