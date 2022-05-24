var silvercart = silvercart ? silvercart : [];
    
silvercart.DOM = (function () {
    var property = {},
        selector = {
            btnConfirm:                     '.btn-confirm',
            btnLoadingMask:                 '.btn-loading-mask',
            body:                           'body',
            shopLoadingMask:                '#bb-shop-loading-mask',
            itemLoadingMask:                '.bb-shop-loading-mask',
            filterableDropdownMenu:         '.dropdown-menu-filterable',
            filterableDropdownMenuFilter:   '.dropdown-item-filter input',
            filterableDropdownMenuItems:    '.dropdown-filterable-items .dropdown-item',
            filterableDropdownMenuMismatch: '.dropdown-item-filter-mismatch',
        },
        private = {
            baseURL: false,
            buildBaseURL: function()
            {
                private.baseURL = document.location.origin;
                if (typeof $('head base').attr('href') === 'string') {
                    private.baseURL = $('head base').attr('href');
                }
                if (private.baseURL.split("").reverse().join("").indexOf('/') !== 0) {
                    private.baseURL = private.baseURL + '/';
                }
            },
            getAlert: function(message, type, withDismissalButton)
            {
                var dismissalButton = '';
                if (typeof type === 'undefined') {
                    type = 'info';
                }
                if (typeof withDismissalButton === 'undefined'
                 || withDismissalButton === true
                ) {
                    dismissalButton = private.getAlertDismissalButton();
                }
                return '<div class="alert alert-' + type + '">' + dismissalButton + message + '</div>';
            },
            getAlertDismissalButton: function()
            {
                return '<button type="button" class="close" data-dismiss="alert"><span aria-hidden="true">&times;</span></button>';
            },
            btnConfirmClick: function(event)
            {
                event.preventDefault();
                if (confirm($(this).data('confirm-text'))) {
                    public.ShowLoadingMask();
                    document.location.href = $(this).data('target');
                }
                return false;
            },
            showBodyLoadingMaskOnClick: function(event)
            {
                public.prependSpinner($(this));
                public.appendLoadingMask($(selector.body));
                return true;
            },
            fixDropdownWidth: function()
            {
                var menu = $(this).closest(selector.filterableDropdownMenu);
                menu.css('width', menu.outerWidth());
            },
            filterDropdown: function ()
            {
                var menu   = $(this).closest(selector.filterableDropdownMenu),
                    filter = $(this).val().toUpperCase();
                $(selector.filterableDropdownMenuItems, menu).each(function() {
                    var title        = $(this).attr('title'),
                        abbreviation = $(this).data('abbreviation'),
                        match        = false;
                    if (title.toUpperCase().indexOf(filter) > -1
                     || (typeof abbreviation === 'string'
                      && abbreviation.toUpperCase().indexOf(filter) > -1)
                    ) {
                        match = true;
                    }
                    if (match) {
                        $(this).removeClass('d-none');
                    } else {
                        $(this).addClass('d-none');
                    }
                });
                if ($(selector.filterableDropdownMenuItems, menu).length === $(selector.filterableDropdownMenuItems + '.d-none', menu).length) {
                    $(selector.filterableDropdownMenuMismatch, menu).removeClass('d-none');
                } else {
                    $(selector.filterableDropdownMenuMismatch, menu).addClass('d-none');
                }
            },
            filterDropdownFocus: function()
            {
                var dropdown = $(this);
                setTimeout(function() {
                    $(selector.filterableDropdownMenuFilter, dropdown).focus();
                }, 300);
            },
        },
        public = {
            init: function()
            {
                $(document).on('click', selector.btnLoadingMask, private.showBodyLoadingMaskOnClick);
                $(document).on('click', selector.btnConfirm, private.btnConfirmClick);
                $(document).on('focus', selector.filterableDropdownMenuFilter, private.fixDropdownWidth);
                $(document).on('keyup', selector.filterableDropdownMenuFilter, private.filterDropdown);
                $(selector.filterableDropdownMenu).parent().on('show.bs.dropdown', private.filterDropdownFocus);
            },
            getBaseURL: function()
            {
                if (private.baseURL === false) {
                    private.buildBaseURL();
                }
                return private.baseURL;
            },
            ShowLoadingMask: function()
            {
                if ($(selector.shopLoadingMask).length === 0) {
                    $('body').append('<div id="bb-shop-loading-mask" />');
                    $(selector.shopLoadingMask).css({
                        "display": 'none',
                        "background-color": '#ffffff',
                        "background-image": 'url("' + document.location.origin + '/_resources/themes/sc-bootstrap4/client/img/loader.gif")',
                        "background-repeat": 'no-repeat',
                        "background-position": 'center',
                        "position": 'fixed',
                        "width": '100%',
                        "height": '100%',
                        "top": '0px',
                        "left": '0',
                        "z-index": '1000',
                        "opacity": '0.6'
                    });
                }
                $(selector.shopLoadingMask).fadeIn('fast');
            },
            HideLoadingMask: function()
            {
                if ($(selector.shopLoadingMask).length !== 0) {
                    $(selector.shopLoadingMask).fadeOut('fast');
                }
            },
            sortByValue: function(json)
            {
                var sortedArray = [];
                for(var i in json)
                {
                    sortedArray.push([json[i], i]);
                }
                return sortedArray.sort();
            },
            prependSpinner: function(item, type, css)
            {
                item.prepend(public.spinner(type, 'mr-2'));
                if (typeof css !== 'undefined') {
                    $('.spinner-border', item).css(css);
                }
            },
            appendSpinner: function(item, type, css)
            {
                item.append(public.spinner(type, 'ml-2'));
                if (typeof css !== 'undefined') {
                    $('.spinner-border', item).css(css);
                }
            },
            prependSpinnerGrow: function(item, type, css)
            {
                item.prepend(public.spinnerGrow(type, 'mr-2'));
                if (typeof css !== 'undefined') {
                    $('.spinner-grow', item).css(css);
                }
            },
            appendSpinnerGrow: function(item, type, css)
            {
                item.append(public.spinnerGrow(type, 'ml-2'));
                if (typeof css !== 'undefined') {
                    $('.spinner-grow', item).css(css);
                }
            },
            removeSpinner: function(item)
            {
                $('.spinner-border', item).remove();
            },
            removeSpinnerGrow: function(item)
            {
                $('.spinner-grow', item).remove();
            },
            appendLoadingMask: function(item, type, bgColorClass, fixed, size)
            {
                if (typeof bgColorClass === 'undefined') {
                    bgColorClass = 'bg-white';
                }
                if ($(selector.itemLoadingMask, item).length === 0) {
                    item.css('position', 'relative');
                    item.append('<div class="bb-shop-loading-mask" />');
                    if (typeof type === 'undefined') {
                        type = 'primary';
                    }
                    var cssPosition    = 'absolute',
                        spinnerSize    = '',
                        positionFactor = 26;
                    if (fixed === true) {
                        cssPosition = 'fixed';
                    }
                    if (typeof size === 'string') {
                        spinnerSize = 'spinner-border-' + size;
                        if (size === 'sm') {
                            positionFactor = 8;
                        }
                    }
                    $(selector.itemLoadingMask, item).addClass(bgColorClass);
                    $(selector.itemLoadingMask, item).css({
                        "display": 'none',
                        "position": cssPosition,
                        "width": '100%',
                        "height": '100%',
                        "top": '0px',
                        "left": '0',
                        "z-index": '1040',
                        "opacity": '0.8'
                    });
                    setTimeout(function() {
                        $(selector.itemLoadingMask, item).append('<div class="spinner-border ' + spinnerSize + ' text-' + type + ' ml-2" role="status"><span class="sr-only">...</span></div>');
                        $(selector.itemLoadingMask + ' .spinner-border', item).css({
                            "position": 'absolute',
                            "top": 'calc(50% - ' + positionFactor + 'px)',
                            "left": 'calc(50% - ' + positionFactor + 'px)'
                        });
                        var positionTop  = $(selector.itemLoadingMask, item).innerHeight() / 2 - positionFactor,
                            positionLeft = $(selector.itemLoadingMask, item).innerWidth() / 2 - positionFactor * 2;
                        if (positionTop > 0) {
                            $(selector.itemLoadingMask + ' .spinner-border', item).css({
                                "top": positionTop + 'px'
                            });
                        }
                        if (positionLeft > 0) {
                            $(selector.itemLoadingMask + ' .spinner-border', item).css({
                                "left": positionLeft + 'px'
                            });
                        }
                    }, 100);
                }
                $(selector.itemLoadingMask, item).fadeIn('fast');
            },
            removeLoadingMask: function(item)
            {
                $(selector.itemLoadingMask, item).remove();
            },
            alert: function(message, type, withDismissalButton)
            {
                return private.getAlert(message, type, withDismissalButton);
            },
            appendAlert: function(item, message, type)
            {
                item.append(private.getAlert(message, type));
            },
            prependAlert: function(item, message, type)
            {
                item.prepend(private.getAlert(message, type));
            },
            beforeAlert: function(item, message, type)
            {
                item.before(private.getAlert(message, type));
            },
            afterAlert: function(item, message, type)
            {
                item.after(private.getAlert(message, type));
            },
            removeAlert: function(item, type)
            {
                if (typeof type === 'undefined') {
                    $('.alert', item).remove();
                } else {
                    $('.alert.alert-' + type, item).remove();
                }
            },
            removeAlertAfter: function(item, type)
            {
                public.removeAlert(item.parent(), type);
            },
            removeAlertBefore: function(item, type)
            {
                public.removeAlert(item.parent(), type);
            },
            fa: function(iconCode, baseClass)
            {
                if (typeof baseClass === 'undefined') {
                    baseClass = 'fas';
                }
                return '<span class="' + baseClass + ' fa-' + iconCode + '"></span>';
            },
            spinner: function(type, cssClasses)
            {
                if (typeof type === 'undefined') {
                    type = 'primary';
                }
                if (typeof cssClasses === 'undefined') {
                    cssClasses = '';
                }
                return '<div class="spinner-border spinner-border-sm text-' + type + ' ' + cssClasses + '" role="status"><span class="sr-only">...</span></div>';
            },
            spinnerGrow: function(type, cssClasses)
            {
                if (typeof type === 'undefined') {
                    type = 'primary';
                }
                if (typeof cssClasses === 'undefined') {
                    cssClasses = '';
                }
                return '<div class="spinner-grow spinner-grow-sm text-' + type + ' ' + cssClasses + '" role="status"><span class="sr-only">...</span></div>';
            },
            modal: {
                create: function(identifier, title, body, footer, size)
                {
                    var modalHtml, btnClose, modalSize = typeof size === 'undefined' ? '' : 'modal-' + size;
                    btnClose  = '<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>';
                    modalHtml = '<div class="modal fade" tabindex="-1" role="dialog" aria-hidden="true" id="' + identifier + '">';
                        modalHtml += '<div class="modal-dialog ' + modalSize + '">';
                            modalHtml += '<div class="modal-content">';
                                modalHtml += '<div class="modal-header"><h5 class="modal-title">' + title + '</h5>' + btnClose + '</div>';
                                modalHtml += '<div class="modal-body">' + body + '</div>';
                    if (typeof footer !== 'undefined'
                     && footer.length > 0
                    ) {
                        modalHtml += '<div class="modal-footer">' + footer + '</div>';
                    }
                            modalHtml += '</div>';
                        modalHtml += '</div>';
                    modalHtml += '</div>';
                    $('body').append(modalHtml);
                },
                dispose: function(identifier)
                {
                    if ($('#' + identifier).length === 0) {
                        return;
                    }
                    $('#' + identifier).modal('dispose');
                },
                destroy: function(identifier)
                {
                    if ($('#' + identifier).length === 0) {
                        return;
                    }
                    $('#' + identifier).modal('dispose');
                    $('#' + identifier).remove();
                },
                hide: function(identifier)
                {
                    if ($('#' + identifier).length === 0) {
                        return;
                    }
                    $('#' + identifier).modal('hide');
                },
                show: function(identifier, title, body, footer, size)
                {
                    if ($('#' + identifier).length === 0) {
                        public.modal.create(identifier, title, body, footer, size);
                    }
                    $('#' + identifier).modal('show');
                },
            },
        };
    return public;
});
$(function()
{
    silvercart.DOM().init();
});