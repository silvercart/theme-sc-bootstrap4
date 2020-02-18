var silvercart       = silvercart       ? silvercart       : [];
    silvercart.modal = silvercart.modal ? silvercart.modal : [];

silvercart.modal.sidebarShoppingCart = function() {
    var property = {
            sidebarSelector: "#modal-sidebar-shopping-cart",
        },
        selector = {
            badgeCart:    '.badge-cart',
            quantityCart: '.quantity-cart',
        },
        private = {
            theme: {
                updateBadgeCart: function(quantity)
                {
                    if (parseInt(quantity) === 0) {
                        $(selector.quantityCart).html(quantity);
                        $(selector.badgeCart).addClass('d-none');
                    } else {
                        $(selector.quantityCart).html(quantity);
                        $(selector.badgeCart).removeClass('d-none').addClass('effect-shake');
                        setTimeout(function() {
                            $(selector.badgeCart).removeClass('effect-shake');
                        }, 900);
                    }
                }
            }
        },
        public = {
            updateInfo: function(data)
            {
                private.theme.updateBadgeCart(data.TotalCartQuantity);
            }
        };
    return public;
};