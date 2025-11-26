#####################################################################
#                                                                   #
# Script:  Dockerfile                                               #
#                                                                   #
# Purpose: Docker image definition for nova-proxy                   #
#                                                                   #
# Date:    20th November 2025                                       #
#                                                                   #
# Author:  nova admin <admin@nova.eco>                              #
#                                                                   #
#####################################################################

FROM nginx:latest
RUN rm -f /etc/nginx/conf.d/default.conf
COPY ./nginx.conf /etc/nginx/conf.d/default.conf
