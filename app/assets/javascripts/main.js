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

};

$(document).on('ready page:load', main);