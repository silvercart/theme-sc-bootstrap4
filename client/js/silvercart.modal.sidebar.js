var silvercart       = silvercart       ? silvercart       : [];
    silvercart.modal = silvercart.modal ? silvercart.modal : [];

silvercart.modal.sidebar = function() {
    var property = {
            cookie: silvercart.cookie(),
            DOM:    BattleBear.DOM(),
            xhr:    false,
            timeout: {
                positionQuantity: false,
            }
        },
        selector = {
            btnContinue:           '.btn-continue',
            btnPositionDecrease:   '.modal-sidebar .btn-position-decrease',
            btnPositionIncrease:   '.modal-sidebar .btn-position-increase',
            btnPositionRemove:     '.modal-sidebar .btn-position-remove',
            btnPositionRemove2:    '.btn-position-remove',
            inputPositionQuantity: '.input-position-quantity',
            inputGroupPositionQuantity: '.input-group-position-quantity',
            modalMask:             '#modal-sidebar-mask',
            modalSidebar:          '.modal-sidebar',
            position:              '.shopping-cart-position',
            positionContent:       '.shopping-cart-position-content',
        },
        private = {
            toggleModalByDismissButton: function() {
                var modal           = $(this).closest(selector.modalSidebar),
                    toggleModalMask = true;
                if (modal.hasClass('is-pinned')) {
                    toggleModalMask = false;
                    private.toggleModalPinned(modal, toggleModalMask);
                }
                private.toggleModal(modal, toggleModalMask);
            },
            toggleModalByTarget: function() {
                var targetSelector = $(this).data('target'),
                    modal          = $(targetSelector);
                private.toggleModal(modal);
            },
            toggleModal: function(modal, toggleModalMask) {
                if (typeof toggleModalMask === 'undefined') {
                    toggleModalMask = true;
                }
                if (!modal.hasClass('initialized')) {
                    modal.remove();
                    $('body').append(modal);
                    modal.addClass('initialized');
                }
                $('body').toggleClass('modal-sidebar-is-visible');
                modal.fadeToggle();
                if (toggleModalMask) {
                    private.toggleModalMask(modal);
                }
                modal.toggleClass('is-visible');
            },
            toggleModalMask: function(currentModel) {
                if ($(selector.modalMask).length === 0) {
                    $('body').append('<div id="' + selector.modalMask.replace('#', '') + '"></div>');
                }
                $(selector.modalMask).data('target', '#' + currentModel.attr('id'));
                $(selector.modalMask).fadeToggle();
            },
            toggleModalPinnedByPinButton: function()
            {
                var modal = $(this).closest(selector.modalSidebar);
                private.toggleModalPinned(modal);
            },
            toggleModalPinned: function(modal, toggleModalMask)
            {
                if (typeof toggleModalMask === 'undefined') {
                    toggleModalMask = true;
                }
                modal.toggleClass('is-pinned');
                $('[data-pin="modal-sidebar"]', modal).toggleClass('btn-link')
                        .toggleClass('text-gray')
                        .toggleClass('btn-dark')
                        .toggleClass('text-white');
                if (toggleModalMask) {
                    private.toggleModalMask(modal);
                }
                $('main').toggleClass('modal-sidebar-pinned');
                $('body').toggleClass('modal-sidebar-pinned');
                private.storePinnedStatus(modal);
            },
            storePinnedStatus: function(modal)
            {
                var cookieKey            = 'modal_sidebar_pinned',
                    pinnedSidebarsCookie = property.cookie.getValue(cookieKey),
                    pinnedSidebarsList   = pinnedSidebarsCookie.split(','),
                    pinnedSidebarsKey    = modal.attr('id').replace(/-/g, '__');
                if (modal.hasClass('is-pinned')) {
                    if (pinnedSidebarsCookie.length === 0) {
                        pinnedSidebarsList = [];
                        pinnedSidebarsList.push(pinnedSidebarsKey);
                    }
                } else {
                    if (pinnedSidebarsCookie.length > 0) {
                        var temp = pinnedSidebarsList;
                        pinnedSidebarsList = [];
                        $(temp).each(function(index, value) {
                            if (value === pinnedSidebarsKey) {
                                return;
                            }
                            pinnedSidebarsList.push(value);
                        });
                    }
                }
                property.cookie.setValue(cookieKey, pinnedSidebarsList.join(','));
            },
            initByCookie: function()
            {
                var cookieKey            = 'modal_sidebar_pinned',
                    pinnedSidebarsCookie = property.cookie.getValue(cookieKey);
                if (pinnedSidebarsCookie.length === 0) {
                    return;
                }
                var pinnedSidebars = pinnedSidebarsCookie.split(',');
                $(pinnedSidebars).each(function(index, value) {
                    var htmlID       = '#' + value.replace(/__/g, '-'),
                        htmlSelector = htmlID + selector.modalSidebar;
                    if ($(htmlSelector).length === 0) {
                        return;
                    }
                    private.toggleModal($(htmlSelector), false);
                    private.toggleModalPinned($(htmlSelector), false);
                });
            },
            position: {
                remove: function(event)
                {
                    event.preventDefault();
                    if (property.xhr !== false) {
                        property.xhr.abort();
                        property.xhr = false;
                    }
                    var modal      = $(this).closest(selector.modalSidebar),
                        btn        = $(this),
                        positionID = $(this).data('position-id'),
                        targetURL  = $(this).data('target'),
                        sCallback  = $(this).data('successCallback'),
                        position   = $(selector.position + '[data-position-id="' + positionID + '"]', modal);
                    property.DOM.appendSpinnerGrow(btn, 'dark');
                    btn.attr('disabled', true);
                    private.theme.positionRemoveAlert(position);
                    $(selector.positionContent, position).css('transition', 'opacity 1s 0s');
                    $(selector.positionContent, position).addClass('op-20');
                    $(selector.btnContinue, modal).attr('disabled', true);
                    property.xhr = $.ajax({
                        url:      targetURL,
                        dataType: 'json',
                        type:     'POST',
                        data: {
                            PositionID: positionID
                        },
                        success: function(data) {
                            property.DOM.removeSpinnerGrow(btn);
                            btn.attr('disabled', false);
                            $(selector.btnContinue, modal).attr('disabled', false);
                            private.theme.positionRemove(position);
                            if (typeof sCallback === 'string') {
                                eval(sCallback);
                            }
                        },
                        error: function(data, textStatus, error) {
                            property.DOM.removeSpinnerGrow(btn);
                            btn.attr('disabled', false);
                            $(selector.btnContinue, modal).attr('disabled', false);
                            $(selector.positionContent, position).removeClass('op-20');
                            private.theme.positionAppendAlert(position, property.DOM.fa('exclamation-triangle') + ' ' + ss.i18n._t('SingleCardManager.AnErrorOccurred', 'Oops! An error occurred. Please try again.'), 'danger');
                        }
                    });
                    return false;
                },
                increase: function()
                {
                    var btn           = $(this),
                        modal         = $(this).closest(selector.modalSidebar),
                        positionID    = $(this).data('position-id'),
                        position      = $(selector.position + '[data-position-id="' + positionID + '"]', modal),
                        inputQuantity = $(selector.inputPositionQuantity, position),
                        max           = parseInt(inputQuantity.attr('max')),
                        quantity      = parseInt(inputQuantity.val());
                    if (quantity + 1 > max) {
                        btn.attr('disabled', true);
                        $(selector.inputGroupPositionQuantity, position).addClass('effect-shake');
                        setTimeout(function() {
                            $(selector.inputGroupPositionQuantity, position).removeClass('effect-shake');
                            btn.attr('disabled', false);
                        }, 900);
                    } else {
                        inputQuantity.val(quantity + 1);
                        private.position.updateQuantity(position);
                    }
                },
                decrease: function()
                {
                    var btn           = $(this),
                        modal         = $(this).closest(selector.modalSidebar),
                        positionID    = $(this).data('position-id'),
                        position      = $(selector.position + '[data-position-id="' + positionID + '"]', modal),
                        inputQuantity = $(selector.inputPositionQuantity, position),
                        max           = parseInt(inputQuantity.attr('max')),
                        quantity      = parseInt(inputQuantity.val());
                    if (quantity - 1 < 0) {
                        btn.attr('disabled', true);
                        $(selector.inputGroupPositionQuantity, position).addClass('effect-shake');
                        setTimeout(function() {
                            $(selector.inputGroupPositionQuantity, position).removeClass('effect-shake');
                            btn.attr('disabled', false);
                        }, 900);
                    } else {
                        inputQuantity.val(quantity - 1);
                        private.position.updateQuantity(position);
                    }
                },
                quantityChange: function()
                {
                    var modal      = $(this).closest(selector.modalSidebar),
                        positionID = $(this).data('position-id'),
                        position   = $(selector.position + '[data-position-id="' + positionID + '"]', modal);
                    private.position.updateQuantity(position);
                },
                updateQuantity: function(position)
                {
                    var inputQuantity = $(selector.inputPositionQuantity, position),
                        max           = parseInt(inputQuantity.attr('max')),
                        quantity      = parseInt(inputQuantity.val()),
                        targetURL     = inputQuantity.data('target'),
                        sCallback     = inputQuantity.data('successCallback'),
                        positionID    = inputQuantity.data('position-id');
                    if (property.timeout.positionQuantity !== false) {
                        clearTimeout(property.timeout.positionQuantity);
                        property.timeout.positionQuantity = false;
                    }
                    if (quantity === 0) {
                        $(selector.btnPositionRemove2, position).trigger('click');
                        return;
                    }
                    property.timeout.positionQuantity = setTimeout(function() {
                        $(selector.inputGroupPositionQuantity + ' .btn', position).attr('disabled', true);
                        $(selector.inputGroupPositionQuantity + ' input', position).attr('disabled', true);
                        if (quantity > max) {
                            inputQuantity.val(max);
                        } else if (quantity < 0) {
                            inputQuantity.val(0);
                        }
                        property.DOM.appendLoadingMask($(selector.inputGroupPositionQuantity, position), 'gray', 'bg-white', false, 'sm');
                        $.ajax({
                            url:      targetURL,
                            dataType: 'json',
                            type:     'POST',
                            data: {
                                PositionID: positionID,
                                Quantity:   quantity
                            },
                            success: function(data) {
                                $(selector.inputGroupPositionQuantity + ' .btn', position).attr('disabled', false);
                                $(selector.inputGroupPositionQuantity + ' input', position).attr('disabled', false);
                                property.DOM.removeLoadingMask($(selector.inputGroupPositionQuantity, position));
                                if (typeof sCallback === 'string') {
                                    eval(sCallback);
                                }
                            },
                            error: function(data, textStatus, error) {
                                $(selector.inputGroupPositionQuantity + ' .btn', position).attr('disabled', false);
                                $(selector.inputGroupPositionQuantity + ' input', position).attr('disabled', false);
                                property.DOM.removeLoadingMask($(selector.inputGroupPositionQuantity, position));
                                private.theme.positionAppendAlert(position, property.DOM.fa('exclamation-triangle') + ' ' + ss.i18n._t('SingleCardManager.AnErrorOccurred', 'Oops! An error occurred. Please try again.'), 'danger');
                            }
                        });
                    }, 700);
                },
            },
            theme: {
                positionRemove: function(position)
                {
                    if ($(selector.positionContent, position).length > 0) {
                        $(selector.positionContent, position).slideUp(function() {
                            $(this).remove();
                        });
                        property.DOM.appendAlert(position, property.DOM.fa('check-circle') + ' ' + ss.i18n._t('SingleCardManager.PositionRemove', 'Position was successfully removed from your list.'), 'success');
                        $('.alert', position).css('display', 'none').addClass('mb-0').slideToggle();
                    } else {
                        $(position).next('tr').remove();
                        $(position).replaceWith('<tr data-position-id="' + position.data('position-id') + '" class="purchase-list-position-message"><td colspan="5"></td></tr>');
                        property.DOM.appendAlert($('.purchase-list-position-message[data-position-id="' + position.data('position-id') + '"] td'), property.DOM.fa('check-circle') + ' ' + ss.i18n._t('SingleCardManager.PositionRemove', 'Position was successfully removed from your list.'), 'success mb-0');
                    }
                },
                positionRemoveAlert: function(position)
                {
                    if (position.hasClass('bulk')) {
                        if ($(selector.positionContent, position).length > 0) {
                            property.DOM.removeAlert($(selector.positionContent, position));
                        } else {
                            property.DOM.removeAlert($('td.quantity', $(position)));
                        }
                    } else {
                        if ($(selector.positionContent, position).length > 0) {
                            property.DOM.removeAlert($(selector.positionContent, position));
                        } else {
                            property.DOM.removeAlert($(position).next('tr'));
                        }
                    }
                },
                positionAppendAlert: function(position, message, type)
                {
                    if (position.hasClass('bulk')) {
                        if ($(selector.positionContent, position).length > 0) {
                            property.DOM.appendAlert($(selector.positionContent, position), message, type);
                            $('.alert', position).css('display', 'none').addClass('mb-0').slideToggle();
                        } else {
                            property.DOM.appendAlert($('td.quantity', $(position)), message, type);
                            $('.alert', $('td.quantity', $(position))).css('display', 'none').addClass('mb-0 mt-1').slideToggle();
                        }
                    } else {
                        if ($(selector.positionContent, position).length > 0) {
                            property.DOM.appendAlert($(selector.positionContent, position), message, type);
                            $('.alert', position).css('display', 'none').addClass('mb-0').slideToggle();
                        } else {
                            property.DOM.prependAlert($('td', $(position).next('tr')), message, type);
                            $('.alert', $('td', $(position).next('tr'))).css('display', 'none').addClass('mb-0').slideToggle();
                        }
                    }
                }
            }
        },
        public = {
            init: function() {
                $(document).on('click', '[data-toggle="modal-sidebar"]', private.toggleModalByTarget);
                $(document).on('click', '[data-dismiss="modal-sidebar"]', private.toggleModalByDismissButton);
                $(document).on('click', '[data-pin="modal-sidebar"]', private.toggleModalPinnedByPinButton);
                $(document).on('click', selector.modalMask, private.toggleModalByTarget);
                $(document).on('click', selector.btnPositionRemove, private.position.remove);
                $(document).on('click', selector.btnPositionIncrease, private.position.increase);
                $(document).on('click', selector.btnPositionDecrease, private.position.decrease);
                $(document).on('keyup', selector.inputPositionQuantity, private.position.quantityChange);
                private.initByCookie();
            }
        };
    return public;
};
$(document).ready(function() {
    silvercart.modal.sidebar().init();
});