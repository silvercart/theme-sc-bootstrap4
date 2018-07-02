<% if $registeredModules %>
    <% loop $registeredModules %>
        <% if $CustomShoppingCartPositions %>
            <% loop $CustomShoppingCartPositions %>
                {$CustomShoppingCartPosition}
            <% end_loop %>
        <% end_if %>
        <% if $TaxableShoppingCartPositions %>
                <tr>
                    <td colspan="6" class="text-right"><strong><%t SilverCart\Model\Pages\Page.SUBTOTAL 'subtotal' %></strong></td>
                    <td class="text-right" id="Sum"><strong><% with $CurrentMember.ShoppingCart %>{$TaxableAmountGrossWithoutFeesAndChargesAndModules.Nice}<% end_with %></strong></td>
                </tr>
            <% loop $TaxableShoppingCartPositions %>
                <tr>
                    <td colspan="3">{$Name}<% if $CurrentPage.EditableShoppingCart %>{$removeFromCartForm}<% end_if %></td>
                    <td class="text-right">{$PriceFormatted}
                        <p class="hidden-xs-down"><small>{$Tax.Title}% <%t SilverCart\Model\Product\Product.VAT 'VAT' %></small></p></td>
                    <td class="text-right">&nbsp;</td>
                    <td class="text-right">{$getTypeSafeQuantity}x</td>
                    <td class="text-right">{$PriceTotalFormatted}</td>
                </tr>
            <% end_loop %>
        <% end_if %>
    <% end_loop %>
<% end_if %>