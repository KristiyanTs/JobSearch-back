FROM ruby:2.6.1
WORKDIR /srv/application
ADD Gemfile* /srv/application/
RUN bundle install
ADD . .
CMD bundle exec rake db:migrate && rails s -e production