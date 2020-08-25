var silvercart = silvercart ? silvercart : [];
silvercart.cart      = [];
silvercart.cart.Dropdown = (function () {
    var property = {
            DOM: silvercart.DOM(),
        },
        selector = {
            badgeQuantity:    '.dropdown-cart .badge',
            containerContent: '.dropdown-cart .cart-content',
        },
        private = {
        },
        public = {
            init: function()
            {
            },
            reloadWith: function(html)
            {
                var yPos = $('tbody', selector.containerContent).scrollTop();
                $(selector.containerContent).html(html);
                $('tbody', selector.containerContent).scrollTop(yPos);
            },
            updateBadgeWith: function(quantity)
            {
                $(selector.badgeQuantity).html(quantity);
                if (quantity === 0) {
                    $(selector.badgeQuantity).addClass('d-none');
                } else {
                    $(selector.badgeQuantity).removeClass('d-none');
                }
            }
        };
    return public;
});
silvercart.cart.Form = (function () {
    var property = {
            DOM:              silvercart.DOM(),
            submitInProgress: false,
            actions: {
                addToCart: 'sc-action/addToCart',
            },
        },
        selector = {
            containerQuantity:    '.cart-quantity',
            containerHint:        '.silvercart-add-cart-form-hint',
            formAddToCart:        'form[id^=AddToCartForm_AddToCartForm]',
            inputProductID:       'input[name="productID"]',
            inputProductQuantity: 'input[name="productQuantity"]',
            modalBase:            '#cart-modal-',
        },
        private = {
            formAddToCartSubmit: function(event)
            {
                event.preventDefault();
                if (property.submitInProgress) {
                    return;
                }
                property.submitInProgress = true;
                var form          = $(this),
                    quantity      = $(selector.inputProductQuantity, form).val(),
                    productID     = $(selector.inputProductID, form).val(),
                    modalSelector = selector.modalBase + quantity + '-' + productID,
                    hint          = $(selector.containerHint, form),
                    btn           = $('button', $(selector.inputProductQuantity, form).parent()),
                    btnTitle      = ss.i18n._t('SilvercartProduct.ADD_TO_CART', 'Add to cart'),
                    formData      = $(form).serialize() + '&isAjax=1';
                btn.addClass('disabled');
                property.DOM.prependSpinner(btn, 'light');
                $.post(property.actions.addToCart, formData)
                    .done(function (data) {
                        var response = $.parseJSON(data);
                        if (response.Redirect.length > 0) {
                            document.location.href = response.Redirect;
                            return;
                        }
                        $('body').append(response.HTMLModal);
                        $(modalSelector).modal();
                        $(modalSelector).on('hidden.bs.modal', function () {
                            $(modalSelector).remove();
                        });
                        if (quantity > 0) {
                            btnTitle = ss.i18n._t('SilvercartProduct.CHANGE_QUANTITY_CART', 'Change quantity');
                        }
                        var fa = $('span.fa', btn);
                        btn.html(' ' + btnTitle).prepend(fa);
                        if (response.QuantityInCartString.length === 0) {
                            hint.addClass('d-none');
                            hint.html('');
                        } else {
                            hint.removeClass('d-none');
                            hint.html('<span class="fa fa-info-circle"></span> ' + response.QuantityInCartString);
                        }
                        $(selector.containerQuantity).html(response.TotalCartQuantity);
                        silvercart.cart.Dropdown().updateBadgeWith(response.TotalCartQuantity);
                        silvercart.cart.Dropdown().reloadWith(response.HTMLDropdown);
                        btn.removeClass('disabled');
                        property.DOM.removeSpinner(btn);
                        property.submitInProgress = false;
                    });
                return false;
            }
        },
        public = {
            init: function()
            {
                if (typeof $(selector.formAddToCart) === "object") {
                    $(document).on('submit', selector.formAddToCart, private.formAddToCartSubmit);
                }
            }
        };
    return public;
});
$(document).ready(function () {
    silvercart.cart.Form().init();
});
