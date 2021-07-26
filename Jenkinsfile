pipeline {
   agent {
       docker {
           image 'selenium/standalone-chrome'
       }
   }

   stages {
      stage('Build') {
         steps {
            sh 'pip install -r requirements.txt'
            sh 'webdrivermanager firefox chrome --linkpath AUTO'
            sh 'apt-get install chrome'

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