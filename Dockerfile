#Download base image ubuntu 16.04 - https://www.rosehosting.com/blog/how-to-install-nginx-on-ubuntu-16-04/
FROM ubuntu:16.04

RUN apt -y update && apt -y upgrade

RUN apt install -y ansible nginx

#RUN ufw allow 'Nginx Full'
RUN mkdir -p /var/www/example.com && /etc/init.d/nginx start

COPY index.html /var/www/example.com/

COPY example.com.conf /etc/nginx/sites-available/

RUN ln -s /etc/nginx/sites-available/example.com.conf /etc/nginx/sites-enabled/example.com.conf 

EXPOSE 80

#ENTRYPOINT nginx -t && systemctl restart nginx
CMD ["nginx", "-g", "daemon off;"]
#https://github.com/nginxinc/docker-nginx/blob/d3d1bcf9227e28e6ccc421090462faa98d5c62b4/Dockerfile
