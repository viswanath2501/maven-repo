pipeline {
    agent any 
    
    environment {
        checkoutBranch = "master"
        repoName = "https://github.com/ramakrishna2709/mavenbuild.git"
        
        nexusartifactId = "vprofile"
        version = "2.0" 
        nexusRepo = "maven-releases"
        filename = "target/vprofile-v1.war"
       
    }
     tools {
     maven 'MAVEN_HOME'
    }
    
    
    stages{
      
      stage('Checkout'){
              steps{
                 println "inside the checkout stage"
                 checkout([$class: 'GitSCM', branches: [[name: "${checkoutBranch}"]], doGenerateSubmoduleConfigurations: false, extensions: [], submoduleCfg: [], userRemoteConfigs: [[credentialsId: 'git-server', url: "${repoName}"]]])
          }
      }

      stage('Build'){
              
           steps{
              println "inside the build stage"
              sh "mvn clean package"
              
          }
      } 

      stage('UnitTest'){
          steps{
              println "inside the UnitTest"
              sh "mvn test -B" 
              
              step([$class: 'JUnitResultArchiver', testResults: '**/target/surefire-reports/*.xml'])
      }
      }

     

       stage('Deploy to Nexus')
			{
            steps{
			    println "[INFO] running deploy to nexus"
                
				println "${filename}"
			
                step([$class: 'NexusArtifactUploader', artifacts: [[artifactId: "${nexusartifactId}", classifier: '', file: "${filename}", type: 'war']], credentialsId: 'nexus-server', groupId: 'com.visualpathit', nexusUrl: '35.224.126.222:8081', nexusVersion: 'nexus3', protocol: 'http', repository: "${nexusRepo}", version: "${version}"])	
	            }
            }
            
       
}
}