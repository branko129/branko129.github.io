  
node {
    def app

    stage('Clone repository') {
      

        checkout scm
    }

    stage('Build image') {
        app = docker.build("branko129/test")
    }                     

    stage('Test image') {
  

        app.inside {
            sh 'echo "Tests passed"'
        }
    }

    stage('Push image') {
        
        docker.withRegistry('', 'git') {
            app.push("${env.BUILD_NUMBER}")
            app.push("latest")
        }
    }
   
  stage('Deploy to k8') {
      
        withKubeConfig([credentialsId: 'k8', serverUrl: 'https://192.168.9.55:6443']) {
        sh 'kubectl apply -f k8.yaml'
    }
  }
}
