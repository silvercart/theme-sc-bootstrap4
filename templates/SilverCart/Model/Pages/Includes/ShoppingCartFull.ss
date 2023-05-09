<% if $ShopErrors %>
    <div class="alert alert-danger">
        <a class="close" data-dismiss="alert">×</a>  
        {$ShopErrors}
    </div>
<% end_if %>
<% if $CurrentMember.ShoppingCart.isFilled %>
    <% with $CurrentMember.ShoppingCart %>
        <% if $ProductCartDescriptions %>
            <div class="alert alert-info last-child-m-0" role="alert">
                <% loop $ProductCartDescriptions %>
                    {$CartDescription}
                <% end_loop %>
            </div>
        <% end_if %>
        <div class="row">
            <% if $CurrentPage.EditableShoppingCart && $CurrentMember.ShoppingCart.isFilled %>
            <div class="col-12 col-md-8 col-lg-9">
            <% else %>
            <div class="col-12">
            <% end_if %>
                <h4>{$CurrentPage.Title}</h4>
                <% if $CurrentPage.showPricesGross %>
                    <% include SilverCart/Model/Pages/ShoppingCartFull_Gross %>
                <% else %>
                    <% include SilverCart/Model/Pages/ShoppingCartFull_Net %>
                <% end_if %>
            </div>
            <% if $CurrentPage.EditableShoppingCart && $CurrentMember.ShoppingCart.isFilled %>
            <div class="col-12 col-md-4 col-lg-3">
                <div style="position: sticky; top: 16px">
                <% if $CurrentPage.BeforeCheckoutCartFull %>
                    <h4><%t SilverCart\Model\Pages\Page.EXPRESS_CHECKOUT 'Express Checkout' %></h4>
                    <div>{$CurrentPage.BeforeCheckoutCartFull}</div>
                    <h4 class="mt-2 mb-4 text-center lined-header"><span><%t SilverCart\Model\Pages\Page.OR 'or' %></span></h4>
                <% else %>
                    <h4><%t SilverCart\Model\Pages\Page.CHECKOUT 'Checkout' %></h4>
                <% end_if %>

                    <div class="d-flex gap-2">
                        <a class="btn flex-fill btn-lg btn-outline-secondary" title="<%t SilverCart\Model\Pages\Page.CONTINUESHOPPING 'Continue shopping' %>" href="{$CurrentPage.PageByIdentifierCode('SilvercartFrontPage').Link}#1"><span class="fa fa-caret-left"></span> <%t SilverCart\Model\Pages\Page.CONTINUESHOPPING 'Continue shopping' %></a>
                        <% if $CurrentMember.ShoppingCart.IsMinimumOrderValueReached %>
                            <% with $CurrentPage.PageByIdentifierCode('SilvercartCheckoutStep') %>
                        <a href="{$Link}" title="<%t SilverCart\Model\Pages\Page.GOTO 'go to {title}' title=$Title.XML %>" class="btn flex-fill btn-lg btn-primary"><%t SilverCart\Model\Pages\Page.CHECKOUT 'Checkout' %> <span class="fa fa-caret-right"></span></a>
                            <% end_with %>
                        <% end_if %> 
                    </div>
                    <%-- Release --%>
                    <% if $HasProductsWithDifferentReleaseDates %>
                        <div class="row">
                            <div class="alert alert-warning">
                                <span class="fa fa-exclamation-triangle"></span> <%t SilverCart\Model\Order\ShoppingCart.DifferentReleaseDateHint1 'Your shopping cart contains products with different release dates.' %><br/>
                                <%t SilverCart\Model\Order\ShoppingCart.DifferentReleaseDateHint2 'Please be aware that the shipping date for already available products will be deferred due to the release date of the not yet available products.' %><br/>
                                <%t SilverCart\Model\Order\ShoppingCart.DifferentReleaseDateHint3 'If you want to get all of your products as soon as they each is available for shipment, please place them into diferent orders.' %><br/>
                                <%t SilverCart\Model\Order\ShoppingCart.DifferentReleaseDateHint4 'Thank you for your understanding.' %>
                            </div>
                        </div>
                    <% end_if %>
                    <% if $CurrentPage.PageByIdentifierCode('SilvercartCheckoutStep').EnableNote %>
                        <% with $CurrentMember.ShoppingCart %>
                            <% if $NoteTextarea.exists %>
                                <div class="mt-4">
                                    <h4><%t SilverCart\Model\Pages\Page.REMARKS 'Remarks' %></h4>
                                    <form action="{$baseHref}paypal-action/updateNote/" method="POST">
                                        {$NoteTextarea}
                                        <button class="btn btn-outline-dark mt-1" type="submit"><%t SilverCart\Model\Pages\Page.SAVE 'save' %></button>
                                    </form>
                                </div>
                            <% end_if %>
                        <% end_with %>
                    <% end_if %>
                    <%-- Shipping --%>
                    <% if $CurrentPage.EditableShoppingCart && $CheapestShippingMethod %>
                        <% with $CheapestShippingMethod %>
                    <div class="mt-4">
                        <h4><%t SilverCart\Model\Pages\Page.SHIPPINGRATE 'Shipping' %></h4>
                        <div class="alert alert-light border">
                            <p><%t SilverCart\Model\Order\ShoppingCart.ShippingTo 'Shipping to {country} for <strong>{price}</strong> by {shippingmethod}.' country=$ShippingCountry.Title price=$ShippingFee.PriceFormatted shippingmethod=$TitleWithCarrier %></p>
                        <% with $ShippingFee %>
                            <% if $PriceAmount > 0 && $FreeOfShippingCostsFrom.Amount > 0 %>
                            <p class="font-weight-bold"><span class="fa fa-check"></span> <%t SilverCart\Model\Shipment\ShippingMethod.NoShippingCostFrom 'No shipping cost for orders with a minimum order value of {amount}.' amount=$FreeOfShippingCostsFrom.Nice %></p>
                            <% end_if %>
                        <% end_with %>
                            <form action="{$Up.Link}" method="POST">
                                <div class="input-group mb-1">
                                    {$Up.ShippingCountryDropdown.addExtraClass('custom-select')}
                                    <div class="input-group-append">
                                        <button class="btn btn-outline-dark" type="submit"><%t SilverCart\Model\Shipment\ShippingMethod.ChooseAnotherCountry 'Choose another country' %></button>
                                    </div>
                                </div>
                            </form>
                        </div>
                    </div>
                        <% end_with %>
                    <% end_if %>
                </div>
            </div> <%-- end col --%>
            <% end_if %>
        </div>
    <% end_with %>
<% else %>
    <div class="alert alert-warning"><%t SilverCart\Model\Pages\CartPage.CART_EMPTY 'Your cart is empty' %></p></div>
<% end_if %>
