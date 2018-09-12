redcap_version_current=8.1.2
redcap_version=8.5.8
cd docker_redcap_fresh

mysql -uroot -proot redcap < redcap/redcap_v${redcap_version}/redcap/redcap_v${redcap_version}/Resources/sql/upgrade_8.02.00.sql
mysql -uroot -proot redcap < redcap/redcap_v${redcap_version}/redcap/redcap_v${redcap_version}/Resources/sql/upgrade_8.02.01.sql
mysql -uroot -proot redcap < redcap/redcap_v${redcap_version}/redcap/redcap_v${redcap_version}/Resources/sql/upgrade_8.02.02.sql
mysql -uroot -proot redcap < redcap/redcap_v${redcap_version}/redcap/redcap_v${redcap_version}/Resources/sql/upgrade_8.02.03.sql
mysql -uroot -proot redcap < redcap/redcap_v${redcap_version}/redcap/redcap_v${redcap_version}/Resources/sql/upgrade_8.03.00.sql
mysql -uroot -proot redcap < redcap/redcap_v${redcap_version}/redcap/redcap_v${redcap_version}/Resources/sql/upgrade_8.03.01.sql
mysql -uroot -proot redcap < redcap/redcap_v${redcap_version}/redcap/redcap_v${redcap_version}/Resources/sql/upgrade_8.03.02.sql
mysql -uroot -proot redcap < redcap/redcap_v${redcap_version}/redcap/redcap_v${redcap_version}/Resources/sql/upgrade_8.04.00.sql
mysql -uroot -proot redcap < redcap/redcap_v${redcap_version}/redcap/redcap_v${redcap_version}/Resources/sql/upgrade_8.04.04.sql
mysql -uroot -proot redcap < redcap/redcap_v${redcap_version}/redcap/redcap_v${redcap_version}/Resources/sql/upgrade_8.05.00.sql
mysql -uroot -proot redcap < redcap/redcap_v${redcap_version}/redcap/redcap_v${redcap_version}/Resources/sql/upgrade_8.05.01.sql
mysql -uroot -proot redcap < redcap/redcap_v${redcap_version}/redcap/redcap_v${redcap_version}/Resources/sql/upgrade_8.05.02.sql
mysql -uroot -proot redcap < redcap/redcap_v${redcap_version}/redcap/redcap_v${redcap_version}/Resources/sql/upgrade_8.05.05.sql

mysql -uroot -proot redcap -e "UPDATE redcap_config SET value = '${redcap_version}' WHERE field_name = 'redcap_version'"
mysql -uroot -proot redcap -e "UPDATE redcap_config SET value = '/share/edocs/' WHERE field_name = 'edoc_path'"

cd docker_redcap_fresh
sudo docker-compose up -d --build --force-recreate