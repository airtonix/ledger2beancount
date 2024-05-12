FROM ubuntu:18.04 as base

RUN apt-get update -y \
  && apt-get install --yes git

RUN apt-get install --yes \
  build-essential \
  gcc-multilib \
  apt-utils \
  perl \
  expat \
  libexpat-dev \
  locales \
  cpanminus \
  && apt-get clean && rm -rf /tmp/* /var/tmp/*


FROM base as final

COPY docker-entrypoint.bash /docker-entrypoint.bash
RUN chmod +x /docker-entrypoint.bash

COPY . /opt/ledger2beancount

WORKDIR /opt/ledger2beancount

#-------------------------
# Install app dependencies
RUN cpanm --installdeps .

#--------------------------
# Set environment variables
#   Fix Perl warnings
ENV PATH="/usr/bin/perl:$PATH"
RUN locale-gen "en_US.UTF-8"
RUN update-locale "LANG=en_US.UTF-8"

#-------------------------------------
# Set default script and arguments
#   This can be overridden at runtime
ENTRYPOINT [ "/docker-entrypoint.bash" ]
