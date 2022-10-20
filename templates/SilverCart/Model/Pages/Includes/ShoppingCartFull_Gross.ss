<% if $CurrentPage.EditableShoppingCart %>
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
<% if $hasNotice %>
    <% loop $getShoppingCartPositionNoticesList %>
        <div class="alert alert-{$Type} mb-2"><span class="fa fa-{$Icon}"></span> {$Notice}</div>
    <% end_loop %>
<% end_if %>
<div class="silvercart-shopping-cart-full mt-2">
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
                <% include SilverCart/Model/Pages/ShoppingCartFull_RegisteredModulesGross %>
                <% include SilverCart/Model/Pages/ShoppingCartFull_FeesOrChargesOrModulesGross %>
<% if $addToEditableShoppingCartTable %>
    <% loop $addToEditableShoppingCartTable %>
                <tr>
                    <td colspan="1" class="d-none d-sm-table-cell">{$TitleField}&nbsp;</td>
                    <td colspan="2" class="text-right d-none d-sm-table-cell">{$RightTitleField}&nbsp;</td>
                    <td class="text-right" data-title="{$TitleField}">{$PriceField.Nice}</td>
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