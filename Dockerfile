FROM ruby:latest

RUN apt-get update && apt-get install -y nodejs sqlite3 --no-install-recommends && rm -rf /var/lib/apt/lists/*

WORKDIR /usr/src/WmslWorldCup

COPY Gemfile* ./

RUN bundle install

COPY . .

RUN rake db:create

RUN rake db:migrate

RUN rake db:seed

EXPOSE 3000

CMD ["rails", "server"]
