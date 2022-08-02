FROM ruby:2.7.1-alpine

RUN apk add --update \
    postgresql-dev \
    tzdata \
    nodejs

RUN apk add --update build-base

RUN mkdir -p /api

WORKDIR /api
ADD Gemfile /api/Gemfile
ADD Gemfile.lock /api/Gemfile.lock
COPY . /api

RUN bundle install

COPY docker-entrypoint.sh docker-entrypoint.sh
RUN chmod +x docker-entrypoint.sh
CMD ["sh", "docker-entrypoint.sh"]

EXPOSE 3000
