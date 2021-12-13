<table class="table responsive-table" cellspacing="0" cellpadding="0" border="0">
    <thead>
        <tr>
            <th class="text-left"><%t SilverCart\Model\Product\Product.PRODUCTNUMBER_SHORT 'Item no.' %></th>
            <th class="text-left"><%t SilverCart\Model\Product\Product.COLUMN_TITLE 'Title' %></th>
            <th class="text-right"><%t SilverCart\Model\Product\Product.PRICE_SINGLE 'Price single' %></th>
            <th class="text-right"><%t SilverCart\Model\Product\Product.VAT 'VAT' %></th>
            <th class="text-right"><%t SilverCart\Model\Product\Product.QUANTITY 'Quantity' %></th>
            <th class="text-right"><%t SilverCart\Model\Product\Product.PRICE 'Price' %></th>
        </tr>
    </thead>
    <tbody>
        <% loop $OrderListPositions %>
            <tr>
                <td class="text-left" data-title="<%t SilverCart\Model\Product\Product.PRODUCTNUMBER_SHORT 'Item no.' %>">{$ProductNumber}</td>
                <td class="text-left" data-title="<%t SilverCart\Model\Product\Product.COLUMN_TITLE 'Title' %>">
                    <span class="title">{$Title.RAW}</span>
                    <% if $Product.isPublished %><a href="{$Product.Link}"><span class="fa fa-external-link"></span></a><% end_if %>
                    <% with $CurrentPage %><% if $AllowReorder %><br/><a class="btn btn-sm btn-link" href="{$ReoderPositionLink($Up.ID)}">{$fieldLabel('ButtonReorder')} <span class="fa fa-caret-right"></span></a><% end_if %><% end_with %>
                    <% if $ShortDescription %><br/><span class="title-desc">{$ShortDescription.RAW}</span><% end_if %>
                    <% if $addToTitle %><br/><span class="title-add">{$addToTitle}</span><% end_if %></td>
                <td class="text-right" data-title="<%t SilverCart\Model\Product\Product.PRICE_SINGLE 'Price single' %>">{$Price.Nice}</td>
                <td class="text-right" data-title="<%t SilverCart\Model\Product\Product.VAT 'VAT' %>">{$TaxRate}%</td>
                <td class="text-right" data-title="<%t SilverCart\Model\Product\Product.QUANTITY 'Quantity' %>"><span class="silvercart-quantity-label">{$getTypeSafeQuantity}<span class="d-sm-none">x</span></span></td>
                <td class="text-right" data-title="<%t SilverCart\Model\Product\Product.PRICE 'Price' %>">{$PriceTotal.Nice}</td>
            </tr>
        <% end_loop %>

        <%-- sub total without fees and charges --%>
        <% with $getTaxableAmountGrossWithoutFees(false,false) %>
        <tr>
            <td class="text-right d-none d-sm-table-cell" colspan="5"><strong><%t SilverCart\Model\Pages\Page.VALUE_OF_GOODS 'Value of goods' %></strong></td>
            <td class="text-right" data-title="<%t SilverCart\Model\Pages\Page.VALUE_OF_GOODS 'Value of goods' %>">{$Amount.Nice}</td>
        </tr>
        <% end_with %>

        <% if $HasChargePositionsForProduct %>
            <%-- charges and discounts for product value --%>
            <% loop $OrderChargePositionsProduct %>
            <tr>
                <td colspan="2" data-title="<%t SilverCart\Model\Product\Product.COLUMN_TITLE 'Title' %>">{$Title.RAW}</td>
                <td class="text-right d-none d-sm-table-cell">{$Price.Nice}</td>
                <td class="text-right d-none d-sm-table-cell">{$TaxRate}%</td>
                <td class="text-right" data-title="<%t SilverCart\Model\Product\Product.QUANTITY 'Quantity' %>"><span class="silvercart-quantity-label">{$getTypeSafeQuantity}<span class="d-sm-none">x</span></span></td>
                <td class="text-right" data-title="<%t SilverCart\Model\Product\Product.PRICE 'Price' %>">{$PriceTotal.Nice}</td>
            </tr>
            <% end_loop %>
            <%-- sub total without fees with product charges --%>
            <% with $getTaxableAmountGrossWithoutFees(true,false) %>
                <tr>
                    <td class="text-right d-none d-sm-table-cell" colspan="5"><strong><%t SilverCart\Model\Pages\Page.SUBTOTAL 'Subtotal' %></strong></td>
                    <td class="text-right" data-title="<%t SilverCart\Model\Pages\Page.SUBTOTAL 'Subtotal' %>"><strong>{$Amount.Nice}</strong></td>
                </tr>
            <% end_with %>
            <%-- tax rates for sub total without fees --%>
            <% loop $getTaxRatesWithoutFees(true,false) %>
                <tr>
                    <td class="text-right d-none d-sm-table-cell" colspan="5"><%t SilverCart\Model\Pages\Page.INCLUDED_VAT 'included VAT' %> ({$Rate}%)</td>
                    <td class="text-right" data-title="<%t SilverCart\Model\Pages\Page.INCLUDED_VAT 'included VAT' %> ({$Rate}%)">{$Amount.Nice}</td>
                </tr>
            <% end_loop %>
        <% end_if %>
        <%-- fees --%>
        <tr>
            <td class="text-right d-none d-sm-table-cell" colspan="5">{$fieldLabel('ShippingMethod')}: {$ShippingMethod.TitleWithCarrier} <% if $ShippingMethod.ShippingFee.PostPricing %>*<% end_if %></td>
            <td class="text-right" data-title="{$fieldLabel('ShippingMethod')}: {$ShippingMethod.TitleWithCarrier} <% if $ShippingMethod.ShippingFee.PostPricing %>*<% end_if %>">{$HandlingCostShipment.Nice}</td>
        </tr>
        <tr>
            <td class="text-right d-none d-sm-table-cell" colspan="5">{$fieldLabel('PaymentMethodTitle')}: {$PaymentMethod.Name}</td>
            <td class="text-right" data-title="{$fieldLabel('PaymentMethodTitle')}: {$PaymentMethod.Name}">{$HandlingCostPayment.Nice}</td>
        </tr>

        <% if $OrderChargePositionsTotal %>
            <%-- sub total --%>
            <% with $getTaxableAmountGrossWithFees(true,false) %>
                <tr>
                    <td class="text-right d-none d-sm-table-cell" colspan="5"><strong><%t SilverCart\Model\Pages\Page.SUBTOTAL 'Subtotal' %></strong></td>
                    <td class="text-right" data-title="<%t SilverCart\Model\Pages\Page.SUBTOTAL 'Subtotal' %>"><strong>{$Amount.Nice}</strong></td>
                </tr>
            <% end_with %>

            <%-- tax rates for sub total --%>
            <% loop $getTaxRatesWithFees(true,false) %>
                <tr>
                    <td class="text-right d-none d-sm-table-cell" colspan="5"><%t SilverCart\Model\Pages\Page.INCLUDED_VAT 'included VAT' %> ({$Rate}%)</td>
                    <td class="text-right" data-title="<%t SilverCart\Model\Pages\Page.INCLUDED_VAT 'included VAT' %> ({$Rate}%)">{$Amount.Nice}</td>
                </tr>
            <% end_loop %>

            <%-- charges and discounts for the shopping cart value --%>
            <% loop $OrderChargePositionsTotal %>
            <tr>
                <td colspan="2" data-title="<%t SilverCart\Model\Product\Product.COLUMN_TITLE 'Title' %>">{$Title.RAW}</td>
                <td class="text-right d-none d-sm-table-cell">{$Price.Nice}</td>
                <td class="text-right d-none d-sm-table-cell">{$TaxRate}%</td>
                <td class="text-right" data-title="<%t SilverCart\Model\Product\Product.QUANTITY 'Quantity' %>"><span class="silvercart-quantity-label">{$getTypeSafeQuantity}<span class="d-sm-none">x</span></span></td>
                <td class="text-right" data-title="<%t SilverCart\Model\Product\Product.PRICE 'Price' %>">{$PriceTotal.Nice}</td>
            </tr>
            <% end_loop %>
        <% end_if %>

        <tr>
            <td class="text-right d-none d-sm-table-cell" colspan="5"><strong><%t SilverCart\Model\Pages\Page.TOTAL 'Total' %></strong></td>
            <td class="text-right" data-title="<%t SilverCart\Model\Pages\Page.TOTAL 'Total' %>"><strong>$AmountTotal.Nice<% if $ShippingMethod.ShippingFee.PostPricing %>*<% end_if %></strong></td>
        </tr>
        <% if $TaxTotal %>
            <% loop $TaxTotal %>
                <tr>
                    <td class="text-right text-black-50 d-none d-sm-table-cell" colspan="5"><%t SilverCart\Model\Pages\Page.INCLUDED_VAT 'included VAT' %> ({$Rate}%)</td>
                    <td class="text-right text-black-50" data-title="<%t SilverCart\Model\Pages\Page.INCLUDED_VAT 'included VAT' %> ({$Rate}%)">{$Amount.Nice}</td>
                </tr>
            <% end_loop %>
        <% end_if %>

        <% if $HasIncludedInTotalPositions %>
            <% loop $OrderIncludedInTotalPositions %>
                <tr>
                    <td class="text-right d-none d-sm-table-cell" colspan="5">{$Title.RAW}</td>
                    <td class="text-right" data-title="{$Title.RAW}">{$Price.Nice}</td>
                </tr>
            <% end_loop %>
        <% end_if %>
    </tbody>
</table>
<% if $ShippingMethod.ShippingFee.PostPricing %><b>* <%t SilverCart\Model\Pages\Page.PLUS_SHIPPING 'plus shipping' %>, <%t SilverCart\Model\Shipment\ShippingFee.POST_PRICING_INFO 'Manual calculation of shipping fees after order.' %></b><% end_if %>
