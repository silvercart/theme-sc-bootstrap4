<% if $IncludeFormTag %>
<form {$addExtraClass('form form-inline add-cartform-list clearfix').addErrorClass('was-validated').AttributesHTML}>
<% end_if %>
<% include SilverCart/Forms/CustomFormMessages %>
<% loop $HiddenFields %>
    {$Field}
<% end_loop %>
    {$BeforeFormContent}
    <div class="form-group">
        {$CustomFormSpecialFields}
    <% with $Fields.dataFieldByName('productQuantity') %>
        <div id="{$HolderID}" class="input-group quantity">
            <input type="text" id="{$ID}" class="form-control form-control-sm text-right" value="{$Value}" name="{$Name}" />
    <% end_with %>
    <% loop $Actions %>
            <span class="input-group-btn">
                <button title="{$Up.Product.Title} <%t SilverCart\Model\Product\Product.ADD_TO_CART 'add Cart' %>" class="btn btn-primary" data-placement="top" data-toggle="tooltip">
                    <span class="fa fa-shopping-cart"></span><span class="short-shopping-cart-title hidden-lg-down"> <%t SilverCart\Model\Pages\Page.CART 'Cart' %></span>
                </button>
            </span>
    <% end_loop %>
        </div>
<% if $Product.isInCart %>
        <div class="alert alert-info silvercart-add-cart-form-hint">{$Product.QuantityInCartString}</div>
<% end_if %>
    </div>
    {$AfterFormContent}
<% if $IncludeFormTag %>
</form>
<% end_if %>