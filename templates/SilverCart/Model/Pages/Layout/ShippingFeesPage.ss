<div class="row">
    <div id="content-main" class="span9 col-lg-9 col-md-9 col-sm-12 col-xs-12">
        <% include SilverCart/Model/Pages/BreadCrumbs %>
        <div class="section-header clearfix">
            <h1>{$Title}</h1>
        </div>
        {$Content}
        <% if $Form %>
        <div class="form">
            {$Form}
        </div>
        <% end_if %>
<% if $Carriers %>
    <% loop $Carriers %>
        <% if $AllowedShippingMethods %>
        <div class="section-header clearfix special">
            <h2>{$Title}</h2>
        </div>
            <% loop $AllowedShippingMethods %>
                <% if $isActive %>
                    <% if $ShowOnShippingFeesPage %>
            <table class="silvercart-default-table table table-striped table-bordered table-padded">
                <caption>
                    <h3>{$Title}</h3>
                    <% if $DescriptionForShippingFeesPage %>
                        {$DescriptionForShippingFeesPage}
                    <% else_if $Description %>
                        {$Description}
                    <% end_if %>
                </caption>
                <thead>
                    <tr>
                        <th class="text-left col-20"><%t SilverCart\Model\Product\Product.WEIGHT 'Weight' %> ({$ShippingFees.first.MaximumWeightUnitAbreviation})</th>
                        <th class="text-left col-65"><%t SilverCart\Model\Shipment\Zone.SINGULARNAME 'Zone' %></th>
                        <th class="text-right"><%t SilverCart\Model\Product\Product.PRICE 'Price' %></th>
                    </tr>
                </thead>
                <tbody>
                <% loop $ShippingFees %>
                    <tr class="{$EvenOdd}">
                        <td class="text-right text-top"><% if $UnlimitedWeight %><%t SilverCart\Model\Shipment\ShippingFee.UNLIMITED_WEIGHT 'unlimited' %><% else %>{$MaximumWeightNice}<% end_if %></td>
                        <td class="text-left">
                            <div class="country-list">
                            <% with $Zone %>
                                <b>{$Title}:</b><br/>
                                <% if $hasAllCountries %>
                                    <strong><%t SilverCart\Model\Shipment\Zone.VALID_FOR_ALL_AVAILABLE 'Valid for all selectable countries' %></strong>
                                <% else %>
                                    <% loop $Countries %>
                                        <% if $Active %>
                                            {$Title}<br/>
                                        <% end_if %>
                                    <% end_loop %>
                                <% end_if %>
                            <% end_with %>
                            </div>
                        </td>
                        <td class="text-right text-top">{$PriceFormatted} <% if $PostPricing %>*<% end_if %></td>
                    </tr>
                <% end_loop %>
                <% if $hasFeeWithPostPricing %>
                    <tr class="info">
                        <td class="text-left" colspan="3">* <%t SilverCart\Model\Shipment\ShippingFee.POST_PRICING_INFO 'Pricing after order' %></td>
                    </tr>
                <% end_if %>
                </tbody>
            </table>
                    <% end_if %>
                <% end_if %>
            <% end_loop %>
        <% end_if %>
    <% end_loop %>
<% end_if %>
        <div class="silvercartWidgetHolder">
            {$InsertWidgetArea(Content)}
        </div>
    </div>
    <aside class="span3 col-lg-3 col-md-3 col-sm-12 col-xs-12">
        {$SubNavigation}
        {$InsertWidgetArea(Sidebar)}
    </aside>
</div>
