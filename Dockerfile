FROM ruby:2.7.1

RUN apt-get update -qq && apt-get install -y nodejs

RUN mkdir -p /api

WORKDIR /api
ADD Gemfile /api/Gemfile
ADD Gemfile.lock /api/Gemfile.lock
COPY . /api

RUN bundle install

COPY docker-entrypoint.sh docker-entrypoint.sh
RUN chmod +x docker-entrypoint.sh
ENTRYPOINT ["/api/docker-entrypoint.sh"]

EXPOSE 3000
