<table class="table-cart" aria-labelledby="cart-dropdown">
    <tbody>
    <% loop $ShoppingCartPositions %>
        <tr>
            <td class="sc-product-cart pl-2 pr-2" style="min-width: 40px;">
        <% if $Product.ListImage %>
            <% if $SiteConfig.DisableProductLinkInCart %>
                <img class="img-fluid img-responsive" src="{$Product.ListImage.Pad(62,62).URL}" alt="{$Product.Title}" />
            <% else %>
                <a href="{$Product.Link}" title="<%t SilverCart\Model\Pages\Page.SHOW_DETAILS_FOR 'Show details for {title}' title=$Product.Title %>"><img class="img-fluid img-responsive" src="{$Product.ListImage.Pad(62,62).URL}" alt="{$Product.Title}" /></a>
            <% end_if %>
        <% end_if %>
            </td>
            <td class="sc-product-cart">
                <div class="sc-product-cart-description">
                <% if $SiteConfig.DisableProductLinkInCart %>
                    <span class="highlight"><strong>{$getTitle}</strong></span>
                <% else %>
                    <a class="highlight" href="{$Product.Link}"><strong>{$getTitle}</strong></a>
                <% end_if %>
                    <ul class="list-unstyled">
                        <li><small><%t SilverCart\Model\Product\Product.PRODUCTNUMBER_SHORT 'Item no.' %>: {$getProductNumberShop}</small></li>
                        <% if $getCartDescription %><li><small>{$getCartDescription}</small></li><% end_if %>
                        <% if $addToTitleForWidget %><li><small>{$addToTitleForWidget}</small></li><% end_if %>
                    </ul>
                </div>
            </td>
            <td class="cart-product-setting text-right pl-2 pr-2">
                <p><strong>{$Price.Nice}</strong><br/><small class="text-nowrap">({$getTypeSafeQuantity}x {$getPrice(true).Nice})</small></p>
            </td>
        </tr>
    <% end_loop %>
    </tbody>
    <tfoot>
        <tr>
            <td class="sc-product-cart pl-2 pr-2" colspan="2">
            <% with $CurrentPage.PageByIdentifierCode('SilvercartCartPage') %>
                <a href="{$Link}" title="<%t SilverCart\Model\Pages\Page.GOTO 'go to {title} page' title=$Title.XML %>" class="btn btn-sm btn-secondary"><%t SilverCart\Model\Pages\Page.CART 'cart' %></a>
            <% end_with %>
            <% with $CurrentPage.PageByIdentifierCode('SilvercartCheckoutStep') %>
                <a href="{$Link}" title="<%t SilverCart\Model\Pages\Page.GOTO 'go to {title} page' title=$Title.XML %>" class="btn btn-sm btn-primary"><%t SilverCart\Model\Pages\Page.CHECKOUT 'checkout' %></a>
            <% end_with %>
                <span class="btn btn-sm float-right"><%t SilverCart\Model\Pages\Page.TOTAL 'Total' %>:</span>
            </td>
            <td class="sc-product-cart text-right pl-2 pr-2" colspan="1">
                <strong class="total">{$AmountTotal.Nice}</strong>
            </td>
        </tr>
    </tfoot>
</table>