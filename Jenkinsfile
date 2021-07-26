pipeline {
   agent {
       docker {
           image 'python:3.8'
       }
   }

   stages {
      stage('Build') {
         steps {
            sh 'pip install -r requirements.txt'
            sh 'webdrivermanager firefox chrome --linkpath ./

         }
      }
      stage('Testing') {
          steps {
            sh 'pabot -d ./logs -v browser:headless tests/web'
          }
          post {
             always {
               robot outputPath: 'logs', otherFiles: '**/*.png'
             }
          }
      }
      stage('UAT') {
         steps {
            echo 'Simulando a aprovação do PO'
            input(message: 'Você aprova essa versão?', ok: 'Sim :)')
         }
      }
   }
}