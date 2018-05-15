properties(
  [[$class: 'ScannerJobProperty', doNotScan: false],
  [$class: 'RebuildSettings', autoRebuild: false, rebuildDisabled: false],
  buildDiscarder(logRotator(artifactDaysToKeepStr: '', artifactNumToKeepStr: '', daysToKeepStr: '', numToKeepStr: '10')),
  pipelineTriggers([[$class: 'PeriodicFolderTrigger', interval: '1m']])])


credentialsIdHash = 'dccb5beb-b71f-4646-bf5d-837b243c0f87'

node('docker') {

  // Cleanup everything in workspace
  deleteDir()

  docker.image('jekyll/jekyll:latest').inside {

    stage ('Checkout') {
      checkout scm
    }

    stage ('Build') {
      // echo "Branch is: ${env.BRANCH_NAME}"
      // echo "Build is: ${env.BUILD_NUMBER}"
      sh 'http_proxy=http://172.27.128.34:3128 https_proxy=http://172.27.128.34:3128 bundle install'
      sh 'bundle exec jekyll build'
      stash includes: "_site/**", name: "built_website"
    }
  }

  stage ('deploy') {
    // Create _site containing the static files of the website
    unstash 'built_website'

    writeFile file: '_site/DEPLOY.html', text: """<table>
    <tr><th>Deployed branch : </th><td>${env.BRANCH_NAME}<td/></tr>
    <tr><th>Build number : </th><td>${env.BUILD_ID}<td/></tr>
    <tr><th>Build URL : </th><td><a href="${env.BUILD_URL}">${env.BUILD_URL}</a><td/></tr>
    </table>
"""

    CONTAINER_NAME="ikats_website_${env.BRANCH_NAME}"

    // Stop old website (if already started)
    sh "docker stop ${CONTAINER_NAME} && docker rm ${CONTAINER_NAME} || true"

    // Start new docker with this content
    sh "docker run --name ${CONTAINER_NAME} -p 80 -v ${WORKSPACE}/_site:/usr/share/nginx/html:ro -d nginx"

    // Get the assigned port for connection
    sh("docker ps -f name=${CONTAINER_NAME} --format '{{.Ports}}' | sed 's/.*:\\([0-9]\\+\\)->.*/\\1/' > CONTAINER_PORT")
    CONTAINER_PORT = readFile("${WORKSPACE}/CONTAINER_PORT").trim()


  }
  stage ("notify") {
    echo "Open Browser at URL : http://172.28.18.22:${CONTAINER_PORT}"
    emailext body: "IKATS Website deployed at URL : http://172.28.18.22:${CONTAINER_PORT}",
    recipientProviders: [[$class: 'RequesterRecipientProvider'], [$class: 'DevelopersRecipientProvider']],
    subject: '[IKATS] Website successfully deployed'
  }
}
