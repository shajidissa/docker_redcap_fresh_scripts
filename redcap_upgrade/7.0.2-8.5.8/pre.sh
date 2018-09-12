redcap_version=8.5.8

sudo docker stop docker_redcap_fresh_redcap_1
sudo docker rm docker_redcap_fresh_redcap_1
sudo rm -rf docker_redcap_fresh/

sudo git clone https://github.com/shajidissa/docker_redcap_fresh.git
cd docker_redcap_fresh
sudo git checkout redcap${redcap_version}
sudo unzip -o redcap/redcap${redcap_version}.zip -d redcap/redcap_v${redcap_version}

