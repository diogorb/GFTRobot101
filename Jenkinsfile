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
            sh 'webdrivermanager firefox chrome --linkpath AUTO'
            sh 'wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb'
            sh 'sudo apt install ./google-chrome-stable_current_amd64.deb'

         }
      }
      stage('Testing') {
          steps {
            sh 'pabot -d ./logs web'
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