<% if $IncludeFormTag %>
<form {$addExtraClass('product-add-cart-detail').addErrorClass('was-validated').AttributesHTML}>
<% end_if %>
<% include SilverCart/Forms/CustomFormMessages %>
<% loop $HiddenFields %>
    {$Field}
<% end_loop %>
    {$CustomFormSpecialFields}
    <div id="{$HolderID}" class="input-group quantity">
    <% with $Fields.dataFieldByName(productQuantity) %>
        <input id="{$ID}" class="form-control text-right" type="text" value="{$Value}" name="{$Name}">
    <% end_with %>
    <% loop $Actions %>
        <span class="input-group-append">
            <button title="{$Up.Product.Title} <%t SilverCart\Model\Product\Product.ADD_TO_CART 'add Cart' %>" class="btn btn-large btn-primary" data-placement="top" data-toggle="tooltip">
                <span class="fa fa-shopping-cart"></span> <span class="full-shopping-cart-title hidden-md-down">{$Form.SubmitButtontitle}</span><span class="short-shopping-cart-title hidden-xs-down hidden-lg-up"><%t SilverCart\Model\Pages\Page.CART 'Cart' %></span>
            </button>
        </span>
    <% end_loop %>
    </div>
<% if $Product.isInCart %>
    <div class="alert alert-info mt-1 silvercart-add-cart-form-hint"><span class="fa fa-info-circle"></span> {$Product.QuantityInCartString}</div>
<% end_if %>
<% if $IncludeFormTag %>
</form>
<% end_if %>