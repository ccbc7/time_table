FROM ruby:3.1.2

ENV APP_NAME=time_table
ENV USER_NAME=myuser
ENV TZ=Asia/Tokyo

WORKDIR /${APP_NAME}

COPY Gemfile /${APP_NAME}/Gemfile
COPY Gemfile.lock /${APP_NAME}/Gemfile.lock
RUN bundle install

COPY . /${APP_NAME}

RUN adduser ${USER_NAME} && \
  chown -R ${USER_NAME} /${APP_NAME} && \
  chown -R ${USER_NAME} ${GEM_HOME}
USER ${USER_NAME}

EXPOSE 3000

CMD ["rails", "server", "-b", "0.0.0.0"]
