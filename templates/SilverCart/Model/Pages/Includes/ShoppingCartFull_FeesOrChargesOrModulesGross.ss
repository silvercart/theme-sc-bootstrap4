<% if $HasFeesOrChargesOrModules %>
<tr>
    <td colspan="6" class="text-right"><strong><%t SilverCart\Model\Pages\Page.VALUE_OF_GOODS 'Value of goods' %></strong></td>
    <td class="text-right" id="Sum"><strong>{$TaxableAmountGrossWithoutFeesAndCharges.Nice}</strong></td>
</tr>
    <% if $HasChargesAndDiscountsForProducts %>
        <% loop $ChargesAndDiscountsForProducts %>
<tr>
    <td colspan="3">{$Name}</td>
    <td class="text-right">{$Tax.Title}% <%t SilverCart\Model\Product\Product.VAT 'VAT' %></td>
    <td colspan="3" class="text-right">{$PriceFormatted}</td>
</tr>
        <% end_loop %>
<tr>
    <td colspan="6" class="text-right"><strong><%t SilverCart\Model\Pages\Page.SUBTOTAL 'subtotal' %></strong></td>
    <td class="text-right" id="Sum"><strong>{$TaxableAmountGrossWithoutFees.Nice}</strong></td>
</tr>
    <% end_if %>
    <% if $TaxRatesWithoutFees %>
        <% loop $TaxRatesWithoutFees %>
<tr>
    <td colspan="6" class="text-right text-black-50"><%t SilverCart\Model\Pages\Page.INCLUDED_VAT 'included VAT' %> ({$Rate}%)</td>
    <td class="text-right text-black-50">{$Amount.Nice}</td>
</tr>
        <% end_loop %>
    <% end_if %>
    <% if $ShowFees %>
<tr>
    <td colspan="2">{$ShippingMethod.singular_name}:</td>
    <td colspan="4" class="text-right"><strong>{$CarrierAndShippingMethodTitle} <% if $ShippingMethod.ShippingFee.PostPricing %>*<% end_if %></strong></td>
    <td class="text-right">{$HandlingCostShipment.Nice}</td>
</tr>
<tr>
    <td colspan="2"><%t SilverCart\Model\Payment\PaymentMethod.SINGULARNAME 'Payment method' %>:</td>
    <td colspan="4" class="text-right"><strong>{$payment.Name}</strong></td>
    <td class="text-right">{$HandlingCostPayment.Nice}</td>
</tr>
    <% end_if %>
    <% if $HasChargesAndDiscountsForTotal %>
        <% if $ShowFees %>
<tr>
    <td colspan="6" class="text-right"><strong><%t SilverCart\Model\Pages\Page.SUBTOTAL 'Subtotal' %></strong></td>
    <td class="text-right" id="Sum"><strong>{$TaxableAmountGrossWithFees.Nice}</strong></td>
</tr>
            <% if $TaxRatesWithFees %>
                <% loop $TaxRatesWithFees %>
<tr>
    <td colspan="6" class="text-right"><%t SilverCart\Model\Pages\Page.INCLUDED_VAT 'included VAT' %> ({$Rate}%)</td>
    <td class="text-right">{$Amount.Nice}</td>
</tr>
                <% end_loop %>
            <% end_if %>
        <% end_if %>
        <% loop $ChargesAndDiscountsForTotal %>
<tr>
    <td colspan="3">{$Name}</td>
    <td class="text-right">{$Tax.Title}% <%t SilverCart\Model\Product\Product.VAT 'VAT' %></td>
    <td colspan="3" class="text-right">{$PriceFormatted}</td>
</tr>
        <% end_loop %>
    <% end_if %>
<% end_if %>
<% if $registeredModules %>
    <% loop $registeredModules %>
        <% if $NonTaxableShoppingCartPositions %>
            <% loop $NonTaxableShoppingCartPositions %>
<tr>
    <td colspan="3">{$Name}<% if $CurrentPage.EditableShoppingCart %>{$removeFromCartForm}<% end_if %></td>
    <td class="text-right">{$PriceFormatted}</td>
    <td>&nbsp;</td>
    <td class="text-right">{$getTypeSafeQuantity}</td>
    <td class="text-right">{$PriceTotalFormatted}</td>
</tr>
            <% end_loop %>
        <% end_if %>
    <% end_loop %>
<% end_if %>
<tr>
    <td colspan="6" class="text-right"><h2><%t SilverCart\Model\Pages\Page.TOTAL 'total' %></h2></td>
    <td class="text-right"><h2>{$AmountTotal.Nice}<% if $ShippingMethod.ShippingFee.PostPricing %>*<% end_if %></h2></td>
</tr>
<% if $TaxTotal %>
    <% loop $TaxTotal %>
<tr>
    <td colspan="6" class="text-right text-black-50"><%t SilverCart\Model\Pages\Page.INCLUDED_VAT 'included VAT' %> ({$Rate}%)</td>
    <td class="text-right text-black-50">{$Amount.Nice}</td>
</tr>
    <% end_loop %>
<% end_if %>
<% if not $HasChargesAndDiscountsForTotal && $registeredModules %>
    <% loop $registeredModules %>
        <% if $IncludedInTotalShoppingCartPositions %>
            <% loop $IncludedInTotalShoppingCartPositions %>
<tr>
    <td colspan="6" class="text-right">{$Name}</td>
    <td class="text-right">{$PriceTotalFormatted}</td>
</tr>
            <% end_loop %>
        <% end_if %>
    <% end_loop %>
<% end_if %>