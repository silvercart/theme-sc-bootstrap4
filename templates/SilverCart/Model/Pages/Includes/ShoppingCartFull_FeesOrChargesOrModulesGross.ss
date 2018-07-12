<% if $HasFeesOrChargesOrModules %>
<tr>
    <td colspan="3" class="text-right d-none d-sm-table-cell"><strong><%t SilverCart\Model\Pages\Page.VALUE_OF_GOODS 'Value of goods' %></strong></td>
    <td class="text-right" data-title="<%t SilverCart\Model\Pages\Page.VALUE_OF_GOODS 'Value of goods' %>"><strong>{$TaxableAmountGrossWithoutFeesAndCharges.Nice}</strong></td>
</tr>
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
    <td class="text-right" data-title="<%t SilverCart\Model\Pages\Page.SUBTOTAL 'subtotal' %>"><strong>{$TaxableAmountGrossWithoutFees.Nice}</strong></td>
</tr>
    <% end_if %>
    <% if $TaxRatesWithoutFees %>
        <% loop $TaxRatesWithoutFees %>
<tr>
    <td colspan="3" class="text-right text-black-50 d-none d-sm-table-cell"><%t SilverCart\Model\Pages\Page.INCLUDED_VAT 'included VAT' %> ({$Rate}%)</td>
    <td class="text-right text-black-50" data-title="<%t SilverCart\Model\Pages\Page.INCLUDED_VAT 'included VAT' %> ({$Rate}%)">{$Amount.Nice}</td>
</tr>
        <% end_loop %>
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
    <% end_if %>
    <% if $HasChargesAndDiscountsForTotal %>
        <% if $ShowFees %>
<tr>
    <td colspan="3" class="text-right d-none d-sm-table-cell"><strong><%t SilverCart\Model\Pages\Page.SUBTOTAL 'Subtotal' %></strong></td>
    <td class="text-right" data-title="<%t SilverCart\Model\Pages\Page.SUBTOTAL 'Subtotal' %>"><strong>{$TaxableAmountGrossWithFees.Nice}</strong></td>
</tr>
            <% if $TaxRatesWithFees %>
                <% loop $TaxRatesWithFees %>
<tr>
    <td colspan="3" class="text-right d-none d-sm-table-cell"><%t SilverCart\Model\Pages\Page.INCLUDED_VAT 'included VAT' %> ({$Rate}%)</td>
    <td class="text-right" data-title="<%t SilverCart\Model\Pages\Page.INCLUDED_VAT 'included VAT' %> ({$Rate}%)">{$Amount.Nice}</td>
</tr>
                <% end_loop %>
            <% end_if %>
        <% end_if %>
        <% loop $ChargesAndDiscountsForTotal %>
<tr>
    <td colspan="2" class="d-none d-sm-table-cell">{$Name}</td>
    <td class="text-right d-none d-sm-table-cell">{$Tax.Title}% <%t SilverCart\Model\Product\Product.VAT 'VAT' %></td>
    <td class="text-right" data-title="{$Name}">{$PriceFormatted}</td>
</tr>
        <% end_loop %>
    <% end_if %>
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
<tr>
    <td colspan="3" class="text-right h2 d-none d-sm-table-cell"><%t SilverCart\Model\Pages\Page.TOTAL 'total' %></td>
    <td class="text-right h2" data-title="<%t SilverCart\Model\Pages\Page.TOTAL 'total' %>">{$AmountTotal.Nice}<% if $ShippingMethod.ShippingFee.PostPricing %>*<% end_if %></td>
</tr>
<% if $TaxTotal %>
    <% loop $TaxTotal %>
<tr>
    <td colspan="3" class="text-right text-black-50 d-none d-sm-table-cell"><%t SilverCart\Model\Pages\Page.INCLUDED_VAT 'included VAT' %> ({$Rate}%)</td>
    <td class="text-right text-black-50" data-title="<%t SilverCart\Model\Pages\Page.INCLUDED_VAT 'included VAT' %> ({$Rate}%)">{$Amount.Nice}</td>
</tr>
    <% end_loop %>
<% end_if %>
<% if not $HasChargesAndDiscountsForTotal && $registeredModules %>
    <% loop $registeredModules %>
        <% if $IncludedInTotalShoppingCartPositions %>
            <% loop $IncludedInTotalShoppingCartPositions %>
<tr>
    <td colspan="3" class="text-right d-none d-sm-table-cell">{$Name}</td>
    <td class="text-right" data-title="{$Name}">{$PriceTotalFormatted}</td>
</tr>
            <% end_loop %>
        <% end_if %>
    <% end_loop %>
<% end_if %>