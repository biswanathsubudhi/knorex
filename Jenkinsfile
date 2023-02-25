pipeline {
    agent {
        node any
    }
    stages {
        stage('Build Image') {
            when {
                branch 'master'  //only run these steps on the master branch
            }
            steps {
              sh "docker build . -t biswanathsubudhi/project:${latestCommitid() }"
            }
        }
        stage('Publish Image') {
            when {
                branch 'master'  //only run these steps on the master branch
            }
            steps {
              withCredentials([string(credentialsId: 'dockerhub', variable: 'dockerpassword')]) {
                sh "docker login -u biswanathsubudhi -p ${dockerpassword}"
                sh "docker push biswanathsubudhi/project:${latestCommitid() }"
                }
            }
        }
    }
}

def latestCommitid() {
def latestCommitid=sh returnStdout: true, script: 'git rev-parse --short HEAD'
return latestCommitid
}
