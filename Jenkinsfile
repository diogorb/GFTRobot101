pipeline {
   agent {
       docker {
           image 'qaninja/python-wd'
       }
   }

   stages {
      stage('Build') {
         steps {
            sh 'pip install -r requirements.txt'
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