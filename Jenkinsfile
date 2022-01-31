pipeline {
	environment {
		registry = "rahulkumar/kong-deck"
		registryCredential = 'Dockerhub'
		dockerImage = ''
	}
	agent any
		stages {
			stage('Building our image') {
				steps{
					script {
					dockerImage = docker.build registry + ":$BUILD_NUMBER"
					}
				}
			}
			stage('Ping') {
				steps {
					sh 'docker run rahulkumar/kong-deck:$BUILD_NUMBER --kong-addr http://10.102.194.221:8001 ping'
				}
			}
			stage('Validate') {
				steps {
					sh 'docker run rahulkumar/kong-deck:$BUILD_NUMBER --kong-addr http://10.102.194.221:8001 validate'
				}
			}
			stage('Diff') {
				steps {
					sh 'docker run rahulkumar/kong-deck:$BUILD_NUMBER --kong-addr http://10.102.194.221:8001 diff'
				}
			}
			stage('Sync') {
				steps {
					sh 'docker run rahulkumar/kong-deck:$BUILD_NUMBER --kong-addr http://10.102.194.221:8001 sync'
				}
			}
			stage('Cleaning up') {
				steps{
					sh 'docker container prune --force --filter="label=maintainer=rahulkumar/kong-deck"'
					sh 'docker rmi $registry:$BUILD_NUMBER'
				}
			}
}
}