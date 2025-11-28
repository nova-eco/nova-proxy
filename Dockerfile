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

ARG NOVA_PROXY_AUTHOR
ARG NOVA_PROXY_NAME
ARG NOVA_PROXY_PORT

LABEL authors=${NOVA_PROXY_AUTHOR}
LABEL name=${NOVA_PROXY_NAME}

RUN rm -f /etc/nginx/conf.d/default.conf
COPY ./nginx.conf /etc/nginx/conf.d/default.conf

EXPOSE ${NOVA_PROXY_PORT}

CMD ["nginx", "-g", "daemon off;"]
