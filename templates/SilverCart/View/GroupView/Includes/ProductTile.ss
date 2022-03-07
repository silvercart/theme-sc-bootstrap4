<div class="col-12 col-sm-6 col-lg-4 col-xl-3 col-xxl-2 mb-3 d-flex">
    <div class="card card-product silvercart-product-group-page-tile-item {$EvenOdd} clearfix w-100 text-center">
        <div class="thumbnail m-2">
        <% include SilverCart/Model/Pages/ProductBadges %>
        <% if $ListImage %>
            <a class="d-inline-block" href="{$Link}" title="<%t SilverCart\Model\Pages\Page.SHOW_DETAILS_FOR 'Show details for {title}' title=$Title %>">
           <img class="img-fluid lazyload" src="{$BaseHref}resources/vendor/silvercart/silvercart/client/img/loader-circle.gif" data-src="{$ListImage.Pad(400,240).URL}" alt="{$Title}" />
            </a>
        <% end_if %>
        </div>
        <div class="sc-product-title card-header py-2">
            <h3 id="product{$ID}" class="card-title h5 mb-0 <% if $PriceIsLowerThanMsr || $isNewProduct || $IsTopProduct || $Highlights.exists %>pt-2<% end_if %>">
                <a href="{$Link}" class="highlight" title="<%t SilverCart\Model\Pages\Page.SHOW_DETAILS_FOR 'Show details for {title}' title=$Title %>">{$ListTitle.HTML}</a>
            </h3>
        </div>
        <div class="card-body pt-0 pb-2 sc-product-price product-price">
                <span class="price">
                <% if $PriceIsLowerThanMsr %>
                    <small class="text-line-through">{$MSRPrice.Nice}</small>
                    <span class="text-danger font-weight-bold" id="product-price-{$ID}">{$PriceNice}</span>
                <% else %>
                    <span class="font-weight-bold" id="product-price-{$ID}">{$PriceNice}</span>
                <% end_if %>
                </span><br>
                <div class="sc-product-price-info">
                    <small>
                        <% if $Availability %>
                        {$AvailabilityStatus.singular_name}: <span class="h6 font-weight-bold">{$Availability('badge', 'badge-availability')}</span>
                        <% end_if %>
                        <% if $HasDeliveryTime  || $DeliveryForFreeIsPossible || $StockQuantityIsLow %>
                        <span class="d-block">
                            <% if $HasDeliveryTime %>
                            {$fieldLabel('Delivery')} <span class="text-success font-weight-bold">{$EarliestDeliveryDate}</span><br/>
                            <% else_if $HasReleaseDate %>
                                <span class="text-primary font-weight-bold"><span class="fa fa-info-circle"></span> <%t SilverCart\Model\Product\Product.Preorderable 'pre-orderable' %></span><br/>
                            <% end_if %>
                            <% if $DeliveryForFreeIsPossible %>
                            <span class=""><span class="fa fa-check"></span> {$fieldLabel('DeliveryForFreeIsPossible')}</span><br/>
                            <% end_if %>
                            <% if $StockQuantityIsLow %>
                            <span class="text-danger"><span class="fa fa-exclamation-circle"></span> {$fieldLabel('StockIsLowOrderNow')}</span><br/>
                            <% end_if %>
                        </span>
                        <% end_if %>
                        <% if $PluggedInProductListAdditionalData %>
                        <% loop $PluggedInProductListAdditionalData %><span class="d-block">{$AdditionalData}</span><% end_loop %>
                        <% end_if %>
                    </small>
                </div>
        </div>
    </div>
</div>