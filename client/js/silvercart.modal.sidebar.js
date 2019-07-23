var silvercart       = silvercart       ? silvercart       : [];
    silvercart.modal = silvercart.modal ? silvercart.modal : [];

silvercart.modal.sidebar = function() {
    var property = {},
        selector = {
            modalMask: '#modal-sidebar-mask'
        },
        private = {
            toggleModalByDismissButton: function() {
                var modal = $(this).closest('.modal-sidebar');
                private.toggleModal(modal);
            },
            toggleModalByTarget: function() {
                var targetSelector = $(this).data('target'),
                    modal          = $(targetSelector);
                private.toggleModal(modal);
            },
            toggleModal: function(modal) {
                if (!modal.hasClass('initialized')) {
                    modal.remove();
                    $('body').append(modal);
                    modal.addClass('initialized');
                }
                $('body').toggleClass('modal-sidebar-is-visible');
                modal.fadeToggle();
                private.toggleModalMask(modal);
                modal.toggleClass('is-visible');
            },
            toggleModalMask: function(currentModel) {
                if ($(selector.modalMask).length === 0) {
                    $('body').append('<div id="' + selector.modalMask.replace('#', '') + '"></div>');
                }
                $(selector.modalMask).data('target', '#' + currentModel.attr('id'));
                $(selector.modalMask).fadeToggle();
            }
        },
        public = {
            init: function() {
                $(document).on('click', '[data-toggle="modal-sidebar"]', private.toggleModalByTarget);
                $(document).on('click', '[data-dismiss="modal-sidebar"]', private.toggleModalByDismissButton);
                $(document).on('click', selector.modalMask, private.toggleModalByTarget);
            }
        };
    return public;
};
$(document).ready(function() {
    silvercart.modal.sidebar().init();
});