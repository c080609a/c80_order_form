// Содержит функцию, которая запрашивает
// html форму с сервера, предварительно
// показывая прелоадер.

var orderForm = (function () {

    var _markInvalidateInProgress = false;
    var _markWasPasted = false;
    var _$loading = $('<div id="loading"></div>');

    var _fShowLoader = function () {
        _$loading.appendTo($('body'));
    };

    var _fHideLoader = function () {
        _$loading.addClass('invis');
        setTimeout(function () {
            _$loading.remove();
        },1000);
    };

    var _fGetOrderForm = function () {
        if (!_markInvalidateInProgress) {
            _markInvalidateInProgress = true;

            if (!_markWasPasted) {

                $.ajax({
                    url: '/give_me_order_form',
                    type: 'POST',
                    dataType: 'script'
                }).done(function (data, result) {
                    if (result == "success") {
                        _markWasPasted = true;
                    }
                });
            }
        }
    };

    return {
        getForm: _fGetOrderForm,
        hideLoader:_fHideLoader,
        showLoader:_fShowLoader
    }

})();
