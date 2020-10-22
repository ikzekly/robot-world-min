ARG RUBY_VERSION
FROM ruby:$RUBY_VERSION-slim-buster

RUN apt-get update -qq \
  && apt-get install -yq --no-install-recommends \
    build-essential \
    gnupg2 \
    curl \
    git \
    vim \
  && apt-get clean \
  && rm -rf /var/cache/apt/archives/* \
  && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/* \
  && truncate -s 0 /var/log/*log

RUN curl -sSL https://www.postgresql.org/media/keys/ACCC4CF8.asc | apt-key add - \
  && echo 'deb http://apt.postgresql.org/pub/repos/apt/ buster-pgdg main' $PG_MAJOR > /etc/apt/sources.list.d/pgdg.list

ARG PG_MAJOR
RUN apt-get update -qq \
  && apt-get install -yq --no-install-recommends \  
    libpq-dev \
    postgresql-client-$PG_MAJOR \
  && apt-get clean \
  && rm -rf /var/cache/apt/archives/* \
  && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/* \
  && truncate -s 0 /var/log/*log

ENV APP_HOME=/app
RUN mkdir $APP_HOME
WORKDIR $APP_HOME

ENV BUNDLE_GEMFILE=$APP_HOME/Gemfile \
    BUNDLE_PATH=$APP_HOME/vendor/bundle \
    BUNDLE_JOBS=12 \
    BUNDLE_RETRY=3 \
    LANG=C.UTF-8

ARG BUNDLER_VERSION
RUN gem update --system && \
    gem install bundler:$BUNDLER_VERSION

COPY . $APP_HOME
