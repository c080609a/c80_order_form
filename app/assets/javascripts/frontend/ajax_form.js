// Содержит функцию, которая запрашивает
// html форму с сервера, предварительно
// показывая прелоадер.
//
// Код иницализируется и начинает своё исполнение,
// если на странице есть хотя бы одна кнопка класса
// c80_order_invoking_btn

var orderForm;
var $c80OrderInvokingBtns;

$(function () {

    $c80OrderInvokingBtns = $('.c80_order_invoking_btn');

    if ($c80OrderInvokingBtns.length > 0) {

        var loading = (function () {

            var _$lo;

            var _fInit = function () {
                _$lo = $('<div id="lo"></div>');
            };

            var fShow = function ($clickedButton) {

                _$lo.appendTo($('body'));

                var top = $clickedButton.offset().top;
                var left = $clickedButton.offset().left;
                left -= _$lo.width() + 10;
                top = top + $clickedButton.height()/2 - _$lo.height()/2;

                _$lo.css("top",top+"px");
                _$lo.css("left",left+"px");
            };

            var fHide = function () {
                _$lo.addClass('invis');
                setTimeout(function () {
                    _$lo.remove();
                    _$lo.removeClass('invis');
                }, 1000);
            };

            _fInit();

            return {
                show:fShow,
                hide:fHide
            }

        })();

        orderForm = (function () {

            var _markInvalidateInProgress = false;
            var _markWasPasted = false;
            var __$f;

            var init = function () {
                $c80OrderInvokingBtns.click(function (e) {
                    e.preventDefault();
                    _fGetOrderForm();
                    loading.show($(this));
                });
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
                                _markInvalidateInProgress = false;
                            }
                        });
                    }
                }
            };

            var showForm = function (html_str) {

                var $cc = $('body');
                $cc.append($(html_str));

                __$f = $('#order_form');
                //__$f.find(".close").click(__removeForm);
                //__$f.find(".btn_close").click(__removeForm);

                __$f.on('hidden.bs.modal', __removeForm);

                var $form = $("form#form_order");
                $form.bind("ajax:error", function (event, data, status, xhr) {
                    $form.render_form_errors($.parseJSON(data.responseText));
                });

                setTimeout(function () {
                    __$f.modal();
                    loading.hide();
                },1000);

            };

            var __removeForm = function () {
                //console.log('<__removeForm>');
                setTimeout(function () {
                    __$f.remove();
                    _markWasPasted = false;
                }, 1000);
            };

            return {
                init: init,
                showForm: showForm
            }

        })();

        orderForm.init();
    }

});