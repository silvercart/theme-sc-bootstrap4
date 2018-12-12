<% if $registeredModules %>
    <% loop $registeredModules %>
        <% if $CustomShoppingCartPositions %>
            <% loop $CustomShoppingCartPositions %>
                {$CustomShoppingCartPosition}
            <% end_loop %>
        <% end_if %>
        <% if $TaxableShoppingCartPositions %>
                <tr>
                    <td colspan="3" class="text-right d-none d-sm-table-cell"><strong><%t SilverCart\Model\Pages\Page.SUBTOTAL 'subtotal' %></strong></td>
                    <td class="text-right" data-title="<%t SilverCart\Model\Pages\Page.SUBTOTAL 'subtotal' %>"><strong><% with $CurrentMember.ShoppingCart %>{$TaxableAmountNetWithoutFeesAndChargesAndModules.Nice}<% end_with %></strong></td>
                </tr>
            <% loop $TaxableShoppingCartPositions %>
                <tr>
                    <td colspan="3" class="text-right">{$Name}<% if $CurrentPage.EditableShoppingCart %>{$removeFromCartForm}<% end_if %></td>
                    <td class="text-right">{$PriceNetTotalFormatted}
                        <small class="d-block">{$Tax.Rate}% <%t SilverCart\Model\Product\Product.VAT 'VAT' %></small></td>
                </tr>
            <% end_loop %>
        <% end_if %>
    <% end_loop %>
<% end_if %>