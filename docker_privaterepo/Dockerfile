FROM library/centos

RUN yum install -y git 

ARG HOME_DIR
ARG USER_ID

ENV USER_ID=${USER_ID}

RUN echo "Setting up user $USER_ID with home directory: $HOME_DIR" \
      && useradd \
            --home-dir ${HOME_DIR} \
            --uid 1000 \
            $USER_DIR ${USER_ID} \ 
      && touch ${HOME_DIR}/entrypoint.sh \ 
      && mkdir -p ${HOME_DIR}/.ssh/ \
      && chown -R ${USER_ID}:${USER_ID} ${HOME_DIR} \
      && chmod -R 700 ${HOME_DIR}/.ssh \
      && touch ${HOME_DIR}/.ssh/id_rsa \
      && chmod 400 ${HOME_DIR}/.ssh/id_rsa \
      && chmod 777 ${HOME_DIR}/entrypoint.sh

ENTRYPOINT ${HOME_DIR}/entrypoint.sh
