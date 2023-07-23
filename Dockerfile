#On choisit une debian
FROM debian:12

MAINTAINER Danielw "daniel.wachnik@gmail.com"

#Ne pas poser de question à l'installation
ENV DEBIAN_FRONTEND noninteractive

#Installation d'apache et de php7.3 avec extension
RUN apt update \
&& apt install --yes --no-install-recommends \
apt-utils \
apache2 \
apache2-utils \
php8.2 \
php8.2-mysql \
php8.2-ldap \
php8.2-xmlrpc \
php8.2-imap \
curl \
php8.2-curl \
php8.2-gd \
php8.2-mbstring \
php8.2-xml \
php8.2-apcu \
php-cas \
php8.2-intl \
php8.2-zip \
php8.2-bz2 \
cron \
wget \
ca-certificates \
jq \
&& rm -rf /var/lib/apt/lists/*

#Copie et execution du script pour l'installation et l'initialisation de GLPI
COPY glpi-start.sh glpi-install.sh /opt/
RUN chmod +x /opt/glpi-start.sh /opt/glpi-install.sh
RUN bash /opt/glpi-install.sh
ENTRYPOINT ["/opt/glpi-start.sh"]

#Exposition des ports
EXPOSE 80
