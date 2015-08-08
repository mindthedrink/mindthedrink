require([
    'jquery',
    'picturefill',
    'fastclick',
    'placeholdr',
], function(
    $,
    PictureFill,
    FastClick,
    Placeholdr
) {

    'use strict';

    var App = {
        components: [
            // future list of components
        ],
        init: function init() {
            var i;
            var j;

            console.log('Hello World!');

            for (i = 0, j = this.components.length; i < j; i++) {
                console.log('Initialising component: ', this.components[i].id);

                if (this.components[i].init !== undefined) {
                    this.components[i].init();
                }
            }

            // NOTE: init global components

            FastClick.attach(document.body);

            return this;
        }
    };

    $(document).ready(App.init.bind(App));

});
