FROM ruby:2.7.1

RUN apt-get update -qq && apt-get install -y nodejs

RUN mkdir -p /api

WORKDIR /api
ADD Gemfile /api/Gemfile
ADD Gemfile.lock /api/Gemfile.lock
COPY . /api

RUN bundle install

# Add a script to be executed every time the container starts.
COPY docker-entrypoint.sh docker-entrypoint.sh
RUN chmod +x docker-entrypoint.sh
ENTRYPOINT ["/api/docker-entrypoint.sh"]

EXPOSE 3000

# Configure the main process to run when running the image
CMD ["rails", "server", "-b", "0.0.0.0"]
