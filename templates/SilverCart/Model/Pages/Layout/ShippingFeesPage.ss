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
            <h2 class="sr-only">{$Title}</h2>
            <% loop $AllowedShippingMethods %>
                <% if $isActive && $ShowOnShippingFeesPage %>
            <h3 class="border-top mt-4 pt-3">{$Carrier.Title} - {$Title}</h3>
                    <% if $isPickup %>
            <div class="mb-3">
                    <% if $DescriptionForShippingFeesPage %>
            <p>{$DescriptionForShippingFeesPage}</p>
                    <% else_if $Description %>
            <p>{$Description}</p>
                    <% end_if %>
                <% loop $ShippingFees %>
            <p>
                    <% if $Up.setShippingFeeByID($ID).getDeliveryTime(true) %>
                        {$Up.fieldLabel('ReadyForPickup')}: {$Up.getDeliveryTime(true)}
                    <% end_if %>
                    <% if $Price.Amount == 0 %>
                    <span class="text-success font-weight-bold ml-3"><span class="fa fa-check"></span> {$Up.Title} ist für Sie kostenfrei.</span>
                    <% else %>
                    {$Up.fieldLabel('Price')}: {$PriceFormatted}
                    <% end_if %>
            </p>
                <% end_loop %>
            </div>
                        <% else %>
                            <% if $DescriptionForShippingFeesPage %>
            <p>{$DescriptionForShippingFeesPage}</p>
                            <% else_if $Description %>
            <p>{$Description}</p>
                            <% end_if %>
            <table class="silvercart-default-table table table-striped table-bordered table-padded">
                <thead>
                    <tr>
                        <th class="text-left">{$fieldLabel('SuppliedCountries')}</th>
                        <th class="text-left">{$fieldLabel('ExpectedDeliveryTime')}</th>
                        <th class="text-right"><%t SilverCart\Model\Product\Product.PRICE 'Price' %></th>
                    </tr>
                </thead>
                <tbody>
                <% loop $ShippingFees %>
                    <tr>
                        <td class="text-left">
                            <div class="country-list">
                            <% with $Zone %>
                                <% if $Countries.count > 10 && $hasAllCountries %>
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
                        <td class="text-left text-top">{$Up.setShippingFeeByID($ID).getDeliveryTime(true)}</td>
                        <td class="text-right text-top">
                            {$PriceFormatted} <% if $PostPricing %>*<% end_if %>
                        <% if not $UnlimitedWeight %>
                            <div class="font-italic">{$fieldLabel('MaximumWeight')}: {$MaximumWeightNice}</div>
                        <% end_if %>
                        <% if $Price.Amount > 0 && $FreeOfShippingCostsFrom.Amount > 0 %>
                            <div class="alert alert-success text-left text-hyphens-auto font-weight-bold"><span class="fa fa-check"></span> <%t SilverCart\Model\Shipment\ShippingMethod.NoShippingCostFrom 'No shipping cost for orders with a minimum order value of {amount}.' amount=$FreeOfShippingCostsFrom.Nice %></div>
                        <% end_if %>
                        </td>
                    </tr>
                <% end_loop %>
                </tbody>
                <% if $hasFeeWithPostPricing %>
                <caption class="text-left font-italic">* <%t SilverCart\Model\Shipment\ShippingFee.POST_PRICING_INFO 'Pricing after order' %></caption>
                <% end_if %>
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
        {$InsertWidgetArea('Sidebar')}
    </aside>
</div>
