<% if $CurrentPage.EditableShoppingCart %>
<div class="clearfix">
    <h1 class="float-left pull-left margin-bottom">{$CurrentPage.Title}</h1>
    <% if $CurrentMember.ShoppingCart.isFilled %>
    <div class="float-right pull-right silvercart-shopping-cart-toolbar-top margin-bottom">
        <a class="btn btn-secondary" title="<%t SilverCart\Model\Pages\Page.CONTINUESHOPPING 'Continue shopping' %>" href="{$CurrentPage.PageByIdentifierCode('SilvercartFrontPage').Link}#1"><span class="fa fa-caret-left"></span> <%t SilverCart\Model\Pages\Page.CONTINUESHOPPING 'Continue shopping' %></a>
        <% if $CurrentMember.ShoppingCart.IsMinimumOrderValueReached %>
            <% with $CurrentPage.PageByIdentifierCode('SilvercartCheckoutStep') %>
        <a href="{$Link}" title="<%t SilverCart\Model\Pages\Page.GOTO 'go to {title}' title=$Title.XML %>" class="btn btn-primary"><%t SilverCart\Model\Pages\Page.CHECKOUT 'Checkout' %> <span class="fa fa-caret-right"></span></a>
            <% end_with %>
        <% end_if %>
    </div>
    <% end_if %>
</div>
    <% if $registeredModules %>
<div class="shoppingCartActions">
        <% loop $registeredModules %>
            <% if $ShoppingCartActions %>
                <% loop $ShoppingCartActions %>
    <hr>{$moduleOutput}
                <% end_loop %>
            <% end_if %>
        <% end_loop %>
</div>
    <% end_if %>
<% end_if %>
<div class="silvercart-shopping-cart-full margin-top">
    <table class="table table-sm">
        <% include SilverCart/Model/Pages/ShoppingCartFull_TableHead %>
        <tbody>
    <% loop $ShoppingCartPositions %>
        <% include SilverCart/Model/Pages/ShoppingCartFull_Position %>
    <% end_loop %>
        </tbody>
    </table>
</div>
<% if $hasNotice %>
<div class="alert alert-info">{$getShoppingCartPositionNotices}</div>
<% end_if %>
<div class="row">
    <div class="col-lg-8 offset-lg-4 col-md-9 offset-md-3 col-sm-12 col-xs-12">
        <div class="cart-receipt">
            <table class="table table-sm">
                <% include SilverCart/Model/Pages/ShoppingCartFull_RegisteredModulesGross %>
                <% include SilverCart/Model/Pages/ShoppingCartFull_FeesOrChargesOrModulesGross %>
<% if $addToEditableShoppingCartTable %>
    <% loop $addToEditableShoppingCartTable %>
                <tr>
                    <td colspan="3">{$TitleField}&nbsp;</td>
                    <td colspan="3" class="text-right">{$RightTitleField}&nbsp;</td>
                    <td class="text-right">{$PriceField.Nice}</td>
                </tr>
    <% end_loop %>
<% end_if %>
            </table>
<% if $ShippingMethod.ShippingFee.PostPricing %>
            <div class="alert alert-block"><b>* <%t SilverCart\Model\Pages\Page.PLUS_SHIPPING 'plus shipping' %>, <%t SilverCart\Model\Shipment\ShippingFee.POST_PRICING_INFO 'Manual calculation of shipping fees after order.' %></b></div>
<% end_if %>
        </div>
    </div>
</div>
<% if $CurrentPage.EditableShoppingCart && $CurrentMember.ShoppingCart.isFilled %>
<div class="clearfix">
    <div class="float-right pull-right silvercart-shopping-cart-toolbar-bottom last">
        <a class="btn btn-secondary" title="<%t SilverCart\Model\Pages\Page.CONTINUESHOPPING 'Continue shopping' %>" href="{$CurrentPage.PageByIdentifierCode('SilvercartFrontPage').Link}#1"><span class="fa fa-caret-left"></span> <%t SilverCart\Model\Pages\Page.CONTINUESHOPPING 'Continue shopping' %></a>
    <% if $CurrentMember.ShoppingCart.IsMinimumOrderValueReached %>
        <% with $CurrentPage.PageByIdentifierCode('SilvercartCheckoutStep') %>
        <a href="{$Link}" title="<%t SilverCart\Model\Pages\Page.GOTO 'go to {title}' title=$Title.XML %>" class="btn btn-primary"><%t SilverCart\Model\Pages\Page.CHECKOUT 'Checkout' %> <span class="fa fa-caret-right"></span></a>
        <% end_with %>
    <% end_if %>
    </div>
</div>
<% end_if %>