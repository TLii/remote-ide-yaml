# This image is used to run PHP IDEs (e.g. PhpStorm) in a containerized environment.
# Included: PHP, Composer, Helm, Docker CLI, SSH server, xdebug, phpunit

FROM tliin/debian-ide-base:latest
ARG node_major=18
USER root
# Install PHP
RUN apt-get install --no-install-recommends -y \
    python3 \
    python3-yaml


## SETUP ADDITIONAL TOOLS ##

# Install node.js
RUN curl -fsSL https://deb.nodesource.com/setup_${node_major}.x | bash -

# Run apt install
RUN apt-get update && apt-get install -y --no-install-recommends \
    helm \
    kubectl \
    nodejs

# Run npm installer
RUN npm install yamllint;

USER 1000