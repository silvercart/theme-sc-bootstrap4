<% if $IncludeFormTag %>
<form {$addExtraClass('product-add-cart-detail form').AttributesHTML}>
<% end_if %>
<% include SilverCart/Forms/CustomFormMessages %>
<% loop $HiddenFields %>
    {$Field}
<% end_loop %>
    <div class="margin-top form-group <% if $Product.isInCart %> alert alert-warning<% end_if %>">
        {$CustomFormSpecialFields}
        <div id="{$FormName}_productQuantity_Box" class="input-group quantity">
<% with $Fields.dataFieldByName(productQuantity) %>
            <input id="{$ID}" class="<% if $Top.Product.isInCart %>form-control-info<% end_if %>form-control pull-xs-right text-right input-nano" type="text" value="{$Value}" name="{$Name}">
<% end_with %>
<% loop $Actions %>
            <span class="input-group-btn">
                <button title="{$Up.Product.Title} <%t SilverCart\Model\Product\Product.ADD_TO_CART 'add Cart' %>" class="btn btn-large btn-primary" data-placement="top" data-toggle="tooltip">
                    <span class="fa fa-shopping-cart"></span> <span class="full-shopping-cart-title hidden-md-down">{$Form.SubmitButtontitle}</span><span class="short-shopping-cart-title hidden-xs-down hidden-lg-up"><%t SilverCart\Model\Pages\Page.CART 'Cart' %></span>
                </button>
            </span>
<% end_loop %>
        </div>
<% if $Product.isInCart %>
        <div class="alert alert-info silvercart-add-cart-form-hint">{$Product.QuantityInCartString}</div>
<% end_if %>
    </div>
<% if $IncludeFormTag %>
</form>
<% end_if %>