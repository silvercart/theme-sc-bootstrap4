var silvercart       = silvercart       ? silvercart       : [];
    silvercart.modal = silvercart.modal ? silvercart.modal : [];

silvercart.modal.sidebar = function() {
    var property = {
            cookie: silvercart.cookie()
        },
        selector = {
            modalMask: '#modal-sidebar-mask'
        },
        private = {
            toggleModalByDismissButton: function() {
                var modal           = $(this).closest('.modal-sidebar'),
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
                var modal = $(this).closest('.modal-sidebar');
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
                    var htmlID = '#' + value.replace(/__/g, '-');
                    if ($(htmlID).length === 0) {
                        return;
                    }
                    private.toggleModal($(htmlID), false);
                    private.toggleModalPinned($(htmlID), false);
                });
            }
        },
        public = {
            init: function() {
                $(document).on('click', '[data-toggle="modal-sidebar"]', private.toggleModalByTarget);
                $(document).on('click', '[data-dismiss="modal-sidebar"]', private.toggleModalByDismissButton);
                $(document).on('click', '[data-pin="modal-sidebar"]', private.toggleModalPinnedByPinButton);
                $(document).on('click', selector.modalMask, private.toggleModalByTarget);
                private.initByCookie();
            }
        };
    return public;
};
$(document).ready(function() {
    silvercart.modal.sidebar().init();
});