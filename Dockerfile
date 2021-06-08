FROM ubuntu:latest
 
# Identify the maintainer of an image
LABEL maintainer="mumzyhydra@gmail.com"

#setup a timezone
ENV TZ=Europe/Kiev

# Update the image to the latest packages
RUN apt-get update && apt-get upgrade -y && echo 

RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone

# Install nodejs and npm
RUN apt-get install nodejs npm -y

RUN apt install git-all -y

RUN mkdir /home/ubuntu

RUN mkdir /home/ubuntu/app_dir

WORKDIR /home/ubuntu/app_dir
#clone the Sample repo
RUN git clone -b master https://github.com/Meamzy/Sample_app_demo3_cicd.git

WORKDIR /home/ubuntu/app_dir/Sample_app_demo3_cicd

RUN npm install express express-fileupload body-parser mysql ejs req-flash --save

RUN npm install nodemon -g 

EXPOSE 80

EXPOSE 3306

EXPOSE 2000

CMD npm run start