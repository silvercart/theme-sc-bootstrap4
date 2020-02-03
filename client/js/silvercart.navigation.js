var silvercart            = silvercart            ? silvercart            : [];
    silvercart.navigation = silvercart.navigation ? silvercart.navigation : [];

silvercart.navigation.main = function() {
    var property = {
            baseURL: ''
        },
        selector = {
            navigation: '#mainnav',
            navigationItem: '#mainnav > ul > .nav-item',
            navigationItemLink: '#mainnav > ul > .nav-item > a'
        },
        private = {
            initSubNavigation: function() {
                $(selector.navigationItem).each(function() {
                    var itemID = $(this).data('item-id');
                    if (typeof itemID === 'undefined') {
                        return;
                    }
                    var item = $(this);
                    $.ajax({
                        url: property.baseURL + 'sc-action/loadSubNavigation/' + itemID,
                        success: function(html) {
                            if (html.length === 0) {
                                return;
                            }
                            item.append(html);
                            item.addClass('dropdown');
                            $('#' + item.attr('id') + '.dropdown > a').click(function(e) {e.preventDefault();return false;});
                            $('#' + item.attr('id') + '.dropdown > a').addClass('dropdown-toggle');
                            $('#' + item.attr('id') + '.dropdown > a').attr('data-toggle', 'dropdown');
                            $('#' + item.attr('id') + '.dropdown > a').attr('data-animation', '1');
                            $('#' + item.attr('id') + '.dropdown > a').attr('aria-controls', 'navbarToggleExternalContent' + itemID);
                            $('#' + item.attr('id') + '.dropdown > a').attr('aria-expanded', 'false');
                            $('#' + item.attr('id') + '.dropdown > a').attr('aria-label', 'Toggle navigation');
                            $('#' + item.attr('id') + '.dropdown > a.dropdown-toggle').dropdown();
                        }
                    });
                });
            },
            loadSubNavigation: function()
            {
                var item   = $(this).closest('li'),
                    itemID = item.data('item-id'),
                    sub    = $('ul.loading', item);
                if (typeof itemID === 'undefined') {
                    return;
                }
                if (sub.length === 0) {
                    return;
                }
                $.ajax({
                    url: property.baseURL + 'sc-action/loadSubNavigation/' + itemID,
                    success: function(html) {
                        if (html.length === 0) {
                            return;
                        }
                        sub.removeClass('loading');
                        sub.html($(html).html());
                    }
                });
            }
        },
        public = {
            init: function() {
                property.baseURL = document.location.origin;
                if (typeof $('head base').attr('href') === 'string') {
                    property.baseURL = $('head base').attr('href');
                }
                if (property.baseURL.split("").reverse().join("").indexOf('/') !== 0) {
                    property.baseURL = property.baseURL + '/';
                }
                $(document).on('click', selector.navigationItemLink, private.loadSubNavigation);
                //private.initSubNavigation();
            }
        };
    return public;
};
$(document).ready(function() {
    silvercart.navigation.main().init();
});