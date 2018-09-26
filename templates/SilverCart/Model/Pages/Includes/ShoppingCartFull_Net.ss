<% if $CurrentPage.EditableShoppingCart %>
<div class="clearfix">
    <h1 class="float-left mb-3">{$CurrentPage.Title}</h1>
    <% if $CurrentMember.ShoppingCart.isFilled %>
    <div class="float-right silvercart-shopping-cart-toolbar-top mb-3">
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
<div class="silvercart-shopping-cart-full mt-3">
    <table class="table responsive-table">
        <% include SilverCart/Model/Pages/ShoppingCartFull_TableHead %>
        <tbody>
    <% loop $ShoppingCartPositions %>
        <% include SilverCart/Model/Pages/ShoppingCartFull_Position %>
    <% end_loop %>
        </tbody>
    </table>
</div>   
<div class="row">
    <div class="col-lg-8 offset-lg-4 col-md-9 offset-md-3 col-sm-12 col-xs-12">
        <div class="cart-receipt">
            <table class="table responsive-table">
                <% include SilverCart/Model/Pages/ShoppingCartFull_RegisteredModulesNet %>
                <% include SilverCart/Model/Pages/ShoppingCartFull_FeesOrChargesOrModulesNet %>
<% if $TaxTotal %>
    <% loop $TaxTotal %>
                <tr>
                    <td colspan="6" class="text-right"><%t SilverCart\Model\Pages\Page.ADDITIONAL_VAT 'Additional VAT' %> ({$Rate}%)</td>
                    <td class="text-right">{$Amount.Nice}<% if $ShippingMethod.ShippingFee.PostPricing %>*<% end_if %></td>
                </tr>
    <% end_loop %>
<% end_if %>
                <tr>
                    <td colspan="6" class="text-right"><h2><%t SilverCart\Model\Pages\Page.TOTAL 'total' %></h2></td>
                    <td class="text-right"><h2>{$AmountTotalNet.Nice}</h2></td>
                </tr>
<% if $registeredModules %>
    <% loop $registeredModules %>
        <% if $IncludedInTotalShoppingCartPositions %>
            <% loop $IncludedInTotalShoppingCartPositions %>
                <tr>
                    <td colspan="6" class="text-right">{$Name}</td>
                    <td class="text-right">{$PriceTotalFormatted}</td>
                </tr>
            <% end_loop %>
        <% end_if %>
    <% end_loop %>
<% end_if %>
        
<% if $CurrentPage.EditableShoppingCart && $addToEditableShoppingCartTable %>
    <% with $addToEditableShoppingCartTable %>
                <tr>
                    <td colspan="1" class="d-none d-sm-table-cell">{$TitleField}&nbsp;</td>
                    <td colspan="2" class="text-right d-none d-sm-table-cell">{$RightTitleField}&nbsp;</td>
                    <td class="text-right" data-title="{$TitleField}">{$PriceField.Nice}</td>
                </tr>
    <% end_with %>
<% end_if %>
            </table>
<% if $ShippingMethod.ShippingFee.PostPricing %><div class="alert alert-block"><b>* <%t SilverCart\Model\Pages\Page.PLUS_SHIPPING 'plus shipping' %>, <%t SilverCart\Model\Shipment\ShippingFee.POST_PRICING_INFO 'Manual calculation of shipping fees after order.' %></b></div><% end_if %>
        </div>
    </div>
</div>
<% if $CurrentPage.EditableShoppingCart && $CurrentMember.ShoppingCart.isFilled %>
<div class="clearfix">
    <div class="float-right mb-3 silvercart-shopping-cart-toolbar-bottom">
        <a class="btn btn-secondary" title="<%t SilverCart\Model\Pages\Page.CONTINUESHOPPING 'Continue shopping' %>" href="{$CurrentPage.PageByIdentifierCode('SilvercartFrontPage').Link}#1"><span class="fa fa-caret-left"></span> <%t SilverCart\Model\Pages\Page.CONTINUESHOPPING 'Continue shopping' %></a>
    <% if $CurrentMember.ShoppingCart.IsMinimumOrderValueReached %>
        <% with $CurrentPage.PageByIdentifierCode('SilvercartCheckoutStep') %>
        <a href="{$Link}" title="<%t SilverCart\Model\Pages\Page.GOTO 'go to {title}' title=$Title.XML %>" class="btn btn-primary"><%t SilverCart\Model\Pages\Page.CHECKOUT 'Checkout' %> <span class="fa fa-caret-right"></span></a>
        <% end_with %>
    <% end_if %> 
    </div>
</div>
<% end_if %>