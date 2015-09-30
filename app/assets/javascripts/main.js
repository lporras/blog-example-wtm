var main = function (argument) {

    var $alert = $(".alert");

    var hideAlert = function () {
        $alert.alert('close');
    };

    setTimeout(hideAlert, 2000);

    $(".chosen-select").chosen();

};

$(document).on('ready page:load', main);