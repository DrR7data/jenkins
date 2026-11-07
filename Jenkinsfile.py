pipeline {
    agent {
        docker {
            image 'python:3.12-slim'
        }
    }

    environment {
        HOME = "${WORKSPACE}"
        PIP_CACHE_DIR = "${WORKSPACE}/.cache/pip"
        PYTHONUSERBASE = "${WORKSPACE}/.local"
        PATH = "${WORKSPACE}/.local/bin:${env.PATH}"
    }

    stages {
        stage('Instalar dependencias') {
            steps {
                sh 'pip install --user -r ./myapp/requirements.txt'
            }
        }

        stage('Ejecutar app') {
            steps {
                sh 'python ./myapp/app.py'
            }
        }
    }
}