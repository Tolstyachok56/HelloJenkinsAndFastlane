def lastCommitInfo = ""
def skippingText = ""
def commitContainsSkip = 0
def slackMessage = ""
def shouldBuild = false

def pollSpec = ""

if(env.BRANCH_NAME == "master") {
    pollSpec = "*/5 * * * *"
} else if(env.BRANCH_NAME == "test") {
    pollSpec = "* * * * 1-5"
}

pipeline {
    agent any
    
    options {
        ansiColor("xterm")
    }
    
    stages {
    
        stage('Init') {
            steps {
                script {
                    lastCommitInfo = sh(script: "git log -1", returnStdout: true).trim()
                    commitContainsSkip = sh(script: "git log -1 | grep '.*\\[skip ci\\].*'", returnStatus: true)

                    if(commitContainsSkip == 0) {
                        skippingText = "Skipping commit."
                        env.shouldBuild = false
                        currentBuild.result = "NOT_BUILT"
                    }
                }
            }
        }
        
        stage('Increment build number') {
          when {
            expression {
              return env.shouldBuild != "false"
            }
          }
          steps {
            sh "fastlane incrementBuildNumberAndCommit"
          }
        }
        
        stage('Build application for beta') {
          when {
            expression {
              return env.shouldBuild != "false"
            }
          }
          steps {
            // Build application for pre-prod servers
            sh "fastlane beta"
          }
        }
        
        stage('Deploy to beta') {
          when {
            expression {
              return env.shouldBuild != "false"
            }
          }
          steps {
            // Deploy new build to pre-prod environments
          }
        }
    }
}
