FROM ruby:2.3-alpine

COPY . /app

WORKDIR /app

RUN apk add --no-cache --virtual .builddeps \
    build-base \
  && apk add --no-cache --virtual .rundeps \
    nodejs \
    tzdata \
  && bundle install --without development test \
  && rake assets:precompile \
  && chown -R daemon:daemon /app \
  && apk del .builddeps

ENTRYPOINT ["/app/bin/entrypoint.sh"]

EXPOSE 3000

CMD ["rails", "server", "-b", "0.0.0.0", "-p", "3000"]
