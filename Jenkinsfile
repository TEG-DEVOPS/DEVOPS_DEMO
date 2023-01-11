pipeline {
  agent any
  
  stages {
  
    stage('Clone Git Repo') {
    
      steps {
        
        git branch: 'argocd-resources', credentialsId: 'github', url: 'git@github.com:Devops-MB/DEVOPS_Stack.git'
      
      }      
    
    } //Clone Git Repo
    
    stage('Update Manifest File') {
    
      steps {
        
//         sh "sed -i 's#front_image.*#front_image: tegexploredevops/images:front-demo-${params.DOCKERTAG}#g' helm-demo/values.yaml"
        sh "sed -i 's#original_weight.*#original_weight: 80#g' helm-demo/values.yaml"
        sh "sed -i 's#canary_weight.*#canary_weight: 20#g' helm-demo/values.yaml"
        sh "git add ."
        sh "git commit -m 'Done by Jenkins Job updatemanifest: ${env.BUILD_NUMBER}'"
        sshagent(['github']) {
          
          sh "git push git@github.com:Devops-MB/DEVOPS_Stack.git HEAD:argocd-resources"
          
        }
        
      }
    
    } //Update Manifest File
  
  } //stages

} // pipeline
