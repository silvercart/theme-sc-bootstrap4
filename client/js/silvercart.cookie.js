var silvercart = silvercart ? silvercart : [];
silvercart.cookie = function() {
    var property = {},
        selector = {},
        private = {
            getPairs: function()
            {
                return document.cookie.split('; ');
            },
            getKeyValue: function(pair)
            {
                return pair.split('=');
            },
            setPairs: function(pairs)
            {
                document.cookie = pairs.join('; ');
            }
        },
        public = {
            getValue: function (key)
            {
                var fValue = '',
                    found  = false;
                $(private.getPairs()).each(function(cIndex, cPair) {
                    if (found) {
                        return;
                    }
                    var cKeyValue = private.getKeyValue(cPair),
                        cKey      = cKeyValue[0],
                        cValue    = cKeyValue[1];
                    if (key === cKey) {
                        fValue = cValue;
                        found  = true;
                    }
                });
                return fValue;
            },
            setValue: function (key, value)
            {
                document.cookie = key + '=' + value + ';';
            }
        };
    return public;
};
silvercart.cookieConsent = function() {
    var property = {
            DOM: silvercart.DOM(),
        },
        selector = {
            btnAccept:               '#cookie-consent .btn-accept, #CookieConsentForm_Form .btn-accept',
            btnBack:                 '#cookie-consent .btn-back',
            btnManage:               '#cookie-consent .btn-manage',
            btnCookieDetails:        '#CookieConsentForm_Form .btn-cookie-details',
            cookieConsent:           '#cookie-consent',
            cookieConsentBackground: '.cookie-consent-background',
            cookieConsentBody:       '#cookie-consent .cookie-consent-body',
            cookieConsentBodyLink:   '#cookie-consent .cookie-consent-body a, #cookie-consent #cookie-consent-manage a',
            cookieConsentMain:       '#cookie-consent-main',
            cookieConsentManage:     '#cookie-consent-manage',
            formCookieConsent:       '#CookieConsentForm_Form',
        },
        private = {
            btnAcceptClick: function(event)
            {
                event.preventDefault();
                var btn    = $(this),
                    target = btn.attr('href');
                property.DOM.removeAlert($(selector.cookieConsentBody));
                property.DOM.appendSpinner(btn, 'white');
                property.DOM.appendLoadingMask($(selector.cookieConsent), 'gray', 'bg-white', false, 'sm');
                $.ajax({
                    url:      target + '?ajax=1',
                    dataType: 'html',
                    success: function(html) {
                        $(selector.cookieConsentBackground).remove();
                        $('body').css('overflow', 'auto');
                        document.location.reload();
                    },
                    error: function(data, textStatus, error) {
                        property.DOM.removeSpinner(btn);
                        property.DOM.removeLoadingMask($(selector.cookieConsent));
                        property.DOM.appendAlert($(selector.cookieConsentBody), property.DOM.fa('exclamation-triangle') + ' ' + ss.i18n._t('SilverCart.AnErrorOccurred', 'An error occurred. Please try again.'), 'danger');
                    }
                });
                return false;
            },
            btnBackClick: function(event)
            {
                event.preventDefault();
                $(selector.cookieConsentManage).hide();
                $(selector.cookieConsentMain).show();
                return false;
            },
            btnCookieDetailsClick: function(event)
            {
                event.preventDefault();
                var btn    = $(this),
                    target = btn.data('target');
                if ($(target).length !== 0) {
                    $(target).slideToggle();
                }
                return false;
            },
            btnManageClick: function(event)
            {
                event.preventDefault();
                if ($(selector.cookieConsentManage).length === 0) {
                    private.loadCookieManager($(this));
                } else {
                    private.showCookieManager();
                }
                return false;
            },
            cookieConsentBodyLinkClick: function(event)
            {
                event.preventDefault();
                document.location.href = $(this).attr('href') + '?dnpcs=1';
                return false;
            },
            loadCookieManager: function(btn)
            {
                var target = btn.data('target');
                property.DOM.removeAlert($(selector.cookieConsentBody));
                property.DOM.appendSpinner(btn, 'dark');
                property.DOM.appendLoadingMask($(selector.cookieConsent), 'gray', 'bg-white', false, 'sm');
                $.ajax({
                    url:      target + '?ajax=1',
                    dataType: 'html',
                    success: function(html) {
                        property.DOM.removeSpinner(btn);
                        property.DOM.removeLoadingMask($(selector.cookieConsent));
                        $(selector.cookieConsent).append('<div id="cookie-consent-manage"></div>');
                        $(selector.cookieConsentMain).hide();
                        $(selector.cookieConsentManage).append(html);
                    },
                    error: function(data, textStatus, error) {
                        property.DOM.removeSpinner(btn);
                        property.DOM.removeLoadingMask($(selector.cookieConsent));
                        property.DOM.appendAlert($(selector.cookieConsentBody), property.DOM.fa('exclamation-triangle') + ' ' + ss.i18n._t('SilverCart.AnErrorOccurred', 'An error occurred. Please try again.'), 'danger');
                    }
                });
            },
            showCookieManager: function(btn)
            {
                $(selector.cookieConsentMain).hide();
                $(selector.cookieConsentManage).show();
            },
        },
        public = {
            init: function ()
            {
                if ($(selector.cookieConsent).length === 0) {
                    if ($(selector.formCookieConsent).length !== 0) {
                        $(document).on('click', selector.btnAccept, private.btnAcceptClick);
                        $(document).on('click', selector.btnCookieDetails, private.btnCookieDetailsClick);
                    }
                    return;
                }
                $(document).on('click', selector.btnAccept, private.btnAcceptClick);
                $(document).on('click', selector.btnBack, private.btnBackClick);
                $(document).on('click', selector.btnCookieDetails, private.btnCookieDetailsClick);
                $(document).on('click', selector.btnManage, private.btnManageClick);
                $(document).on('click', selector.cookieConsentBodyLink, private.cookieConsentBodyLinkClick);
            },
        };
    return public;
};
$(document).ready(function() {
    silvercart.cookieConsent().init();
});