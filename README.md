# Dockerfile_project
##### Install Docker #####

sudo apt-get update

sudo apt-get install docker.io


###### Once you have done with the above steps, then run following command  #####

systemctl enable docker

sytemctl start docker 

##### STEPS TO RUN THIS PROJECT ######

##### Clone above project using following command: ######

git clone https://github.com/madan03/Dockerfile_project.git

#####  Go to the project Directory ######

cd Dockerfile_project

##### Create docker images using following CMD: #####

docker build -f Dockerfile -t mytest .


##### Now tun above created images using following CMD #####

docker run -itd -p 80:80 --name=devops mytest





