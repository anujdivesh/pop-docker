FROM tomcat:8.5-jre8
MAINTAINER Anuj Divesh <divesha@spc.int>

ENV THREDDS_XMX_SIZE 4G
ENV THREDDS_XMS_SIZE 4G
ENV NCWMS_WAR_URL https://github.com/Reading-eScience-Centre/ncwms/releases/download/ncwms-2.2.9/ncWMS2.war



COPY files/tomcat-users.xml ${CATALINA_HOME}/conf/tomcat-users.xml
COPY files/setenv.sh ${CATALINA_HOME}/bin/setenv.sh
COPY files/javaopts.sh ${CATALINA_HOME}/bin/javaopts.sh

# Install necessary packages
RUN apt-get update && \
    apt-get install -y --no-install-recommends  vim build-essential m4 \
        libpthread-stubs0-dev libcurl4-openssl-dev gosu zip unzip nano && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/* && \

    # thredds
    curl -fSL "${NCWMS_WAR_URL}" -o ncWMS.war && \
    unzip ncWMS.war -d ${CATALINA_HOME}/webapps/ncWMS/ && \
    rm -f ncWMS.war && \
    mkdir -p ${CATALINA_HOME}/content/ncWMS && \
    chmod 755 ${CATALINA_HOME}/bin/*.sh && \
    mkdir -p ${CATALINA_HOME}/javaUtilPrefs/.systemPrefs

ARG RUN_USER=tomcat
ARG RUN_GROUP=tomcat
RUN groupadd -r ${RUN_GROUP} && \
    useradd -g ${RUN_GROUP} -d ${CATALINA_HOME} -s /bin/bash ${RUN_USER} && \
    chown -R tomcat:tomcat $CATALINA_HOME && \
    mkdir -p /usr/local/tomcat/.ncWMS2 && \
    chown tomcat:tomcat /usr/local/tomcat/.ncWMS2
USER ${RUN_USER}

EXPOSE 8080 8443

WORKDIR ${CATALINA_HOME}

# Inherited from parent container
#ENTRYPOINT ["/entrypoint.sh"]

# Start container
CMD ["catalina.sh", "run"]

HEALTHCHECK --interval=10s --timeout=3s \
	CMD curl --fail 'http://localhost:8080/ncWMS' || exit 1
