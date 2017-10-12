FROM composer:latest
RUN composer global require silverstripe/vendor-plugin-helper

RUN mkdir -p ~/.ssh
RUN chmod 0700 ~/.ssh
RUN ssh-keyscan github.com >> ~/.ssh/known_hosts
RUN ssh-keyscan bitbucket.org >> ~/.ssh/known_hosts
RUN ssh-keyscan code.platform.silverstripe.com >> ~/.ssh/known_hosts

COPY docker-entrypoint.sh /docker-entrypoint.sh

ENTRYPOINT ["/docker-entrypoint.sh"]
