<tr>
    <td class="img" data-title="<%t SilverCart\Model\Product\Product.IMAGE 'Image' %>">
    <% if $Product.ListImage %>
        <a class="img-fluid" href="{$Product.Link}" title="<%t SilverCart\Model\Pages\Page.SHOW_DETAILS_FOR 'Show details for {title}' title=$Product.ListImage.Title %>"><img class="img-fluid" src="{$Product.ListImage.Pad(92,92).URL}" alt="{$Product.Title}" /></a>
    <% end_if %>
    </td>
    <td class="desc" data-title="<%t SilverCart\Model\Product\Product.TITLE 'Product' %>">
        <h5><a class="highlight" href="{$Product.Link}">{$getTitle}</a></h5>
        <ul class="list-unstyled">
            <li><a class="highlight" href="{$Product.Link}"><%t SilverCart\Model\Product\Product.PRODUCTNUMBER_SHORT 'Item no.' %>: {$getProductNumberShop}</a></li>
            <% if $getCartDescription %><li><small>{$getCartDescription}</small></li><% end_if %>
            <% if $addToTitle %><li><small>{$addToTitle}</small></li><% end_if %>
            <% if $Top.SiteConfig.enableStockManagement && $Product.StockQuantity < $Quantity %><li><small class="label label-info"><span class="fa fa-info-sign"></span> <%t SilverCart\Model\Order\ShoppingCart.OnlyXLeft 'Only {quantity} left in stock. Delivery time may increase.' quantity=$Product.StockQuantity %></small></li><% end_if %>
            <% if $CurrentPage.EditableShoppingCart %><li class="padding-top">{$RemovePositionForm}</li><% end_if %>
        </ul>
    </td>
    <td class="sub-price text-right" data-title="<%t SilverCart\Model\Product\Product.PRICE_SINGLE 'price single' %>">
        {$getPrice(true).Nice}
        <p class="hidden-xs-down"><small>{$Product.TaxRate}% <%t SilverCart\Model\Product\Product.VAT 'VAT' %></small></p>
    </td>
<% if $CurrentPage.EditableShoppingCart %>
    <td class="quantity" data-title="<%t SilverCart\Model\Pages\ProductPage.QUANTITY 'Quantity' %>">
        <div class="d-flex">
            <div class="col-3 p-0 justify-content-end text-right">{$DecrementPositionQuantityForm}</div>
            <div class="col-6 p-0 justify-content-center">
                <form action="/sc-action/addToCart" method="post">
                    <input type="hidden" name="productID" value="{$ProductID}">
                    <input type="text" class="form-control form-control-sm text-center input-nano" name="productQuantity" value="{$TypeSafeQuantity}" id="productQuantity-{$ID}">
                </form>
            </div>
        <% if $isQuantityIncrementableBy %>
            <div class="col-3 p-0 justify-content-start">{$IncrementPositionQuantityForm}</div>
        <% end_if %>
        </div>
    </td>
<% else %>
    <td class="quantity" data-title="<%t SilverCart\Model\Pages\ProductPage.QUANTITY 'Quantity' %>">
        <span class="silvercart-quantity-label">{$getTypeSafeQuantity}x</span>
    </td>
<% end_if %>
    <td class="total-price text-right" data-title="<%t SilverCart\Model\Product\Product.PRICE 'Price' %>">
        {$Price.Nice}
        <p class="hidden-sm-down"><small>{$Product.TaxRate}% <%t SilverCart\Model\Product\Product.VAT 'VAT' %></small></p>
    </td>
</tr>