FROM		phusion/baseimage:0.10.0
MAINTAINER	lawrencezhu2018@outlook.com

ENV		SEAFILE_VERSION=6.3.13
ENV		ADMIN=admin@seafile.local
ENV		ADMIN_PW=admin123
ENV		WORK_DIR=/seafile

WORKDIR		${WORK_DIR}

ADD		seafile-pro-server_${SEAFILE_VERSION}_x86-64.tar.gz ${WORK_DIR}
COPY		bin    			 ${WORK_DIR}/bin
COPY		service        		 /etc/service
COPY 		config/seafevents.conf   ${WORK_DIR}/pro-data/seafevents.conf

RUN		cd ${WORK_DIR}/bin && \        
                chmod +x ${WORK_DIR}/bin/* && \
		chmod +x /etc/service/**/*   && \
 		mv setup.sh /etc/my_init.d/  && \
                ./prepare.sh

CMD		["/sbin/my_init"]
