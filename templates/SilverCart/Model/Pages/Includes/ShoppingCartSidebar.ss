<% if not $EditableShoppingCart %>
<div class="modal-sidebar" id="modal-sidebar-shopping-cart">
    <div class="modal-sidebar-header">
        <h5 class="modal-sidebar-title"><span class="fa fa-shopping-cart"></span> <%t SilverCart\Model\Pages\Page.CART 'Cart' %></h5>
        <button type="button" class="btn btn-link btn-sm text-gray p-absolute r-40" data-pin="modal-sidebar" aria-label="<%t BattleBear\SingleCardManager.Pin 'Pin' %>"><span class="fas fa-thumbtack"></span></button>
        <button type="button" class="close" data-dismiss="modal-sidebar" aria-label="<%t BattleBear\SingleCardManager.Close 'Close' %>"><span aria-hidden="true">&times;</span></button>
    </div>
    <div class="modal-sidebar-body">
    <% if $CurrentMember.ShoppingCart.isFilled %>
        <% loop $CurrentMember.ShoppingCart.ShoppingCartPositions %>
            <% include SilverCart/Model/Pages/ShoppingCartSidebarPosition %>
        <% end_loop %>
    <% else %>
    <div class="alert alert-info"><span class="fa fa-info-circle"></span> <%t SilverCart\Model\Pages\CartPage.CART_EMPTY 'Your cart is empty' %></div>
    <% end_if %>
    </div>
    <div class="modal-sidebar-footer d-block text-right">
    <% if $CurrentMember.ShoppingCart.isFilled %>
        <a class="btn btn-primary btn-checkout btn-continue" href="{$Link('checkout')}"><%t SilverCart\Model\Pages\Page.CHECKOUT 'Checkout' %> <span class="fa fa-angle-double-right"></span></a>
    <% else %>
        <a class="btn btn-primary btn-checkout btn-continue disabled" href="javascript;"><%t SilverCart\Model\Pages\Page.CHECKOUT 'Checkout' %> <span class="fa fa-angle-double-right"></span></a>
    <% end_if %>
    </div>
</div>
<% end_if %>