FROM nginx:stable-alpine

RUN chmod 777 -R /usr/share/nginx/html

EXPOSE 80

CMD ["nginx", "-g", "daemon off;"]