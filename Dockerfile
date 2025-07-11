# Use official Nginx image
FROM nginx:alpine

# Copy our HTML file into Nginx’s default site directory
COPY ./index.html /usr/share/nginx/html/index.html

# Expose port 80
# EXPOSE 80
