#cloud-config
runcmd:
- apt-get update
- apt-get install -y git curl
- hostnamectl set-hostname ${userdata_hostname}
- cd /opt
- git clone ${userdata_giturl} -b ${userdata_branch} 
- cd dsiprouter
- ./dsiprouter.sh install -all
- git clone https://git.flyball.co/dsiprouter/deploy.git
- cd deploy/do/demo/
- ./demo_post.sh
