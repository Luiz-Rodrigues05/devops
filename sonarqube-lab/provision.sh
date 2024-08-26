#/usr/bin/bash

useradd sonar
sudo apt update && sudo apt upgrade -y
sudo apt install -y unzip openjdk-17-jdk
wget https://binaries.sonarsource.com/Distribution/sonarqube/sonarqube-10.6.0.92116.zip
unzip sonarqube-10.6.0.92116.zip -d /opt/
mv /opt/sonarqube-10.6.0.92116 /opt/sonarqube
chown -R sonar:sonar /opt/sonarqube
echo > /etc/systemd/system/sonar.service
cat <<EOT > /etc/systemd/system/sonar.service
[Unit]
Description=SonarQube service
After=syslog.target network.target
[Service]
Type=forking
ExecStart=/opt/sonarqube/bin/linux-x86-64/sonar.sh start
ExecStop=/opt/sonarqube/bin/linux-x86-64/sonar.sh stop
User=sonar
Group=sonar
Restart=always
[Install]
WantedBy=multi-user.target
EOT
service sonar start

sqp_639af0b51a5f47905be2206890633df99a97c4e9

#instalar  sonar scanner
wget https://binaries.sonarsource.com/Distribution/sonar-scanner-cli/sonar-scanner-cli-6.1.0.4477-linux-x64.zip
unzip sonar-scanner-cli-6.1.0.4477-linux-x64.zip -d /opt/
mv /opt/sonar-scanner-6.1.0.4477-linux-x64 /opt/sonar-scanner
chown -R sonar:sonar /opt/sonar-scanner/
echo 'export PATH=$PATH:/opt/sonar-scanner/bin' | sudo tee -a /etc/profile
sudo apt install -y nodejs npm
