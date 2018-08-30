<div class="row">
    <section id="content-main" class="col-12 col-md-9">
        <h2 class="sr-only">{$Title}</h2>
        <% include SilverCart/Model/Pages/BreadCrumbs %>
        <article>
            <header><h1>{$Title}</h1></header>
            {$Content}
        <% if $Form %>
            {$Form}
        <% end_if %>
<% if $Carriers %>
    <% loop $Carriers %>
        <% if $AllowedShippingMethods %>
        <section>
            <h2>{$Title}</h2>
            <hr/>
            <% loop $AllowedShippingMethods %>
                <% if $isActive %>
                    <% if $ShowOnShippingFeesPage %>
            <h3>{$Carrier.Title} - {$Title}</h3>
            <table class="silvercart-default-table table table-striped table-bordered table-padded">
                <caption>
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
                    <tr>
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
        </section>
        <% end_if %>
    <% end_loop %>
<% end_if %>
        </article>
        <% include SilverCart/Model/Pages/WidgetSetContent %>
    </section>
    <aside class="col-12 col-md-3">
        {$SubNavigation}
        {$InsertWidgetArea(Sidebar)}
    </aside>
</div>
