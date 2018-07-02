<% if $AllowedShippingMethods %>
    <% loop $AllowedShippingMethods %>
        <% if $isActive %>
            <br/>
            <h3>{$TitleWithCarrier}</h3>
            <% if $Description %>{$Description}<% end_if %>
            <% if $DeliveryTime %><br/><small class="delivery-time-hint">{$fieldLabel('DeliveryTime')}: {$getDeliveryTime(true)}</small><% end_if %>
            <table class="table table-sm table-hover silvercart-default-table">
                <thead class="thead-inverse">
                    <tr>
                        <th><%t SilverCart\Model\Product\Product.WEIGHT 'Weight' %> ({$MaximumWeightUnitAbreviation})</th>
                        <th>{$Zone.singular_name}</th>
                        <th><%t SilverCart\Model\Product\Product.PRICE 'Price' %></th>
                    </tr>
                </thead>
                <tbody>
            <% loop $ShippingFees %>
                <tr class="{$EvenOdd}">
                    <td class="text-right text-top padding-right"><% if $UnlimitedWeight %><%t SilverCart\Model\Shipping\ShippingFee.UNLIMITED_WEIGHT 'unlimited weight' %><% else %>{$MaximumWeightNice}<% end_if %></td>
                    <td>
                        <% with $Zone %>
                            <b>{$Title}:</b><br/>
                            <% loop $Countries %>
                                <% if $Active %>
                                    {$Title}<br/>
                                <% end_if %>
                            <% end_loop %>
                        <% end_with %>
                        <% if $DeliveryTime %><br/><small class="delivery-time-hint">{$fieldLabel('DeliveryTime')}: {$getDeliveryTime(true)}</small><% end_if %>
                    </td>
                    <td class="text-right text-top">{$PriceFormattedForDetailViewProduct} <% if $PostPricing %>*<% end_if %></td>
                </tr>
            <% end_loop %>
                </tbody>
            </table>
            <% if $hasFeeWithPostPricing %>* <%t SilverCart\Model\Shipment\ShippingFee.POST_PRICING_INFO 'Manual calculation of shipping fees after order.' %><% end_if %>
        <% end_if %>
    <% end_loop %>
<% end_if %>