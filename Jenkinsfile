pipeline {
    agent { 
        node {
            label 'docker-agent-python-alpine'
            }
      }
    triggers {
        pollSCM '* * * * *'
    }
    environment {
        // Variables de entorno globales útiles para Python
        PYTHONUNBUFFERED = '1'
    }
    stages {
        stage('Build') {
            steps {
                echo "Building.."
                sh '''
                cd myapp
                python3 -m venv venv
                source venv/bin/activate
                pip install -r requirements.txt
                '''
            }
        }
        stage('Test') {
            steps {
                echo "Testing.."
                sh '''

                source VIRTUAL_ENV
                PS1
                python3 hello.py
                python3 hello.py --name=Brad
                '''
            }
        }
        stage('Deliver') {
            steps {
                echo 'Deliver....'
                sh '''
                echo "doing delivery stuff.."
                '''
            }
        }
    }
}