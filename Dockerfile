FROM ruby:2.6.2

RUN apt-get update -qq && apt-get install -y build-essential libpq-dev
RUN curl -sL https://deb.nodesource.com/setup_10.x | bash - \
        && apt-get install -y nodejs

RUN gem install bundler
RUN mkdir /test-backend
WORKDIR /test-backend

COPY Gemfile /test-backend/Gemfile
COPY Gemfile.lock /test-backend/Gemfile.lock

RUN bundle install

COPY . /test-backend
