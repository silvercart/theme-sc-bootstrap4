var silvercart       = silvercart       ? silvercart       : [];
    silvercart.theme = silvercart.theme ? silvercart.theme : [];

silvercart.theme.initTooltips = function() {
    if ($('[data-toggle="tooltip"]').length > 0) {
        $('[data-toggle="tooltip"]').tooltip({animation: false});
    }
};
silvercart.theme.initStickyElements = function() {
    $('aside').wrapInner('<div class="aside-inner"></div>');
    $('#content-main').wrapInner('<div class="main-inner"></div>');
    return $('.aside-inner').innerHeight() < $('.main-inner').innerHeight() ? $('.aside-inner') : $('.main-inner');
};
silvercart.theme.addStickyElements = function() {
    var sticky = silvercart.theme.initStickyElements();
    sticky.addClass('sticky');
};
silvercart.theme.removeStickyElements = function() {
    var sticky = silvercart.theme.initStickyElements();
    sticky.removeClass('sticky');
};
silvercart.theme.initShoppingCartDropdown = function() {
    $('.cart-content').find('table').click(function (e) {
        e.stopPropagation();
    });
};
silvercart.theme.initCarousels = function() {
    $('.carousel').carousel();
};
silvercart.theme.initLazyloadImages = function() {
    var lazyImages = document.querySelectorAll("img.lazyload");
    if (lazyImages.length > 0) {
        lazyload(lazyImages);
    }
};
silvercart.theme.initFancybox = function() {
    var fancyLink = $("a.fancybox");
    if (fancyLink.length === 0) {
        return;
    }
    fancyLink.fancybox({
        minWidth: '30%',
        minHeight: 10,
        prevEffect: 'elastic',
        nextEffect: 'elastic',
        openEffect: 'elastic',
        closeEffect: 'elastic',
        fitToView: true,
        autoWidth: true,
        maxWidth: "97%",
        afterShow: function () {
            $(".fancybox-image").wrap($("<a />", {
                href: this.href,
                title: this.title,
                target: "_blank"
            }));
        },
        tpl: {
            closeBtn: '<a title="Close" class="btn btn-primary rounded-circle fancybox-close" href="javascript:;" style="background-image:none; "><span class="fa fa-times" aria-hidden="true"></span></a>',
            next: '<a class="fancybox-nav fancybox-next btn btn-default" title="Next" href="javascript:;"><span class="fa-stack fa-lg" style="background-image:none"><i class="fa fa-square fa-stack-2x"></i><i class="fa fa-step-forward fa-stack-1x fa-inverse"></i></span></a>',
            prev: '<a class="fancybox-nav fancybox-prev btn btn-default" title="Previous" href="javascript:;"><span class="fa-stack fa-lg" style="background-image:none"><i class="fa fa-square fa-stack-2x"></i><i class="fa fa-step-backward fa-stack-1x fa-inverse"></span></i></a>'
        },
        helpers: {
            title: {
                type: 'inside'
            }
        }
    });
};
silvercart.theme.toggleBackToTop = function(scrollPos) {
    var totop = $('#totop');
    totop.click(function () {
        $('html, body').stop(true, false).animate({scrollTop: 0}, 1000);
        return false;
    });
    if (scrollPos > 1000) {
        if (totop.length === 0) {
            $('body').append('<span id="totop" title="Click to go Up" style="display:none;position:fixed;bottom:10px;right:10px;cursor:pointer;cursor:hand;z-index: 2;" class="bg-primary rounded-circle p-2"><span class="fa fa-2x fa-chevron-up"></span></span>');
        }
        totop.fadeIn();
    } else {
        totop.fadeOut();
    }
    var scrollNav = $('.left-icon-bar');
    if (scrollPos > 300) {
        scrollNav.fadeIn();
    } else {
        scrollNav.fadeOut();
    }
};
silvercart.theme.toggleFixMainNavbar = function(scrollPos) {
    var scrollTop = scrollPos;
    if (scrollTop >= $('header').height()) {
        $('#navbar').removeClass('static-top').addClass('fixed-top');
        $('body').addClass('nav-is-fixed-top');
    } else {
        $('#navbar').removeClass('fixed-top').addClass('static-top');
        $('body').removeClass('nav-is-fixed-top');
    }
};
silvercart.theme.getCurrentBreakpoint = function() {
    var breakpoint    = 'xs',
        widthType     = 'innerWidth',
        contextWindow = window,
        currentWidth;

    if (!('innerWidth' in contextWindow)) {
        widthType = 'clientWidth';
        contextWindow = document.documentElement || document.body;
    }
    currentWidth = contextWindow[widthType];
    switch (true) {
        case (currentWidth >= 1921):
            breakpoint = "xxl";
            break;
        case (currentWidth >= 1200):
            breakpoint = "xl";
            break;
        case (currentWidth >= 992):
            breakpoint = "lg";
            break;
        case (currentWidth >= 768):
            breakpoint = "md";
            break;
        case (currentWidth >= 576):
            breakpoint = "sm";
            break;
        default:
    }
    return breakpoint;
};
silvercart.theme.elementsToMove = (function () {
    var elementsToMove = $('.replace-element');
    var elementsData   = [];

    var init = function() {
        moveElementsByBreakpoint();
        var resizeTimer = 0;
        $(window).on('resize', function (e) {
            clearTimeout(resizeTimer);
            resizeTimer = setTimeout(function () {
                moveElementsByBreakpoint();
            }, 100);
        });
    };
    var initElementsData = function () {
        if (elementsData.length === 0) {
            if (elementsToMove.length === 0) {
                elementsToMove = $('.replace-element');
            }
            $.each(elementsToMove, function (index, item) {
                var item   = $(item);
                var data   = {};
                var moveTo = $('.' + item.data('moveto')).prop('class');

                data.index      = index;
                data.breakpoint = item.data('breakpoint');
                data.moveFrom   = combineClassNames(item.parent().prop('class'));
                data.moveTo     = combineClassNames(moveTo);
                data.selector   = combineClassNames(item.prop('class'));
                data.extraClass = item.data('extraclass');

                elementsData.push(data);
            });
        }
        return elementsData;
    };
    var combineClassNames = function(elClasses) {
        if (elClasses === '' ||
            typeof elClasses === 'undefined'){
            return '';
        }
        return  '.' + elClasses.replace(/\s+/g, '.').replace(/\.+$/, '');
    };
    var moveElementsByBreakpoint = function() {
        if (elementsData.length === 0) {
            initElementsData();
        }
        if (elementsData.length < 1){
            return;
        }
        var breakPoint     = silvercart.theme.getCurrentBreakpoint();
        var breakpointSort = { 'xs':  1, 'sm':  2, 'md':  3, 'lg':  4, 'xl':  5, 'xxl': 6};
        $.each(elementsData, function (index, item) {
            var item           = $(item);
            var itemObj        = item.get(0);
            var itemMoveFrom   = itemObj.moveFrom;
            var itemMoveTo     = itemObj.moveTo;
            var itemBreakPoint = itemObj.breakpoint;
            var itemExtraClass = itemObj.extraClass;
            var itemElement    = $(itemObj.selector);

            if (itemMoveFrom && itemMoveTo && itemBreakPoint) {
                var complexBreak  = itemBreakPoint.split('-').length > 0 ? itemBreakPoint.split('-') : itemBreakPoint;
                var currCondition = false;

                if (complexBreak.constructor === Array) {
                    var point     = complexBreak[0];
                    var condition = complexBreak[1];

                    switch (condition) {
                        case "up":
                            currCondition = breakpointSort[breakPoint] > breakpointSort[point] ? true : false;
                            break;
                        case "down":
                            currCondition = breakpointSort[breakPoint] < breakpointSort[point] ? true : false;
                            break;
                        default:
                            currCondition = false;
                    }
                } else {
                    currCondition = itemBreakPoint === point ? true : false;
                }
                var parentClass    = itemElement.parent().prop('class');
                var parentSelector = '.' + parentClass.replace(/\s+/g, '.').replace(/\.+$/, '');

                if (currCondition === true) {
                    if (parentSelector !== itemMoveTo) {
                        if (itemExtraClass){
                            itemElement.addClass(itemExtraClass);
                        }
                        itemElement.appendTo(itemMoveTo);
                    }
                } else if (parentSelector !== itemMoveFrom) {
                    if (itemExtraClass){
                        itemElement.removeClass(itemExtraClass);
                    }
                    itemElement.appendTo(itemMoveFrom);
                }
            }
        });
    };
    return {
        init: init,
        moveElementsByBreakpoint: moveElementsByBreakpoint
    };
})();

$(document).ready(function(){
    var screenIsBigEnough = true;
    if (typeof window.matchMedia === 'function') {
        screenIsBigEnough = window.matchMedia("(min-width: 768.1px)");
    }

    if (screenIsBigEnough) {
        silvercart.theme.initTooltips();
        silvercart.theme.addStickyElements();
    } else {
        silvercart.theme.removeStickyElements();
    }

    silvercart.theme.initShoppingCartDropdown();
    silvercart.theme.initCarousels();
    silvercart.theme.initFancybox();
    silvercart.theme.initLazyloadImages();

    var lastScrollYPosition = 0,
        tick                = false,
        supportPageOffset   = window.pageXOffset !== undefined,
        isCSS1Compat        = ((document.compatMode || "") === "CSS1Compat");

    window.addEventListener('scroll', function (e) {
       lastScrollYPosition = supportPageOffset ? window.pageYOffset : isCSS1Compat ? document.documentElement.scrollTop : document.body.scrollTop;
        if (!tick) {
            window.setTimeout(function() {
                silvercart.theme.toggleBackToTop(lastScrollYPosition);
                silvercart.theme.toggleFixMainNavbar(lastScrollYPosition);
                tick = false;
            }, 100);
            tick = true;
        }
    });

    if ($('input[name="InvoiceAddressAsShippingAddress"]').is(':checked')) {
        $('#ShippingAddressFields').hide();
    }
    $(document).on('click', 'input[name="InvoiceAddressAsShippingAddress"]', function() {
        $('#ShippingAddressFields').slideToggle();
    });
});