##### standalone deployment
sudo wget -O /usr/share/keyrings/jenkins-keyring.asc https://pkg.jenkins.io/debian-stable/jenkins.io-2023.key
echo "deb [signed-by=/usr/share/keyrings/jenkins-keyring.asc]" https://pkg.jenkins.io/debian-stable binary/ | sudo tee \
/etc/apt/sources.list.d/jenkins.list > /dev/null

sudo apt update
sudo apt install default-jdk -y
sudo apt install jenkins -y
sudo systemctl start jenkins
sudo ufw allow 8080
sudo ufw enable

# Go to jenkins-host:8080
#Get initial password below:
sudo cat /var/lib/jenkins/secrets/initialAdminPassword
#Install recommended plugins

sudo adduser jenkinsuser
sudo usermod -aG sudo jenkinsuser
cd mkdir -p $1/.ssh
mkdir -p /home/jenkinsuser/.ssh
cd /home/jenkinsuser/.ssh
ssh-keygen -b 4096 -t rsa -f /home/jenkinsuser/.ssh/id_rsa -N thisismycert
cat /home/jenkinsuser/.ssh/id_rsa.pub 

################ container (Docker) deployment
# Docker CE
sudo apt update
sudo apt install apt-transport-https ca-certificates curl software-properties-common git-all gh -y
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg
echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
sudo apt update
sudo apt-cache policy docker-ce
sudo apt install docker-ce -y
sudo systemctl status docker
sudo usermod -aG docker ${USER}
su - ${USER}
# Docker compose
sudo apt-get install docker-compose-plugin -y
docker compose version
#Jenkins https://github.com/vdespa/install-jenkins-docker
git clone https://github.com/vdespa/install-jenkins-docker.git
cd install-jenkins-docker
docker build -t my-jenkins .
docker compose up -d            # starts all containers including Jenkins
docker exec my-jenkins cat /var/jenkins_home/secrets/initialAdminPassword
#access http://hostname:8080 and provide password obtained above or below
# could have also used docker exec -it my-jenkins sh; cat /var/jenkins_home/secrets/initialAdminPassword; exit
docker compose down  #stops all containers including Jenkins
docker compose down --volumes --rmi all # deletes all containers including Jenkins
