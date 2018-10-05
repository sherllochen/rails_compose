FROM ruby:2.5
RUN apt-get update -qq && apt-get install -y build-essential nodejs
RUN bundle config mirror.https://rubygems.org https://gems.ruby-china.com
RUN mkdir /app
WORKDIR /app
COPY Gemfile Gemfile.lock /app/
RUN bundle install
COPY . /app
EXPOSE 3000