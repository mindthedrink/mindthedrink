# Mind The Drink

WiP

## Status

[![Code Climate](https://codeclimate.com/github/mindthedrink/mindthedrink_app.png)](https://codeclimate.com/github/mindthedrink/mindthedrink_app)

## Project Goal

a Web app where you can keep track of your **cocktail cabinet**, check what **cocktails and drinks** can you prepare with it, and discover new **suggestions** that you are almost prepared to make, just with a few more components.

## Project Scope

in the [project wiki](https://github.com/mindthedrink/mindthedrink_app/wiki)



## Setup and Development


### Mac OS X

install packages (with homebrew)

    brew install node
    brew install postgres
    brew install imagemagick
    brew install phantomjs
    brew install redis

bower and grunt

    npm install -g bower
    npm install -g grunt-cli

### Postgres
after installing postgres 9.4, ensure that the `mindthedrink` user exists and can create databases.

     createuser -d mindthedrink

execute the following sql (needed for extension migrations):

    ALTER USER mindthedrink WITH SUPERUSER


## Development process

1. `npm install && bower install`
2. `rails s`
3. `grunt`

## If tests fail

It may be that the UI is using a new bower component, or a similar change that will provoke an error if not updated.

1. `npm install`
2. `bower cache clean --allow-root && bower install --allow-root`
3. `rake spec` (try tests again)


## Assets development

- `guard` => rspec, livereload
- `grunt` => lint, compilation, svg, application.js generation, modernizr

### Icons:

- svg => icon_%{type}.svg file
- in rails, use the icons/icon partial.
- grunt (via svgstore task) will do its stuff)
- icon_helper.rb -> add it to the map with the dimensions (get in the svg the viewBox numbers)

### JS:

- almond is a mini version of requirejs.
- if we want to add complex stuff using requirejs (to control it, use it async, wait until that stuff is loaded...) => change almond for require.js + add it to require.js config (currently it's referencing local files, it can reference URLs)

### install another bower component:
use: `bower install --save konami.js` (--save is for adding it to bower.json (kind of like a Gemfile.lock))
(note: you can also modify directly bower.json)

`bower update --save` => update to newer versions and write the updates into bower.json
`bower install` -> update to whatever bower.json


### new node dependency

add a new node dependency => it will all be 'dev' dependency because we only use node in dev:
`npm install --save-dev grunt-uncss`

