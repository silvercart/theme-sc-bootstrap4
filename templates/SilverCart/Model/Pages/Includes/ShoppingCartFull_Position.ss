<% if $hasNotice %>
<tr class="next-border-top-0 border-bottom-0">
    <td colspan="2" class="border-bottom-0 pb-0 d-none d-sm-table-cell">&nbsp;</td>
    <td colspan="3" class="border-bottom-0 pb-0"><div class="alert alert-warning mb-0"><span class="fa fa-exclamation-circle"></span> {$getShoppingCartPositionNotices}</div></td>
</tr>
<% end_if %>
<tr>
    <td class="img text-center" data-title="<%t SilverCart\Model\Product\Product.IMAGE 'Image' %>">
    <% if $Product.ListImage %>
        <a class="d-inline-block" href="{$Product.Link}" title="<%t SilverCart\Model\Pages\Page.SHOW_DETAILS_FOR 'Show details for {title}' title=$Product.ListImage.Title %>"><img class="img-fluid" src="{$Product.ListImage.Pad(110,110).URL}" alt="{$Product.Title}" /></a>
    <% end_if %>
    </td>
    <td class="desc" data-title="<%t SilverCart\Model\Product\Product.TITLE 'Product' %>">
        <h5><a class="highlight" href="{$Product.Link}">{$getTitle}</a></h5>
        <ul class="list-unstyled p-0 m-0">
            <li><a class="highlight" href="{$Product.Link}"><%t SilverCart\Model\Product\Product.PRODUCTNUMBER_SHORT 'Item no.' %>: {$getProductNumberShop}</a></li>
            <% if $getCartDescription %><li><small>{$getCartDescription}</small></li><% end_if %>
            <% if $addToTitle %><li><small>{$addToTitle}</small></li><% end_if %>
            <% if $Top.SiteConfig.enableStockManagement && $Product.StockQuantity < $Quantity %><li><small class="label label-info"><span class="fa fa-info-sign"></span> <%t SilverCart\Model\Order\ShoppingCart.OnlyXLeft 'Only {quantity} left in stock. Delivery time may increase.' quantity=$Product.StockQuantity %></small></li><% end_if %>
            <% if $CurrentPage.EditableShoppingCart %><li class="padding-top">{$RemovePositionForm}</li><% end_if %>
        </ul>
    </td>
    <td class="sub-price text-right" data-title="<%t SilverCart\Model\Product\Product.PRICE_SINGLE 'price single' %>">
        {$getPrice(true).Nice}
        <small class="d-block">{$Product.TaxRate}% <%t SilverCart\Model\Product\Product.VAT 'VAT' %></small>
    </td>
<% if $CurrentPage.EditableShoppingCart %>
    <td class="quantity text-center" data-title="<%t SilverCart\Model\Pages\ProductPage.QUANTITY 'Quantity' %>">
        <form class="form-inline d-inline-block" action="/sc-action/addToCart" method="post">
            <input type="hidden" name="productID" value="{$ProductID}">
            <div class="input-group">
                <div class="input-group-prepend">
                    <a href="{$baseHref}sc-action/decrementPositionQuantity/{$ID}/{$CurrentPage.ID}" class="btn btn-outline-secondary" role="button"><span class="fa fa-minus"></span></a>
                </div>
                <input type="text" class="form-control form-control-sm text-center" name="productQuantity" value="{$TypeSafeQuantity}" id="productQuantity-{$ID}">
            <% if $isQuantityIncrementableBy %>
                <div class="input-group-append">
                    <a href="{$baseHref}sc-action/incrementPositionQuantity/{$ID}/{$CurrentPage.ID}" class="btn btn-outline-secondary" role="button"><span class="fa fa-plus"></span></a>
                </div>
            <% end_if %>
            </div>
        </form>
    </td>
<% else %>
    <td class="quantity text-right text-sm-center" data-title="<%t SilverCart\Model\Pages\ProductPage.QUANTITY 'Quantity' %>">
        <span class="silvercart-quantity-label">{$getTypeSafeQuantity}x</span>
    </td>
<% end_if %>
    <td class="total-price text-right" data-title="<%t SilverCart\Model\Product\Product.PRICE 'Price' %>">
        {$Price.Nice}
        <small class="d-block">{$Product.TaxRate}% <%t SilverCart\Model\Product\Product.VAT 'VAT' %></small>
    </td>
</tr>