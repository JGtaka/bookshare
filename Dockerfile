#Docker Hubからruby:3.1.4のイメージをプルする
FROM ruby:3.1.4

#debian系のためapt-getを使用してnode.jsとyarnをインストール
RUN apt-get update -qq
RUN curl -fsSL https://deb.nodesource.com/setup_lts.x | bash - \
&& apt-get install -y nodejs
RUN npm install --global yarn

ENV BUNDLE_PATH=/bookshare/vendor/bundle
ENV BUNDLE_BIN=/bookshare/vendor/bundle/bin
ENV GEM_HOME=/bookshare/vendor/bundle
ENV PATH=/bookshare/vendor/bundle/bin:$PATH

#docker内の作業ディレクトリを作成＆設定
WORKDIR /bookshare

#Gemfile,Gemfile.lockをローカルからCOPY
COPY Gemfile Gemfile.lock /bookshare/

#コンテナ内にコピーしたGemfileを用いてbundle install
RUN bundle install


#railsを起動する
CMD ["bundle", "exec","rails", "server", "-b", "0.0.0.0"]