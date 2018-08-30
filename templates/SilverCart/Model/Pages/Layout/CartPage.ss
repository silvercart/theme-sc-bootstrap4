<% if $Checkout.ShowCartInCheckoutNavigation %>
    <% include SilverCart/Model/Pages/CheckoutStepNavigation %>
<% end_if %>
<% include SilverCart/Model/Pages/ShoppingCartFull %>
<% if $CurrentMember.ShoppingCart.isFilled && not $CurrentMember.ShoppingCart.IsMinimumOrderValueReached %>
<div class="alert alert-danger"><%t SilverCart\Model\Order\ShoppingCart.ERROR_MINIMUMORDERVALUE_NOT_REACHED 'The minimum order value is {amount}' amount=$ShoppingCart.MinimumOrderValue %></div>
<% end_if %>
<% include SilverCart/Model/Pages/WidgetSetContent %>