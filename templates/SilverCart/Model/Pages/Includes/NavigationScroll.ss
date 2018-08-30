<% if $ShoppingCart.isFilled && not $EditableShoppingCart %>
<div class="left-icon-bar">
    <nav class="btn-group-sm btn-group-vertical">
        <a class="rounded-circle bg-primary p-3 mb-2" href="{$PageByIdentifierCode('SilvercartCheckoutStep').Link}" data-toggle="tooltip" data-placement="right" title="<%t SilverCart\Model\Pages\Page.CHECKOUT 'checkout' %>"><span class="fa fa-2x fa-credit-card"></span></a>
        <a class="rounded-circle bg-primary p-3" href="#" id="cart-dropdown-left" data-toggle="dropdown" title="<% if $CurrentMember %>{$CurrentMember.ShoppingCart.getQuantity}<% else %>0<% end_if %> <%t SilverCart\Model\Product\Product.PLURALNAME 'Products' %>">
            <span class="fa fa-2x fa-shopping-cart"></span> <span class="badge badge-light position-absolute bottom-right-5 border border-primary rounded-circle"><% if $CurrentMember %>{$CurrentMember.ShoppingCart.getQuantity}<% else %>0<% end_if %></span>
        </a>
        <section class="dropdown-menu dropdown-menu-left cart-content animated slideInRight-" data-dropdown-in="slideInRight" data-dropdown-out="slideOutLeft" aria-labelledby="cart-dropdown-left">
            <h4 class="sr-only"><%t SilverCart\Model\Pages\Page.CART 'Cart' %></h4>
            <% include SilverCart/Model/Pages/ShoppingCartDropdown %>
        </section>
    </nav>
</div>
<% end_if %>