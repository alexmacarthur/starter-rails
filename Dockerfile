FROM ruby:3.0
RUN apt-get update && apt-get install sudo postgresql-client -y
RUN curl -sL https://deb.nodesource.com/setup_16.x | bash -
RUN sudo apt-get install -y nodejs
RUN npm install yarn -g
RUN gem install rails

WORKDIR /starter-rails
COPY Gemfile /starter-rails/Gemfile
COPY Gemfile.lock /starter-rails/Gemfile.lock
RUN bundle install

EXPOSE 3000

CMD ["rails", "server", "-b", "0.0.0.0"]
