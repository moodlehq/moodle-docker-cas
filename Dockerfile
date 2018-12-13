FROM apereo/cas:v5.2.2

COPY ./pom.xml /cas-overlay/pom.xml
RUN /cas-overlay/build.sh package

COPY ./run.sh /cas-overlay/run.sh
COPY ./etc/cas /cas-overlay/etc/cas

ENV CN="localhost"
ENV DNAME="CN=$CN,O=Moodle,L=Perth,S=WA,C=AU"
ENV CERT_SUBJ_ALT_NAMES="ip:127.0.0.1"

CMD [ "run.sh" ]
