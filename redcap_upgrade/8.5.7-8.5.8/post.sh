redcap_version_current=8.5.7
redcap_version=8.5.8
cd docker_redcap_fresh

mysql -uroot -proot redcap -e "UPDATE redcap_config SET value = '${redcap_version}' WHERE field_name = 'redcap_version'"
mysql -uroot -proot redcap -e "UPDATE redcap_config SET value = '/share/edocs/' WHERE field_name = 'edoc_path'"

cd docker_redcap_fresh
sudo docker-compose up -d --build --force-recreate