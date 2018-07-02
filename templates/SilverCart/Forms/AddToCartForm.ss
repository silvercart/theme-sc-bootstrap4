<% if $IncludeFormTag %>
<form {$addExtraClass('form form-inline addcartform clearfix').AttributesHTML}>
<% end_if %>
<% include SilverCart/Forms/CustomFormMessages %>
<% loop $HiddenFields %>
    {$Field}
<% end_loop %>
    <div class="form-group">
        {$CustomFormSpecialFields}
        <div id="{$FormName}_productQuantity_Box" class="input-group quantity">
    <% with $Fields.dataFieldByName('productQuantity') %>
            <input id="{$ID}" class="form-control input-nano" type="text" placeholder="{$Value}" value="{$Value}" name="{$Name}">
    <% end_with %>
    <% loop $Actions %>
            <span class="input-group-btn">
                <button title="{$Up.Product.Title} <%t SilverCart\Model\Product\Product.ADD_TO_CART 'add Cart' %>" class="btn btn-primary" data-placement="left" data-toggle="tooltip"><i class="fa fa-shopping-cart"></i></button>
            </span>
    <% end_loop %>
        </div>
<% if $Product.isInCart %>
        <p class="alert alert-info silvercart-add-cart-form-hint">{$Product.QuantityInCartString}</p>
<% end_if %>
   </div>
</form>