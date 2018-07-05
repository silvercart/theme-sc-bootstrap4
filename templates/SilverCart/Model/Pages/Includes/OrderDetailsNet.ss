<table class="table silvercart-order-table" cellspacing="0" cellpadding="0" border="0">
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
                    <% if $Product.exists %><a href="{$Product.Link}"><span class="fa fa-external-link"></span></a><% end_if %>
                    <% if $ShortDescription %><br/><span class="title-desc">{$ShortDescription.RAW}</span><% end_if %>
                    <% if $addToTitle %><br/><span class="title-add">{$addToTitle}</span><% end_if %></td>
                <td class="text-right" data-title="<%t SilverCart\Model\Product\Product.PRICE_SINGLE 'Price single' %>">{$Price.Nice}</td>
                <td class="text-right" data-title="<%t SilverCart\Model\Product\Product.VAT 'VAT' %>">{$TaxRate}%</td>
                <td class="text-right" data-title="<%t SilverCart\Model\Product\Product.QUANTITY 'Quantity' %>"><span class="silvercart-quantity-label">{$getTypeSafeQuantity}<span class="d-sm-none">x</span></span></td>
                <td class="text-right" data-title="<%t SilverCart\Model\Product\Product.PRICE 'Price' %>">{$PriceTotal.Nice}</td>
            </tr>
        <% end_loop %>

        <% if $HasChargePositionsForProduct %>
            <!-- charges and discounts for product value -->
            <% loop $OrderChargePositionsProduct %>
                <tr>
                    <td colspan="2" data-title="<%t SilverCart\Model\Product\Product.COLUMN_TITLE 'Title' %>">{$Title.RAW}</td>
                    <td class="text-right d-none d-sm-table-cell">{$Price.Nice}</td>
                    <td class="text-right d-none d-sm-table-cell">{$TaxRate}%</td>
                    <td class="text-right" data-title="<%t SilverCart\Model\Product\Product.QUANTITY 'Quantity' %>"><span class="silvercart-quantity-label">{$getTypeSafeQuantity}<span class="d-sm-none">x</span></span></td>
                    <td class="text-right" data-title="<%t SilverCart\Model\Product\Product.PRICE 'Price' %>">{$PriceTotal.Nice}</td>
                </tr>
            <% end_loop %>
        <% end_if %>

        <!-- sub total without fees with product charges -->
        <% loop $getTaxableAmountNetWithoutFees(true,false) %>
            <tr>
                <td class="text-right d-none d-sm-table-cell" colspan="5"><strong><%t SilverCart\Model\Pages\Page.SUBTOTAL 'Subtotal' %></strong></td>
                <td class="text-right" data-title="<%t SilverCart\Model\Pages\Page.SUBTOTAL 'Subtotal' %>">{$Amount.Nice}</td>
            </tr>
        <% end_loop %>

        <!-- fees -->
        <tr>
            <td class="text-right d-none d-sm-table-cell" colspan="5">{$fieldLabel('ShippingMethod')}: {$ShippingMethod.TitleWithCarrier} <% if $ShippingMethod.ShippingFee.PostPricing %>*<% end_if %></td>
            <td class="text-right" data-title="{$fieldLabel('ShippingMethod')}: {$ShippingMethod.TitleWithCarrier} <% if $ShippingMethod.ShippingFee.PostPricing %>*<% end_if %>">{$HandlingCostShipment.Nice}</td>
        </tr>
        <tr>
            <td class="text-right d-none d-sm-table-cell" colspan="5">{$fieldLabel('PaymentMethodTitle')}: {$PaymentMethod.Name}</td>
            <td class="text-right" data-title="{$fieldLabel('PaymentMethodTitle')}: {$PaymentMethod.Name}">{$HandlingCostPayment.Nice}</td>
        </tr>

        <!-- sub total -->
        <% loop $getTaxableAmountNetWithFees(true,false) %>
            <tr>
                <td class="text-right d-none d-sm-table-cell" colspan="5"><strong><%t SilverCart\Model\Pages\Page.SUBTOTAL 'Subtotal' %></strong></td>
                <td class="text-right" data-title="<%t SilverCart\Model\Pages\Page.SUBTOTAL 'Subtotal' %>">{$Amount.Nice}</td>
            </tr>
        <% end_loop %>

        <!-- charges and discounts for the shopping cart value -->
        <% loop $OrderChargePositionsTotal %>
            <tr>
                <td colspan="2" data-title="<%t SilverCart\Model\Product\Product.COLUMN_TITLE 'Title' %>">{$Title.RAW}</td>
                <td class="text-right d-none d-sm-table-cell">{$Price.Nice}</td>
                <td class="text-right d-none d-sm-table-cell">{$TaxRate}%</td>
                <td class="text-right" data-title="<%t SilverCart\Model\Product\Product.QUANTITY 'Quantity' %>"><span class="silvercart-quantity-label">{$getTypeSafeQuantity}<span class="d-sm-none">x</span></span></td>
                <td class="text-right" data-title="<%t SilverCart\Model\Product\Product.PRICE 'Price' %>">{$PriceTotal.Nice}</td>
            </tr>
        <% end_loop %>

        <% if $TaxTotal %>
            <% loop $TaxTotal %>
                <tr>
                    <td class="text-right d-none d-sm-table-cell" colspan="5"><%t SilverCart\Model\Pages\Page.ADDITIONAL_VAT 'Additional VAT' %> ({$Rate}%)</td>
                    <td class="text-right" data-title="<%t SilverCart\Model\Pages\Page.ADDITIONAL_VAT 'Additional VAT' %> ({$Rate}%)">{$Amount.Nice}</td>
                </tr>
            <% end_loop %>
        <% end_if %>

        <tr>
            <td class="text-right d-none d-sm-table-cell" colspan="5"><strong><%t SilverCart\Model\Pages\Page.TOTAL 'Total' %></strong></td>
            <td class="text-right" data-title="<%t SilverCart\Model\Pages\Page.TOTAL 'Total' %>"><strong>{$AmountTotal.Nice}<% if $ShippingMethod.ShippingFee.PostPricing %>*<% end_if %></strong></td>
        </tr>

        <% if $HasIncludedInTotalPositions %>
            <% loop $OrderIncludedInTotalPositions %>
                <tr class="{$EvenOdd}">
                    <td class="text-right d-none d-sm-table-cell" colspan="5">{$Title.RAW}</td>
                    <td class="text-right" data-title="{$Title.RAW}">{$Price.Nice}</td>
                </tr>
            <% end_loop %>
        <% end_if %>
    </tbody>
</table>
<% if $ShippingMethod.ShippingFee.PostPricing %><b>* <%t SilverCart\Model\Pages\Page.PLUS_SHIPPING 'plus shipping' %>, <%t SilverCart\Model\Shipment\ShippingFee.POST_PRICING_INFO 'Manual calculation of shipping fees after order.' %></b><% end_if %>
