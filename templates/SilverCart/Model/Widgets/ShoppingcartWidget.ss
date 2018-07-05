<% if $ShowWidget %>
<header><h3><%t SilverCart\Model\Widgets\ShoppingcartWidget.TITLE 'Shopping cart' %></h3></header>
    <% if $CurrentMember.ShoppingCart.isFilled %>
<table class="table">
    <thead>
        <tr>
            <th class="text-left w-50"><%t SilverCart\Model\Product\Product.TITLE 'Product' %></th>
            <th class="text-right"><%t SilverCart\Model\Product\Product.QUANTITY_SHORT 'Qty.' %></th>
            <th class="text-right"><%t SilverCart\Model\Product\Product.PRICE 'Price' %></th>
        </tr>
    </thead>
        <% with $CurrentMember.ShoppingCart %>
    <tbody>
            <% loop $ShoppingCartPositions %>
        <tr>
            <td class="text-left"><a href="{$Product.Link}">{$getTitleForWidget}</a><br/>{$addToTitleForWidget}</td>
            <td class="text-right">{$getTypeSafeQuantity}</td>
            <td class="text-right">{$Price.Nice}</td>
        </tr>
            <% end_loop %>
    </tbody> 
    <tfoot>
        <tr>
            <td colspan="2" class="text-right"><%t SilverCart\Model\Pages\Page.SUM 'sum' %></td>
            <td class="text-right">{$AmountTotal.Nice}</td>
        </tr>
    </tfoot>
        <% end_with %>
</table>
<div class="btn-group btn-group-sm d-flex float-right" role="group">
    <a class="btn btn-secondary" href="{$CartLink}"><span class="fa fa-shopping-cart"></span> <%t SilverCart\Model\Pages\Page.GOTO_CART_SHORT 'Cart' %></a>
    <a class="btn btn-primary" href="{$CheckOutLink}"><span class="fa fa-credit-card"></span> <%t SilverCart\Model\Pages\Page.CHECKOUT 'checkout' %> &raquo;</a>
</div>
    <% else %>
<div class="alert alert-light"><%t SilverCart\Model\Pages\CartPage.CART_EMPTY 'Your cart is empty' %></div>
    <% end_if %>
<% end_if %>