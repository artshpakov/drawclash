FROM ruby:2.2.0

RUN \
    apt-get update -qq && \
    apt-get install -y build-essential nodejs npm libpq-dev

ENV BUNDLE_PATH /bundle

WORKDIR /drawclash
ADD . /drawclash
RUN bundle install
