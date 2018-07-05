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
    <td class="text-right" id="Sum"><strong>{$TaxableAmountNetWithoutFees.Nice}</strong></td>
</tr>
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
<tr>
    <td colspan="6" class="text-right"><strong><%t SilverCart\Model\Pages\Page.SUBTOTAL 'Subtotal' %></strong></td>
    <td class="text-right" id="Sum"><strong>{$TaxableAmountNetWithFees.Nice}</strong></td>
</tr>
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
<% if $HasChargesAndDiscountsForTotal %>
    <% loop $ChargesAndDiscountsForTotal %>
<tr>
    <td colspan="3">{$Name}</td>
    <td class="text-right">{$Tax.Title}% <%t SilverCart\Model\Product\Product.VAT 'VAT' %></td>
    <td colspan="3" class="text-right">{$PriceFormatted}</td>
</tr>
    <% end_loop %>
<tr>
    <td colspan="6" class="text-right"><strong><%t SilverCart\Model\Pages\Page.SUBTOTAL 'subtotal' %></strong></td>
    <td class="text-right"><strong>{$AmountTotalNetWithoutVat.Nice}</strong></td>
</tr>
<% end_if %>