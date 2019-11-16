String dockerHubUser = "philipwold"
String repo = "arch-tini"

node ("master") {
    stage ("checkout scm") {
        checkout scm
    }
    
    stage ("download tini") {
        sh "chmod +x download_tini.sh; ./download_tini.sh"
    }

    stage ("docker build") {
        def image = docker.build("${dockerHubUser}/${repo}")
        docker.withRegistry('https://registry-1.docker.io/v2/', '4ad791bd-6d00-41ac-aa33-ba5aeb446f25') {
            image.push()
        }
    }
}