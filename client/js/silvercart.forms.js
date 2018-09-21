var silvercart       = silvercart       ? silvercart       : [];
    silvercart.forms = silvercart.forms ? silvercart.forms : [];

silvercart.forms.initAddressForm = function(form)
{
    var formSelector    = "#" + form.attr('id'),
        hideAddressData = '.absolute-address-data';
    if ($(formSelector + ' .optionset input[name="IsPackstation"]:checked').val() === "0"
     || $(formSelector + ' .optionset input[name="Shipping_IsPackstation"]:checked').val() === "0"
    ) {
        hideAddressData = '.packstation-address-data';
    }
    var packstationSelector = formSelector + ' .optionset input[name="IsPackstation"], .optionset input[name="Shipping_IsPackstation"]',
        initPackstation     = function() {
            var slideIn          = '.packstation-address-data';
            var slideOut         = '.absolute-address-data';
            var requiredDisabled = $(formSelector + ' ' + slideIn + ' input');
            
            if ($(formSelector + ' .optionset input[name="IsPackstation"]:checked').val() === "0"
             || $(formSelector + ' .optionset input[name="Shipping_IsPackstation"]:checked').val() === "0"
            ) {
                slideIn          = '.absolute-address-data';
                slideOut         = '.packstation-address-data';
                requiredDisabled = $(formSelector + ' ' + slideIn + ' input[data-required="required"]');
            }
            var requiredEnabled  = $(formSelector + ' ' + slideOut + ' input[required="required"]');
            
            requiredEnabled.attr('data-required', 'required');
            requiredEnabled.removeAttr('required');
            requiredDisabled.attr('required', 'required');
            requiredDisabled.removeAttr('data-required');
            
            $(formSelector + ' ' + slideOut).slideUp('slow');
            $(formSelector + ' ' + slideIn).slideDown('slow');
        };
    $(formSelector + ' ' + hideAddressData).hide();
    $(formSelector + ' ' + hideAddressData + ' input[required="required"]').attr('data-required', 'required');
    $(formSelector + ' ' + hideAddressData + ' input[required="required"]').removeAttr('required');
    if (typeof $(packstationSelector).live === 'function') {
        $(packstationSelector).live('change', initPackstation);
    } else if (typeof $(packstationSelector).on === 'function') {
        $(packstationSelector).on('change', initPackstation);
    }
};

$(document).ready(function() {
    $('.sc-address-form-with-packstation').each(function() {
        silvercart.forms.initAddressForm($(this));
    });
});