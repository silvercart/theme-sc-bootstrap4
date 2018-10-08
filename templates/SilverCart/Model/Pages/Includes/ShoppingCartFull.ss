<% if $ShopErrors %>
    <div class="alert alert-danger">
        <a class="close" data-dismiss="alert">×</a>  
        {$ShopErrors}
    </div>
<% end_if %>
<% if $CurrentMember.ShoppingCart.isFilled %>
    <% with $CurrentMember.ShoppingCart %>
        <% if $CurrentPage.showPricesGross %>
            <% include SilverCart/Model/Pages/ShoppingCartFull_Gross %>
        <% else %>
            <% include SilverCart/Model/Pages/ShoppingCartFull_Net %>
        <% end_if %>
        <% if $HasProductsWithDifferentReleaseDates %>
        <div class="row">
            <div class="alert alert-warning col-xs-12 col-lg-6 offset-lg-6 col-xl-5 offset-xl-7 col-xxl-4 offset-xxl-8">
                <span class="fa fa-exclamation-triangle"></span> <%t SilverCart\Model\Order\ShoppingCart.DifferentReleaseDateHint1 'Your shopping cart contains products with different release dates.' %><br/>
                <%t SilverCart\Model\Order\ShoppingCart.DifferentReleaseDateHint2 'Please be aware that the shipping date for already available products will be deferred due to the release date of the not yet available products.' %><br/>
                <%t SilverCart\Model\Order\ShoppingCart.DifferentReleaseDateHint3 'If you want to get all of your products as soon as they each is available for shipment, please place them into diferent orders.' %><br/>
                <%t SilverCart\Model\Order\ShoppingCart.DifferentReleaseDateHint4 'Thank you for your understanding.' %>
            </div>
        </div>
        <% end_if %>
        <% if $CurrentPage.EditableShoppingCart && $CheapestShippingMethod %>
            <% with $CheapestShippingMethod %>
        <div class="alert alert-info float-right">
            <p><span class="fa fa-info-circle"></span> <%t SilverCart\Model\Order\ShoppingCart.ShippingTo 'Shipping to {country} for <strong>{price}</strong> by {shippingmethod}.' country=$ShippingCountry.Title price=$ShippingFee.PriceFormatted shippingmethod=$TitleWithCarrier %></p>
        <% with $ShippingFee %>
            <% if $PriceAmount > 0 && $FreeOfShippingCostsFrom.Amount > 0 %>
            <p class="font-weight-bold"><span class="fa fa-check"></span> <%t SilverCart\Model\Shipment\ShippingMethod.NoShippingCostFrom 'No shipping cost for orders with a minimum order value of {amount}.' amount=$FreeOfShippingCostsFrom.Nice %></p>
            <% end_if %>
        <% end_with %>
            <form action="{$Up.Link}" method="POST">
                <div class="input-group mb-3">
                    {$Up.ShippingCountryDropdown.addExtraClass('custom-select')}
                    <div class="input-group-append">
                        <button class="btn btn-outline-dark" type="submit"><%t SilverCart\Model\Shipment\ShippingMethod.ChooseAnotherCountry 'Choose another country' %></button>
                    </div>
                </div>
            </form>
        </div>
            <% end_with %>
        <% end_if %>
    <% end_with %>
<% else %>
    <div class="alert alert-warning"><%t SilverCart\Model\Pages\CartPage.CART_EMPTY 'Your cart is empty' %></p></div>
<% end_if %>
