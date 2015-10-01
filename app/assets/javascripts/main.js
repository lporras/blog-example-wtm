var addAlert = function (message, alertType) {
    var $flashes = $("#flashes-zone");
    var $alertContainer = $("<div class='alert alert-" + alertType + " alert-dismissible fade in' role='alert'></div>");
    var $closeButton = $('<button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">×</span></button>');
    var $span = $("<span>"+ message + "</span>");

    $alertContainer.append($closeButton);
    $alertContainer.append($span);

    $flashes.append($alertContainer);
};

var main = function (event) {
    var $alert = $(".alert");
    var hideAlert = function () {
        $alert.alert('close');
    };
    setTimeout(hideAlert, 2000);
    $(".chosen-select").chosen();

    /*
    $form = $("form.edit_post");

    $form.submit(function () {
        var isValid = true;

        var $title = $form.find("input[type='text']#post_title")

        if ($title.val() === "") {
            var $formGroup = $title.parents(".form-group");
            $formGroup.addClass("has-error");
            $formGroup.append("<span class='help-block'>no puede estar en blanco</span>");
            isValid = false;
        }

        return isValid;
    });
    */

    $("form").parsley({
        uiEnabled: true,
        errorClass: 'has-error',
        classHandler: function (ParsleyField) {
            return ParsleyField.$element.parents(".form-group");
        },
        errorsContainer: function (ParsleyField) {
            return ParsleyField.$element.parents(".form-group");
        },
        errorTemplate: '<span class="help-block"></span>'
    });
};

$(document).on('ready page:load', main);











