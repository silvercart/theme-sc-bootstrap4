var silvercart                   = silvercart                   ? silvercart                   : [];
    silvercart.attributes        = silvercart.attributes        ? silvercart.attributes        : [];
    silvercart.attributes.filter = silvercart.attributes.filter ? silvercart.attributes.filter : [];
    
silvercart.attributes.filter.CallbackFunction = function() {
    var lazyImages = document.querySelectorAll("img.lazyload");
    if (lazyImages.length > 0) {
        lazyload(lazyImages);
    }
};