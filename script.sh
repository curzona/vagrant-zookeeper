apt-get -y update
apt-get -y install vim curl nmap tree zip htop upstart 
apt-get -y install openjdk-7-jre-headless

cat << EOF >> /etc/apt/sources.list.d/cloudera.list
deb [arch=amd64] http://archive.cloudera.com/cdh4/ubuntu/precise/amd64/cdh precise-cdh4 contrib 
deb-src http://archive.cloudera.com/cdh4/ubuntu/precise/amd64/cdh precise-cdh4 contrib
EOF

curl -s http://archive.cloudera.com/cdh4/ubuntu/precise/amd64/cdh/archive.key | sudo apt-key add -
apt-get -y update

apt-get -y install zookeeper-server

service zookeeper-server init --myid=1
service zookeeper-server start

apt-get -y install python-pip
pip install kazoo