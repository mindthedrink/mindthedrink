# Mind The Drink

WiP

## Status

[![Code Climate](https://codeclimate.com/github/mindthedrink/mindthedrink_app.png)](https://codeclimate.com/github/mindthedrink/mindthedrink_app)

## Setup

### Mac OS X

install packages (with homebrew)

    brew install postgres
    brew install imagemagick
    brew install phantomjs
    brew install redis

### Postgres
after installing postgres 9.4, ensure that the `mindthedrink` user exists and can create databases.

     createuser -d mindthedrink

execute the following sql (needed for extension migrations):

    ALTER USER mindthedrink WITH SUPERUSER


## Project Goal

a Web app where you can keep track of your **cocktail cabinet**, check what **cocktails and drinks** can you prepare with it, and discover new **suggestions** that you are almost prepared to make, just with a few more components.

## Project Scope

in the [project wiki](https://github.com/mindthedrink/mindthedrink_app/wiki)


