if (typeof (ss) == 'undefined' || typeof (ss.i18n) == 'undefined') {
    console.error('Class ss.i18n not defined');
}

/**
 * overwride parent Bootstrap columns if div content overflow element width
 * 
 * @param {string} element
 * @returns {string} valid css Class
 */
var changeParentClassWidthOverflow = function (el) {
    var element = $(el),
            windowWidth = '',
            colClass = '';

    switch (true) {
        case window.innerWidth > 1200:
            windowWidth = 'lg';
            break;
        case window.innerWidth > 992:
            windowWidth = 'md';
            break;
        case window.innerWidth > 768:
            windowWidth = 'sm';
            break;
        default:
            windowWidth = 'xs';
    }
    element.each(function () {
        if ($(this)[0].scrollWidth > $(this).innerWidth()) {
            // Text has over-flowed [class*='row-equalheight-'] "[class*=\'col-"+ windowWidth +"-\']";
            switch (windowWidth) {
                case  'lg':
                    colClass = "[class*=\'col-" + windowWidth + "-\']";
                    break;
                case  'md':
                    colClass = "[class*=\'col-" + windowWidth + "-\']";
                    break;
                case  'sm':
                    colClass = "[class*=\"col-" + windowWidth + "-\"]";
                    break;
                case  'xs':
                    colClass = "[class*=\"col-" + windowWidth + "-\"]";
                    break;
                default:
                    colClass = '';
            }
            if (colClass !== '') {
                $(this).closest('div').removeClass(colClass);
                $(this).parent().removeClass(colClass);
                $(this).parent().addClass('col-' + windowWidth + '-12');
            }
        }

    });
};
/**
 * Equals div heights from some div class to another
 * 
 * @param {string} container
 * @param {string} element
 * 
 * @returns {int}  with height of element 
 */
var equalheights = function  (cont, elem) {
    var curElHeight = 0,
            elMaxHeight = 0,
            containerDivs = new Array(),
            container = $(cont),
            containerHeight = 0,
            element = $(elem),
            containerDivs = '';
   if (container.length === 0) { return; }
    container.each(function () {
        if ($(this).find(element).length > 0) {
            containerDivs = $(this).find(element);
        }
        var elMaxHeight = 0,
                currElement = 0,
                n = 0;
        if (containerDivs.length > 0) {
            for (n = 0; n <= containerDivs.length; n++) {
                curElHeight = $(containerDivs[n]).height();
                if (curElHeight > elMaxHeight) {
                    elMaxHeight = curElHeight;
                }
            }
            for (n = 0; n <= containerDivs.length; n++) {
                if (elMaxHeight > 0) {
                    currElement = $(containerDivs[n]);
                    currElement.height(elMaxHeight);
                }
            }
        }
    });
};
/**
 * create valid bootstrap 4 forms inputs from silvercart 3 forms
 * 
 * @returns {undefined}
 */
function createBootstrapForms() {
    var formFields = document.querySelectorAll('input[type=text]:not([class="form-control"]), input[type=password], textarea, select'),i;
    if (formFields.length === 0) { return; }

  for (i = 0; i < formFields.length; i++) {
        if (!$(formFields[i]).hasClass('form-control')) {
            $(formFields[i]).addClass('form-control');
        }
        if ($(formFields[i]).closest('.form-group').hasClass('error')) {
            if (!$(formFields[i]).closest('.form-group').hasClass('has-danger')) {
                $(formFields[i]).closest('.form-group').addClass('has-danger');
                $(formFields[i]).addClass('form-control-success');
            }
        }
    };
}
/**
 * show bootstrap 4 tooltips needs tether.min.js
 * 
 * @returns tooltip on hover
 */
function showtooltip() {
    var elementsTooltip = document.querySelectorAll('[data-toggle=tooltip]');
    //console.log(toolTips);
    if (elementsTooltip.length === 0) {
        return;
    }
    $('[data-toggle="tooltip"]').tooltip({animation: false});
}
/**
 * show/hide div with cart content table
 * 
 * @returns html 
 */
function cartContent() {
    $('.cart-content').find('table').click(function (e) {
        e.stopPropagation();
    });
}
/** 
 * flexslider on home page
 *  
 */
function flexSlideShow() {
    var flexslider = $('.flexslider');
    if (flexslider.length > 0 &&
        typeof flexslider.flexslider !== 'undefined') {
        flexslider.flexslider({
            animation: "slide",
            slideshowSpeed: 4000,
            directionNav: false,
            pauseOnHover: true,
        });
    }
}
function productSlider() {
    $('.carousel').carousel();
}
function productFancyBox() {
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
            closeBtn: '<a title="Close" class="fancybox-close" href="javascript:;" style="background-image:none; "><span class="fa-stack fa-lg"><i class="fa fa-square fa-stack-2x"></i><i class="fa fa-close fa-stack-1x fa-inverse"></i></span></a>',
            next: '<a class="fancybox-nav fancybox-next btn btn-default" title="Next" href="javascript:;"><span class="fa-stack fa-lg" style="background-image:none"><i class="fa fa-square fa-stack-2x"></i><i class="fa fa-step-forward fa-stack-1x fa-inverse"></i></span></a>',
            prev: '<a class="fancybox-nav fancybox-prev btn btn-default" title="Previous" href="javascript:;"><span class="fa-stack fa-lg" style="background-image:none"><i class="fa fa-square fa-stack-2x"></i><i class="fa fa-step-backward fa-stack-1x fa-inverse"></span></i></a>'
        },
        helpers: {
            title: {
                type: 'inside'
            }
        }
    });
}
/**
 * get botstrap active column class on resize 
 * 
 * @returns {undefined}
 */
function getBootstrapCurrentBreakpoint() {
    var id = 'deviceInfo',
            type = "Mobile (xs)",
            currClass = 'xs',
            widthType = 'innerWidth',
            width,
            breakpoint = [];

    if (!('innerWidth' in window)) {
        widthType = 'clientWidth';
        window = document.documentElement || document.body;
    }
    width = window[widthType];
    switch (true) {
        case (width >= 1200):
            type = "Extra Large Desktop (xl)";
            currClass = "xl";
            break;
        case (width >= 992):
            type = "Large Desktop (lg)";
            currClass = "lg";
            break;
        case (width >= 768):
            type = "Medium Desktop (md)";
            currClass = "md";
            break;
        case (width >= 540):
            type = "Tablet (sm)";
            currClass = "sm";
            break;
        default:
    }

    breakpoint = {
        'class': currClass,
        'type': type
    };
    return breakpoint;
}
/**
 * Repositoning elements marked with "replace-element" class and data- attributus
 * <element class="replace-element" data-moveto="mobile-quicksearch" data-breakpoint="md-down" data-extraclass="some-class">
 * to parent elements
 * <element class="mobile-quicksearch otherClass someClass">
 * @type custom_L227.customAnonym$8|Function
 * @author Jiri Ripa <jripa@pixeltricks.de>
 */
var elementsToReplace = (function () {
    /**
     * CSS ClassNAme for Elements to be Replace
     * 
     * @type @call;$
     */
    var replacer = $('.replace-element');
    /**
     * Array with All Elements to resort
     * @type Array
     */
    var element_array = [];
    /**
     * get All Elements to Replace
     * 
     * @returns {Array{Obj}
     */
    var getElementsToReplace = function () {
        $.each(replacer, function (index, item) {
            var item = $(item);
            var data = {};
            var elReplaceToClass = $('.' + item.data('moveto')).prop('class');
            
            data.index = index;
            data.moveto = item.data('moveto');
            data.breakpoint = item.data('breakpoint');  
            data.elReplaceFromClass = combineClassNames(item.parent().prop('class'));
            data.elReplaceToClass = combineClassNames(elReplaceToClass);
            data.elSelfClass = combineClassNames(item.prop('class'));
            data.extraClass = item.data('extraclass');
            
            element_array.push(data);
        });
        return element_array;
    };
    var combineClassNames = function combineClassNamesString(elClasses) {
        if (elClasses === '' ||
            typeof elClasses === 'undefined'){
            return '';
        }
        return  '.' + elClasses.replace(/\s+/g, '.').replace(/\.+$/, '');
    };
    /**
     * replace Arry elements with replace-element class  positions on Bootstrap breakpoints
     * 
     * @param {array} elements 
     * @returns {undefined}
     * @author Jiri Ripa <jripa@pixeltricks.de>
     */
    var getElementsByBreakpoint = function replaceElementByBreakpoint(elements) {
        if (elements.length < 1){
            return;
        } 
        var element_array = [];
        var breakPoint = getBootstrapCurrentBreakpoint();
        var breakpointSort = [];

        // All Bootstrap Breakpoints to Sorting by Key
        breakpointSort = {
            'xs': 1,
            'sm': 2,
            'md': 3,
            'lg': 4,
            'xl': 5
        };
        $.each(elements, function (index, item) {
            var item = $(item);
            var itemObj = item.get(0);
            var elReplaceFromClass = itemObj.elReplaceFromClass;
            var elReplaceToClass = itemObj.elReplaceToClass;

            if (itemObj.elReplaceFromClass && itemObj.elReplaceToClass && itemObj.breakpoint) {

                var complexBreak = itemObj.breakpoint.split('-').length > 0 ? itemObj.breakpoint.split('-') : itemObj.breakpoint;
                var currCondition = false;

                if (complexBreak.constructor === Array) {
                    var point = complexBreak[0];
                    var condition = complexBreak[1];

                    switch (condition) {
                        case ("up"):
                            operator = '>'
                            currCondition = breakpointSort[breakPoint.class] > breakpointSort[point] ? true : false;
                            break;
                        case ("down"):
                            operator = '<'
                            currCondition = breakpointSort[breakPoint.class] < breakpointSort[point] ? true : false;
                            break;
                        default:
                            operator = '=='
                            currCondition = false;
                    }
                } else {
                    //replace element just on specific point
                    currCondition = itemObj.breakpoint == point ? true : false;
                }
                itemHtmlElement = $(itemObj.elSelfClass);
                curElementParentClass = itemHtmlElement.parent().prop('class');
                curElementParentClass = '.' + curElementParentClass.replace(/\s+/g, '.').replace(/\.+$/, '');

                if (currCondition === true) {
                    if (curElementParentClass === itemObj.elReplaceToClass) {
                        // console.log(curElementParentClass, itemObj.elReplaceToClass);
                    } else {
                        //Move to Replace position
                        if (itemObj.extraClass){
                          itemHtmlElement.addClass(itemObj.extraClass).appendTo(elReplaceToClass);  
                        }else{
                          itemHtmlElement.appendTo(elReplaceToClass);  
                        }
                    }
                } else {
                    if (curElementParentClass === itemObj.elReplaceFromClass) {
                        //  console.log(curElementParentClass, itemObj.elReplaceFromClass);
                    } else {
                        //back apend Search element
                         if (itemObj.extraClass){
                          itemHtmlElement.removeClass(itemObj.extraClass).appendTo(itemObj.elReplaceFromClass); 
                         }else{
                          itemHtmlElement.appendTo(itemObj.elReplaceFromClass);   
                         }
                    }
                }
            }
        });
    };
    // Public API
    return {
        getElementsToReplace: getElementsToReplace,
        getElementsByBreakpoint: getElementsByBreakpoint
    };
})();

/**
 *  just for testing responsibility / shows div with current Bootstrap Media Breakpoint
 * 
 */
function showBootstrapCurrentBreakpoint() {
    var id = 'deviceInfo',
            container = document.getElementById(id),
            breakpoint = getBootstrapCurrentBreakpoint();

    if (!container) {
        container = document.createElement('div');
        container.setAttribute("id", id);
        container.setAttribute("style", "position:fixed; right:0px; bottom: 0px; padding:10px; z-index:9999;background:rgba(0,255,0,0.6)");
        document.body.insertBefore(container, document.body.firstChild);
    }

    container.innerHTML = breakpoint['type'];
    $('body').removeClass("xs sm md lg xl");
    $('body').addClass(breakpoint['currClass']);

}
;
/**
 * sticky Content and side bar
 * 
 * @returns {css position}
 */
function verticalStickySidebar() {
    if ($('aside').length) {
        $('#main #content-main, aside').theiaStickySidebar({
            'additionalMarginTop': $('.navbar').height() + 15,
            'disableOnResponsiveLayouts': false,
            'minWidth': 766.1,
        });
    }
}
;
/**
 * fix bootstrap Main Navbar Static on Scroll 
 * 
 * @returns {undefined}
 */
function fixOffcanvasButtonOnScroll() {

    if ($('.offcanvasbutton').length === 0) {
        return;
    }
    $(document).scroll(function () {
        var scrollTop = $(document).scrollTop();
        if (scrollTop >= $('header').height()) {
            // console.log(scrollTop);
            //$('.offcanvasbutton').removeClass('navbar-static-top').addClass('navbar-fixed-top');
            $('.offcanvasbutton').css({'position': 'fixed', 'top': '5px', 'right': '5px', 'z-index': 10000});
        } else {
            //$('.offcanvasbutton').removeClass('navbar-fixed-top').addClass('navbar-static-top');
            $('.offcanvasbutton').css('position', 'static');
        }
    });
}
;
/**
 * add absolute positioned Link to scroll page back to top
 *   
 * @returns boolean
 */
function backToTop(scrollPos) {
    var totop = $('#totop');
    totop.click(function () {
        $('html, body').stop(true, false).animate({scrollTop: 0}, 1000);
        return false;
    });
    if (scrollPos > 1000) {
        if (totop.length === 0) {
            $('body').append('<span id="totop" title="Click to go Up" style="display:none;position:fixed;bottom:10px;right:10px;cursor:pointer;cursor:hand;z-index: 2;"><i class="fa fa-4x fa-chevron-circle-up"></i></span>');
        }
        totop.fadeIn();
    } else {
        totop.fadeOut();
    }
}
function collapseHeaderWidgets() {
    if ($(window).width() <= 992) {
        $('#collapseHeaderWidgets').removeClass('in');
    } else {
        $('#collapseHeaderWidgets').addClass('in');
        $('#collapseHeaderWidgets').css('height', 'auto');
    }
}

/**
 * fix bootstrap Main Navbar Static on Scroll 
 * 
 * @returns {undefined}
 */
function fixMainNavbarOnScroll(scrollPos) {
        var scrollTop = scrollPos;
        var navbarHeight = $('.navbar').height();

        if (scrollTop >= $('header').height()) {
            $('.navbar').removeClass('navbar-static-top').addClass('navbar-fixed-top');
            // $('.navbar').css('position', 'fixed');
           // $('body').css('margin-top', +navbarHeight + 'px');
        } else {
            $('.navbar').removeClass('navbar-fixed-top').addClass('navbar-static-top');
            //  $('.navbar').css('position', 'static');
           // $('body').css('margin-top', '0');
        }
}

/**
 * handle click navbar
 * This script will active Triple level multi drop-down menus in Bootstrap 3.*
 */
function subNavbarClickHandler() {
    $('#mainnav ul.dropdown-menu [data-toggle=dropdown]').on('click', function (event) {
        // Avoid following the href location when clicking
        event.preventDefault();
        // Avoid having the menu to close when clicking
        event.stopPropagation();
        // If a menu is already open we close it
        $('ul.dropdown-menu [data-toggle=dropdown]').parent().removeClass('open');
        // opening the one you clicked on
        $(this).parent().addClass('open');
    });
}

/* ========================================================================
 * Animate.css Menu Javascript
 * 
 * ========================================================================
 * Copyright 2015 Bootbites.com (unless otherwise stated)
 * For license information see: http://bootbites.com/license
 * ======================================================================== */

/**
 * handle type of action hover/click
 * 

function menuToogleType() {
    var navbarToggle = '.navbar-toggler'; // name of navbar toggle, BS3 = '.navbar-toggle', BS4 = '.navbar-toggler'
    $('#mainnav .dropdown,#mainnav .dropup').each(function () {
        var dropdown = $(this),
                dropdownToggle = $('[data-toggle="dropdown"]', dropdown),
                dropdownHoverAll = dropdownToggle.data('dropdown-hover-all') || false;
        //for hover change to 
        //dropdownHoverAll = true;
        // or add this data-dropdown-hover-all="true" to link data-toggle="dropdown"
        // Mouseover
        dropdown.hover(function () {
            // var navbarToggle = '.navbar-toggler'; // name of navbar toggle, BS3 = '.navbar-toggle', BS4 = '.navbar-toggler'
            var notMobileMenu = $(navbarToggle).is(':hidden') && $(navbarToggle).css('display') === 'none';
            // console.log(dropdownHoverAll, notMobileMenu);
            if (dropdownHoverAll == false || (dropdownHoverAll == true && notMobileMenu == false)) {
            } else {
                dropdownToggle.trigger('click');
            }
        });
    });
} 
 */
function equalizeProductColumnHeight() {
    var height = 0;
  
     if ($('.row-eq-height').length === 0) {
        return;
    }
    $('.row-eq-height').each(function () {
        height = 0;
        $('.card-product,.card', $(this)).each(function () {
            $(this).css('height', 'auto');
            if (height < $(this).height()) {
                height = $(this).height();
            }
        });
        $('.card-product,.card', $(this)).each(function () {
            $(this).css('height', height);
        });
    });
}

function isSupportedCssProperty(prop, prefixed, elem) {

    var ucProp = prop.charAt(0).toUpperCase() + prop.slice(1),
        props = (prop + ' ' + cssomPrefixes.join(ucProp + ' ') + ucProp).split(' ');

    if (is(prefixed, "string") || is(prefixed, "undefined")) {
        return testProps(props, prefixed);

    } else {
        props = (prop + ' ' + (domPrefixes).join(ucProp + ' ') + ucProp).split(' ');
        return testDOMProps(props, prefixed, elem);
    }
}

/**
 * init functions on document ready
 * 
 */
$(document).ready(function () {
    var lastScrollYPosition = 0,
    tick = false,  // Track whether call is currently in process
    supportPageOffset = window.pageXOffset !== undefined,
    isCSS1Compat = ((document.compatMode || "") === "CSS1Compat"),
    resizeTimer = 0;

    fixOffcanvasButtonOnScroll();
    cartContent();
    productSlider();
    productFancyBox();
    createBootstrapForms();
    collapseHeaderWidgets();
   //menuToogleType();

    window.addEventListener('scroll', function (e) {
       lastScrollYPosition = supportPageOffset ? window.pageYOffset : isCSS1Compat ? document.documentElement.scrollTop : document.body.scrollTop;
        //lastScrollYPosition = window.scrollY ? window.scrollY : window.pageYOffset;
        if (!tick) {
            window.setTimeout(function() {
                backToTop(lastScrollYPosition);
                fixMainNavbarOnScroll(lastScrollYPosition);
                tick = false;
            }, 100);
            tick = true;
        }
    });

    $('[data-toggle="offcanvas"]').click(function () {
        $('.row-offcanvas').toggleClass('active');
    });
    $('.product-tab .nav-link').click(function () {
        $(this).closest('.theiaStickySidebar').css("position", "static");
    });

    // Repositoning elements marked with "replace-element" class and data- attributus
    var elToReplace = elementsToReplace.getElementsToReplace();
    elementsToReplace.getElementsByBreakpoint(elToReplace);

    $(window).on('resize', function (e) {
        clearTimeout(resizeTimer);
        resizeTimer = setTimeout(function () {
            $('.row-offcanvas').removeClass("active");
            collapseHeaderWidgets();
            // showBootstrapCurrentBreakpoint();
            elementsToReplace.getElementsByBreakpoint(elToReplace);
        }, 100);
    });

    // verticalStickySidebar();
    // only for desktop (screen width higher than 767px to show bootstrap tooltips and sticky Sidebar
    var screencheck = window.matchMedia("(min-width: 768.1px)");
    var StickyElements = 0;
    var StickyElement = $('aside').innerHeight() < $('#content-main').innerHeight() ? $('aside') : $('#content-main');
    if (!window.matchMedia || screencheck) {
        StickyElement.addClass('sticky');
        StickyElements = document.querySelectorAll('.sticky');
        Stickyfill.add(StickyElements);
        showtooltip();
    } else {
        StickyElement.removeClass('sticky');
        Stickyfill.remove(StickyElements);
    }
    // lazy Load Images if exists
    var lazyImages = document.querySelectorAll("img.lazyload");
    if (lazyImages.length > 0) {
        lazyload(lazyImages);
    }
});