<div class="col-12 col-sm-6 col-lg-4 col-xl-3 col-xxl-2 mb-3 d-flex">
    <div class="card card-product silvercart-product-group-page-tile-item {$EvenOdd} clearfix w-100">
        <div class="thumbnail text-xs-center m-2">
        <% if $PriceIsLowerThanMsr || $isNewProduct %>
            <span class="position-absolute top-0 left-2">
            <% if $PriceIsLowerThanMsr %>
                <span class="badge badge-secondary" title="<%t SilverCart\Model\Product\Product.Sale 'Sale' %>"><i><%t SilverCart\Model\Product\Product.Sale 'Sale' %>!</i></span>
            <% end_if %>
            <% if $isNewProduct %>
                <span class="badge badge-primary" title="<%t SilverCart\Model\Product\Product.New 'New' %>"><i><%t SilverCart\Model\Product\Product.New 'New' %>!</i></span>
            <% end_if %>
            </span>
        <% end_if %>
        <% if $ListImage %>
            <a class="d-inline-block" href="{$Link}" title="<%t SilverCart\Model\Pages\Page.SHOW_DETAILS_FOR 'Show details for {title}' title=$Title %>">
                <img class="img-fluid lazyload" src="{$BaseHref}resources/vendor/silvercart/silvercart/client/img/loader-circle.gif" data-src="{$ListImage.Pad(400,240).URL}" alt="{$Title}" />
            </a>
        <% end_if %>
        </div>
        <div class="sc-product-title card-header py-2">
            <h2 id="product{$ID}" class="card-title h5 mb-0 <% if $PriceIsLowerThanMsr || $isNewProduct %>pt-2<% end_if %>">
                <a href="{$Link}" class="highlight" title="<%t SilverCart\Model\Pages\Page.SHOW_DETAILS_FOR 'Show details for {title}' title=$Title %>">{$ListTitle.HTML}</a>
            </h2>
        </div>
        <div class="card-body pt-0 pb-2">
            <div class="sc-product-price product-price text-center">
                <span class="price">
                <% if $PriceIsLowerThanMsr %>
                    <small class="text-line-through">{$MSRPrice.Nice}</small>
                    <strong class="text-danger" id="product-price-{$ID}">{$PriceNice}</strong>
                <% else %>
                    <strong id="product-price-{$ID}">{$PriceNice}</strong>
                <% end_if %>
                </span><br>
                <div class="sc-product-price-info">
                    <small>
                        <% if $Availability %>
                        {$AvailabilityStatus.singular_name}: <strong class="h6">{$Availability('badge', 'badge-availability')}</strong>
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
</div>