FROM timhaak/base:latest
MAINTAINER tim@haak.co.uk

COPY ./plexupdate.sh /
COPY ./.plexupdate /root/.plexupdate

RUN /bin/bash /plexupdate.sh

VOLUME ["/config","/data"]

ADD ./start.sh /start.sh
RUN chmod u+x  /start.sh

ADD ./supervisord.conf /etc/supervisor/conf.d/supervisord.conf

ENV RUN_AS_ROOT="true" \
    CHANGE_DIR_RIGHTS="false"

EXPOSE 32400

CMD ["/start.sh"]
