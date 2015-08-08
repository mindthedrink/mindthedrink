var requirejs = {
    paths: {
        // directories
        lib: 'app/assets/javascripts/lib',
        modules: 'app/assets/javascripts/modules',
        // modules
        jquery: 'vendor/assets/bower_components/jquery/dist/jquery',
        lodash: 'vendor/assets/bower_components/lodash-amd/modern',
        enquire: 'vendor/assets/bower_components/enquire/dist/enquire',
        picturefill: 'vendor/assets/bower_components/picturefill/dist/picturefill',
        fastclick: 'vendor/assets/bower_components/fastclick/lib/fastclick',
        events: 'vendor/assets/bower_components/backbone-events-standalone/backbone-events-standalone',
        text: 'vendor/assets/bower_components/requirejs-text/text',
        easie: 'vendor/assets/bower_components/jquery.easie.js/js/jquery.easie',
        handlebars: 'vendor/assets/bower_components/handlebars/handlebars.runtime',
        placeholdr: 'vendor/assets/bower_components/placeholdr/placeholdr',
        matchMedia: 'vendor/assets/bower_components/matchMedia/matchMedia',
        matchMediaAddListener: 'vendor/assets/bower_components/matchMedia/matchMedia.addListener',
        imagesloaded: 'vendor/assets/bower_components/imagesloaded/imagesloaded',
        'eventie/eventie': 'vendor/assets/bower_components/eventie/eventie',
        'eventEmitter/EventEmitter': 'vendor/assets/bower_components/eventEmitter/EventEmitter',
        'outlayer/outlayer': 'vendor/assets/bower_components/outlayer/outlayer',
        'outlayer/item': 'vendor/assets/bower_components/outlayer/item',
        'get-size/get-size': 'vendor/assets/bower_components/get-size/get-size',
        'doc-ready/doc-ready': 'vendor/assets/bower_components/doc-ready/doc-ready',
        'get-style-property/get-style-property': 'vendor/assets/bower_components/get-style-property/get-style-property',
        'matches-selector/matches-selector': 'vendor/assets/bower_components/matches-selector/matches-selector',
    },
    shim: {
        easie: {
            deps: [
                'jquery'
            ]
        },
        enquire: {
            deps: [
                'matchMedia',
                'matchMediaAddListener'
            ]
        },
        matchMediaAddListener: {
            deps: [
                'matchMedia'
            ]
        }
    }
};
