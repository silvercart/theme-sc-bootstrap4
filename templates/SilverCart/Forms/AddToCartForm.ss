<% if $IncludeFormTag %>
<form {$addExtraClass('form-inline product-add-cart').addErrorClass('was-validated').AttributesHTML}>
<% end_if %>
<% include SilverCart/Forms/CustomFormMessages %>
<% loop $HiddenFields %>
    {$Field}
<% end_loop %>
    {$CustomFormSpecialFields}
    <div id="{$HolderID}" class="input-group quantity">
    <% with $Fields.dataFieldByName('productQuantity') %>
        <input id="{$ID}" class="form-control text-right" type="text" placeholder="{$Value}" value="{$Value}" name="{$Name}">
    <% end_with %>
    <% loop $Actions %>
        <span class="input-group-append">
            <button title="{$Up.Product.Title} <%t SilverCart\Model\Product\Product.ADD_TO_CART 'add Cart' %>" class="btn btn-primary" data-placement="left" data-toggle="tooltip"><span class="fa fa-shopping-cart"></span></button>
        </span>
    <% end_loop %>
    </div>
<% if $Product.isInCart %>
    <div class="alert alert-info mt-1 silvercart-add-cart-form-hint"><span class="fa fa-info-circle"></span> {$Product.QuantityInCartString}</div>
<% end_if %>
</form>