var silvercart = silvercart ? silvercart : [];
    
silvercart.DOM = (function () {
    var property = {},
        selector = {
            btnLoadingMask:  '.btn-loading-mask',
            body:            'body',
            shopLoadingMask: "#bb-shop-loading-mask",
            itemLoadingMask: ".bb-shop-loading-mask"
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
            getAlert: function(message, type)
            {
                if (typeof type === 'undefined') {
                    type = 'info';
                }
                return '<div class="alert alert-' + type + '">' + private.getAlertDismissalButton() + message + '</div>';
            },
            getAlertDismissalButton: function()
            {
                return '<button type="button" class="close" data-dismiss="alert"><span aria-hidden="true">&times;</span></button>';
            },
            showBodyLoadingMaskOnClick: function(event)
            {
                public.prependSpinner($(this));
                public.appendLoadingMask($(selector.body));
                return true;
            }
        },
        public = {
            init: function()
            {
                $(document).on('click', selector.btnLoadingMask, private.showBodyLoadingMaskOnClick);
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
                        "background-image": 'url("' + document.location.origin + '/resources/vendor/battlebear/single-card-manager/client/img/loader.gif")',
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
                if (typeof type === 'undefined') {
                    type = 'primary';
                }
                item.prepend('<div class="spinner-border spinner-border-sm text-' + type + ' mr-2" role="status"><span class="sr-only">...</span></div>');
                if (typeof css !== 'undefined') {
                    $('.spinner-border', item).css(css);
                }
            },
            appendSpinner: function(item, type, css)
            {
                if (typeof type === 'undefined') {
                    type = 'primary';
                }
                item.append('<div class="spinner-border spinner-border-sm text-' + type + ' ml-2" role="status"><span class="sr-only">...</span></div>');
                if (typeof css !== 'undefined') {
                    $('.spinner-border', item).css(css);
                }
            },
            prependSpinnerGrow: function(item, type, css)
            {
                if (typeof type === 'undefined') {
                    type = 'primary';
                }
                item.prepend('<div class="spinner-grow spinner-grow-sm text-' + type + ' mr-2" role="status"><span class="sr-only">...</span></div>');
                if (typeof css !== 'undefined') {
                    $('.spinner-grow', item).css(css);
                }
            },
            appendSpinnerGrow: function(item, type, css)
            {
                if (typeof type === 'undefined') {
                    type = 'primary';
                }
                item.append('<div class="spinner-grow spinner-grow-sm text-' + type + ' ml-2" role="status"><span class="sr-only">...</span></div>');
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
            }
        };
    return public;
});
$(function()
{
    silvercart.DOM().init();
});