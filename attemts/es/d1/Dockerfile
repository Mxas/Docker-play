FROM elasticsearch:5.6.8

MAINTAINER MK

COPY elasticsearch.yml /usr/share/elasticsearch/config/elasticsearch.yml

VOLUME /data

RUN curl -sL --retry 3 "https://github.com/lmenezes/cerebro/releases/download/v0.7.3/cerebro-0.7.3.tgz" > /usr/share/cerebro.tgz

RUN tar xvfz /usr/share/cerebro.tgz -C /usr/share/ 

RUN mv /usr/share/cerebro-0.7.3 /usr/share/cerebro

COPY application.conf /usr/share/cerebro/conf/application.conf

VOLUME /data

EXPOSE 9200 9300 9000

CMD ["/usr/share/cerebro/bin/cerebro"]
