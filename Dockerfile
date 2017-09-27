FROM nginx
COPY dist /usr/share/nginx/html
RUN apt-get update -y && apt-get install iputils-ping -y
EXPOSE 4242
