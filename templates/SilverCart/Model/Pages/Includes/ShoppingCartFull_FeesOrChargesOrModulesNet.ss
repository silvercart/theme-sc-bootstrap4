<% if $HasChargesAndDiscountsForProducts %>
    <% loop $ChargesAndDiscountsForProducts %>
<tr>
    <td colspan="2" class="d-none d-sm-table-cell">{$Name}</td>
    <td class="text-right d-none d-sm-table-cell">{$Tax.Title}% <%t SilverCart\Model\Product\Product.VAT 'VAT' %></td>
    <td class="text-right" data-title="{$Name}">{$PriceFormatted}</td>
</tr>
    <% end_loop %>
<tr>
    <td colspan="3" class="text-right d-none d-sm-table-cell"><strong><%t SilverCart\Model\Pages\Page.SUBTOTAL 'subtotal' %></strong></td>
    <td class="text-right" data-title="<%t SilverCart\Model\Pages\Page.SUBTOTAL 'subtotal' %>"><strong>{$TaxableAmountNetWithoutFees.Nice}</strong></td>
</tr>
<% end_if %>
<% if $ShowFees %>
<tr>
    <td colspan="3" class="text-right d-none d-sm-table-cell"><strong>{$ShippingMethod.singular_name}: {$CarrierAndShippingMethodTitle} <% if $ShippingMethod.ShippingFee.PostPricing %>*<% end_if %></strong></td>
    <td class="text-right" data-title="{$ShippingMethod.singular_name}: {$CarrierAndShippingMethodTitle} <% if $ShippingMethod.ShippingFee.PostPricing %>*<% end_if %>">{$HandlingCostShipment.Nice}</td>
</tr>
<tr>
    <td colspan="3" class="text-right d-none d-sm-table-cell"><strong><%t SilverCart\Model\Payment\PaymentMethod.SINGULARNAME 'Payment method' %>: {$payment.Name}</strong></td>
    <td class="text-right" data-title="<%t SilverCart\Model\Payment\PaymentMethod.SINGULARNAME 'Payment method' %>: {$payment.Name}">{$HandlingCostPayment.Nice}</td>
</tr>
<tr>
    <td colspan="3" class="text-right d-none d-sm-table-cell"><strong><%t SilverCart\Model\Pages\Page.SUBTOTAL 'Subtotal' %></strong></td>
    <td class="text-right" data-title="<%t SilverCart\Model\Pages\Page.SUBTOTAL 'Subtotal' %>"><strong>{$TaxableAmountNetWithFees.Nice}</strong></td>
</tr>
<% end_if %>
<% if $registeredModules %>
    <% loop $registeredModules %>
        <% if $NonTaxableShoppingCartPositions %>
            <% loop $NonTaxableShoppingCartPositions %>
<tr>
    <td class="d-none d-sm-table-cell">{$Name}<% if $CurrentPage.EditableShoppingCart %>{$removeFromCartForm}<% end_if %></td>
    <td class="text-right d-none d-sm-table-cell">{$PriceFormatted}</td>
    <td class="text-right d-none d-sm-table-cell">{$getTypeSafeQuantity}</td>
    <td class="text-right d-none d-sm-table-cell" data-title="{$Name} ({$getTypeSafeQuantity}x {$PriceFormatted})">{$PriceTotalFormatted}</td>
</tr>
            <% end_loop %>
        <% end_if %>
    <% end_loop %>
<% end_if %>
<% if $HasChargesAndDiscountsForTotal %>
    <% loop $ChargesAndDiscountsForTotal %>
<tr>
    <td colspan="2" class="d-none d-sm-table-cell">{$Name}</td>
    <td class="text-right d-none d-sm-table-cell">{$Tax.Title}% <%t SilverCart\Model\Product\Product.VAT 'VAT' %></td>
    <td class="text-right" data-title="{$Name}">{$PriceFormatted}</td>
</tr>
    <% end_loop %>
<tr>
    <td colspan="3" class="text-right d-none d-sm-table-cell"><strong><%t SilverCart\Model\Pages\Page.SUBTOTAL 'subtotal' %></strong></td>
    <td class="text-right" data-title="<%t SilverCart\Model\Pages\Page.SUBTOTAL 'subtotal' %>"><strong>{$AmountTotalNetWithoutVat.Nice}</strong></td>
</tr>
<% end_if %>