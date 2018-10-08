<div class="silvercart-checkout-shipping">
    <% if $items %>
    <ul class="list-unstyled">
        <% loop $items %>
        <li class="form-check">
            <input class="form-check-input" type="radio" name="{$name}" value="{$value}" id="{$htmlId}"<% if checked %> checked="checked"<% end_if %> />
            <label class="form-check-label h3" for="{$htmlId}">{$label}</label>        
            <% if $description || $CurrentUser.Cart.getDeliveryTime($ShippingMethod.ID) %>
                <div class="alert alert-info silvercart-checkout-shipping-additionalInfo-description">
                <% if $description %>
                    <p><i>{$description}</i></p>
                <% end_if %>
                <% if $CurrentUser.Cart.getDeliveryTime($ShippingMethod.ID) %>
                    <% if $ShippingMethod.isPickup %>
                    <strong><i>{$ShippingMethod.fieldLabel(ReadyForPickup)}: {$CurrentUser.Cart.getDeliveryTime($ShippingMethod.ID)}</i></strong>
                        <% if $CurrentUser.Cart.HasProductsWithDifferentReleaseDates %>
                    <br/><strong class="bg-light px-2 py-1 mt-1 d-inline-block rounded">
                        <span class="fa fa-exclamation-triangle"></span> <%t SilverCart\Model\Order\ShoppingCart.DifferentReleaseDateHint1 'Your shopping cart contains products with different release dates.' %><br/>
                        <%t SilverCart\Model\Order\ShoppingCart.PickupDateDeferredDueToReleasDate 'Not yet released products won\'t be ready for pickup before their release date.' %>
                    </strong>
                        <% end_if %>
                    <% else %>
                    <strong><i>{$ShippingMethod.fieldLabel(ExpectedDelivery)}: {$CurrentUser.Cart.getDeliveryTime($ShippingMethod.ID)}</i></strong>
                        <% if $CurrentUser.Cart.HasProductsWithDifferentReleaseDates %>
                    <br/><strong class="bg-light px-2 py-1 mt-1 d-inline-block rounded">
                        <span class="fa fa-exclamation-triangle"></span> <%t SilverCart\Model\Order\ShoppingCart.DifferentReleaseDateHint1 'Your shopping cart contains products with different release dates.' %><br/>
                        <%t SilverCart\Model\Order\ShoppingCart.ShippingDateDeferredDueToReleasDate 'The shipping date will be deferred due to the release date of not yet available products.' %>
                    </strong>
                        <% end_if %>
                    <% end_if %>
                <% end_if %>
                </div>
            <% end_if %>
        </li>
        <% end_loop %>
    </ul>
    <% else %>
    <div class="alert alert-danger"><%t SilverCart\Model\Shipment\ShippingMethod.NO_SHIPPING_METHOD_AVAILABLE 'No shipping method available' %></div>
    <% end_if %>
</div>
