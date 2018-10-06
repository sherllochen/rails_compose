FROM ruby:2.5

RUN bundle config mirror.https://rubygems.org https://gems.ruby-china.com

RUN mv /etc/apt/sources.list /etc/apt/sources.list.orig \
&& echo "deb http://mirrors.aliyun.com/debian/ stretch main non-free contrib" >> /etc/apt/sources.list \
&& echo "deb http://mirrors.aliyun.com/debian/ stretch-proposed-updates main non-free contrib" >> /etc/apt/sources.list \
&& echo "deb http://mirrors.aliyun.com/debian/ stretch-updates main non-free contrib" >> /etc/apt/sources.list \
&& echo "deb-src http://mirrors.aliyun.com/debian/ stretch main non-free contrib" >> /etc/apt/sources.list \
&& echo "deb-src http://mirrors.aliyun.com/debian/ stretch-proposed-updates main non-free contrib" >> /etc/apt/sources.list \
&& echo "deb-src http://mirrors.aliyun.com/debian/ stretch-updates main non-free contrib" >> /etc/apt/sources.list \
&& echo "deb http://mirrors.aliyun.com/debian-security/ stretch/updates main non-free contrib" >> /etc/apt/sources.list \
&& echo "deb-src http://mirrors.aliyun.com/debian-security/ stretch/updates main non-free contrib" >> /etc/apt/sources.list

RUN apt-get update && apt-get install -y nodejs git-core curl zlib1g-dev build-essential libssl-dev \
 libreadline-dev libyaml-dev libsqlite3-dev sqlite3 libxml2-dev libxslt1-dev libcurl4-openssl-dev \
 software-properties-common libffi-dev mysql-client default-libmysqlclient-dev --no-install-recommends \
 && rm -rf /var/lib/apt/lists/*

RUN mkdir /app

WORKDIR /app

COPY Gemfile Gemfile.lock /app/

RUN bundle install --binstubs

COPY . .

EXPOSE 3000

LABEL maintainer="Sherllo Chen <sherllochen@gmail.com>"

CMD ["rails","server","-p","3000"]
