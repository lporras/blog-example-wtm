// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require chosen-jquery
//= require jquery_ujs
//= require bootstrap-sprockets
//= require parsley
//= require turbolinks
//= require_tree .

Turbolinks.enableProgressBar();

$(document).on('ready page:load', function () {

    $('.chosen-select').chosen({
        allow_single_deselect: true,
        no_results_text: 'No results matched'
    });

    $('form').parsley({
        uiEnabled: true,
        trigger: "blur",
        //successClass: 'has-success',
        errorClass: 'has-error',
        classHandler: function (ParsleyField) {
            return ParsleyField.$element.parents(".form-group");
        },
        errorsContainer: function (ParsleyField) {
            return ParsleyField.$element.parents(".form-group");
        },
        errorsWrapper: '<div class="parsley-errors-list"></div>',
        errorTemplate: '<span class="help-block"></span>'
    });
});