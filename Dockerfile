FROM nginx:1.13.5-alpine
#FROM nginx

# Remove default nginx website
RUN rm -rf /usr/share/nginx/html/*

# Copy dist folder to default nginx public folder
COPY ./dist /usr/share/nginx/html

# Copy nginx configuration file
COPY ./default.conf /etc/nginx/conf.d/default.conf

# Run nginx
CMD ["nginx", "-g", "daemon off;"]

# Expost Port
EXPOSE 4242
