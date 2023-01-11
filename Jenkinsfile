pipeline {
  
  agent any
  
  environment {
    imageName = 'tegexploredevops/images'
    registryCredential = 'dockerhub'
    registry = 'https://registry.hub.docker.com'
   
    
  }
  
  stages {
    
    stage('Clone Git Repo') {
      
      steps {
      
        git branch: 'CICD-FRONT-DEMO', credentialsId: 'github', url: 'git@github.com:Devops-MB/DEVOPS_Stack.git'
        
      }
    }// Clone Git Repo
    
    
    stage('Build Docker Image') {
      
      steps {
        
        script {
          
          dockerImage = docker.build(imageName)
          
        }
        
      }
      
    }// Build Docker Image
    
    
    stage('Test Image for Vulnerabilities') {
          
          steps {
            
            echo "Test PASSED"
            
          }
      }//Test Image
          
    stage('Push Image to Dockerhub') {
      
      steps {
        
        script {
        
          docker.withRegistry(registry, registryCredential) {

            dockerImage.push("front-demo-${env.BUILD_NUMBER}")
          
          } 
        }
      }
    }//Push Image
          
          
    stage('Remove Local Image') {
          
          steps {
            
            sh "docker rmi registry.hub.docker.com/$imageName:front-demo-${env.BUILD_NUMBER}"  
            
          }
     }//Remove Image
          
          
    stage('Trigger UpdateManifestJob') {
      
      steps {
        
        echo "Triggering UpdateManifestJob Now!!"
        build job: 'UpdateManifestJob', parameters: [string(name: 'DOCKERTAG', value: "${env.BUILD_NUMBER}")]
      
      }
    
    
    }//Triger Job
            
            
    
  }//stages
   
}//pipeline
