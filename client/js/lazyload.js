/*!
 * Lazy Load - JavaScript plugin for lazy loading images
 *
 * Copyright (c) 2007-2017 Mika Tuupola
 *
 * Licensed under the MIT license:
 *   http://www.opensource.org/licenses/mit-license.php
 *
 * Project home:
 *   https://appelsiini.net/projects/lazyload
 *
 * Version: 2.0.0-beta.2
 * 
 * updated with Backup for older Browsers, Add Sizes for srcset
 * @version: 2.0.0-beta.2.1
 * @author Jiri Ripa 
 * @since 12.04.2018
 */
;
(function (root, factory) {
    if (typeof exports === "object") {
        module.exports = factory(root);
    } else if (typeof define === "function" && define.amd) {
        define([], factory(root));
    } else {
        root.LazyLoad = factory(root);
    }
}) (typeof global !== "undefined" ? global : this.window || this.global, function (root) {

    "use strict";

   var defaults = {
        src: "data-src",
        srcset: "data-srcset",
        sizes: "data-sizes",
        selector: ".lazyload"
    };

    /**
    * Merge two or more objects. Returns a new object.
    * @private
    * @param {Boolean}  deep     If true, do a deep (or recursive) merge [optional]
    * @param {Object}   objects  The objects to merge together
    * @returns {Object}          Merged values of defaults and options
    */
    var extend = function ()  {

        var extended = {};
        var deep = false;
        var i = 0;
        var length = arguments.length;

        /* Check if a deep merge */
        if (Object.prototype.toString.call(arguments[0]) === "[object Boolean]") {
            deep = arguments[0];
            i++;
        }

        /* Merge the object into the extended object */
        var merge = function (obj) {
            for (var prop in obj) {
                if (Object.prototype.hasOwnProperty.call(obj, prop)) {
                    /* If deep merge and property is an object, merge properties */
                    if (deep && Object.prototype.toString.call(obj[prop]) === "[object Object]") {
                        extended[prop] = extend(true, extended[prop], obj[prop]);
                    } else {
                        extended[prop] = obj[prop];
                    }
                }
            }
        };

        /* Loop through each object and conduct a merge */
        for (; i < length; i++) {
            var obj = arguments[i];
            merge(obj);
        }

        return extended;
    };

    function LazyLoad(images, options) {
        this.settings = extend(defaults, options || {});
        this.images = images || document.querySelectorAll(this.settings.selector);
        var self = this;
        this.nonIntersectionObserverAgent = this.beforeInit();
        if (this.nonIntersectionObserverAgent === false){
            this.loadImages();
            this.registerListener('scroll', function(){ self.loadImages();});
          //  this.registerListener('resize', function(){ self.loadImages();});
        }else{
          this.observer = null;
          this.init();  
        }
    }

    LazyLoad.prototype = {
        beforeInit: function() {
             /* Without observers load everything and bail out early. */
             if (!root.IntersectionObserver) {
                return false;
             }
        },       
        init: function() {
            /* Without observers load everything and bail out early. */
            if (!root.IntersectionObserver) {
               this.loadImages();
                return;
            }
          
            var self = this;
            var observerConfig = {
                root: null,
                rootMargin: "0px",
                threshold: [0]
            };

            this.observer = new IntersectionObserver(function(entries) {
                entries.forEach(function (entry) {
                    if (entry.intersectionRatio > 0) {
                        self.observer.unobserve(entry.target);
                        var src = entry.target.getAttribute(self.settings.src);
                        var srcset = entry.target.getAttribute(self.settings.srcset);
                        var sizes = entry.target.getAttribute(self.settings.sizes);
                        if ("img" === entry.target.tagName.toLowerCase()) {
                            if (src) {
                                entry.target.src = src;
                            }
                            if (srcset) {
                                entry.target.srcset = srcset;
                            }
                            if (sizes) {
                                entry.target.sizes = sizes;
                            }
                            entry.target.setAttribute("class", entry.target.getAttribute("class") + " lazyloaded");
                        } else {
                            entry.target.style.backgroundImage = "url(" + src + ")";
                        }
                    }
                });
            }, observerConfig);

            this.images.forEach(function (image) {
                self.observer.observe(image);
            });
        },
        loadAndDestroy: function () {
            if (!this.settings) { return; }
            this.loadImages();
            this.destroy();
        },
        loadImages: function () {
          //handle images data for older browsers without IntersectionObserver
            if (!this.settings) {return;}
            var self = this,image = '',src,srcset,sizes;

            for (var i = 0; i < this.images.length; i++) {
                image = this.images[i];

                if (image && image.getAttribute("srcset") === null) {

                    src = image.getAttribute(self.settings.src);
                    srcset = image.getAttribute(self.settings.srcset);
                    sizes = image.getAttribute(self.settings.sizes);
                    if ("img" === image.tagName.toLowerCase()) {
                        if (self.isInViewport(image)) {
                            if (src) {
                                image.src = src;
                                image.setAttribute("src", src);
                                //image.removeAttribute('data-src');
                            }
                            if (srcset) {
                                image.srcset = srcset;
                                image.setAttribute("srcset", srcset);
                                image.removeAttribute("data-srcset");
                            }
                            if (sizes) {
                                image.sizes = sizes;
                                image.setAttribute("sizes", sizes);
                                image.removeAttribute("data-sizes");
                            }
                            image.setAttribute("class", image.getAttribute("class") + " lazyloaded");
                        }
                    } else {
                        image.style.backgroundImage = "url(" + src + ")";
                    }
                }
            }
        },
        isInViewport: function (el) {
            var rect = el.getBoundingClientRect();
            var isIn = (rect.bottom >= 0 && rect.right >= 0 && rect.top <= (window.innerHeight || document.documentElement.clientHeight) && rect.left <= (window.innerWidth || document.documentElement.clientWidth));  
            return isIn;
        },
        registerListener: function (event, func) {
              var self = this;
            if (window.addEventListener) {
                window.addEventListener(event, func);
            } else {
                window.attachEvent('on' + event, func);
            }
        },
        destroy: function () {
            if (!this.settings) { return; }
            this.observer.disconnect();
            this.settings = null;
        }
    };

    root.lazyload = function(images, options) {
        return new LazyLoad(images, options);
    };

    if (root.jQuery) {
        var $ = root.jQuery;
        $.fn.lazyload = function (options) {
            options = options || {};
            options.attribute = options.attribute || "data-src";
            new LazyLoad($.makeArray(this), options);
            return this;
        };
    }

    return LazyLoad;
});
