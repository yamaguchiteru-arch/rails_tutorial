FROM ruby:3.2.10
ENV APP /app
ENV LANG C.UTF-8
ENV TZ Asia/Tokyo
RUN curl -fsSL https://deb.nodesource.com/setup_lts.x | bash -
RUN apt update -qq \
 && apt install -y build-essential mariadb-client nodejs \
 && npm install --global yarn
RUN yarn add @fortawesome/fontawesome-free @fortawesome/fontawesome-svg-core @fortawesome/free-brands-svg-icons @fortawesome/free-regular-svg-icons @fortawesome/free-solid-svg-icons
WORKDIR $APP
COPY Gemfile $APP/Gemfile
COPY Gemfile.lock $APP/Gemfile.lock
RUN bundle install
ADD . $APP
CMD ["sh", "-c", "rm -f /app/tmp/pids/server.pid && bundle exec rails s -p ${PORT:-3000} -b 0.0.0.0"]