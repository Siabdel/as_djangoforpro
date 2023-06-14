FROM nginx:1.21-alpine

#Removing intermediate container 
RUN set -eux
#
RUN apk update && apk  upgrade 
RUN apk add bash vim 

#crearte user django
RUN addgroup --system django 
#RUN adduser --system --no-create-home --group django


RUN rm /etc/nginx/conf.d/default.conf
COPY nginx.conf /etc/nginx/conf.d