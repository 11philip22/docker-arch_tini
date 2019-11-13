String dockerHubUser = "philipwold"
String repo = "arch-tini"

node ("master") {
    stage ("checkout scm") {
        checkout scm
    }
    
    stage ("download tini") {
        sh """\
            curl --connect-timeout 5 --max-time 600 --retry 5 --retry-delay 0 --retry-max-time 60 -o /tmp/tini_release_tag -L https://github.com/krallin/tini/releases
            tini_release_tag=$(cat /tmp/tini_release_tag | grep -P -o -m 1 '(?<=/krallin/tini/releases/tag/)[^"]+')
            curl --connect-timeout 5 --max-time 600 --retry 5 --retry-delay 0 --retry-max-time 60 -o tini -L "https://github.com/krallin/tini/releases/download/${tini_release_tag}/tini-amd64"
            chmod +x tini
        """
    }

    stage ("docker build") {
        def image = docker.build("${dockerHubUser}/${repo}")
        docker.withRegistry('https://registry-1.docker.io/v2/', '4ad791bd-6d00-41ac-aa33-ba5aeb446f25') {
            image.push()
        }
    }
}