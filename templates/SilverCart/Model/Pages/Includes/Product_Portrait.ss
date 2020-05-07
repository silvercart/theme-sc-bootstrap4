<div class="card-body portrait-orientation row">
    <div class="product-img-box col-lg-6">
        <div class="product-img thumbnail text-right">
        <% if $ListImage %>
            <% with $ListImage %>
            <a class="fancybox" href="{$Link}" data-fancybox-group="silvercart-standard-product-image-group" title="{$Up.Title}"><img class="img-fluid" src="{$Pad(500,350).URL}" alt="{$Up.Title}" title="{$Up.Title}" /></a>
            <% end_with %>
        <% end_if %>
        </div>
        <% if $getImages.count > 1 %>
        <div class="product-img thumbnail">
            <% loop $getImages %>
                <% if not $First %>
            <a class="fancybox" href="{$Image.Link}" data-fancybox-group="silvercart-standard-product-image-group" title="{$Product.Title}"><img class="img-thumbnail" src="{$Image.Pad(100,80).URL}" alt="{$Product.Title}" title="{$Product.Title}" /></a>
                <% end_if %>
            <% end_loop %>
        </div>
        <% end_if %>
        <% if $HtmlEncodedShortDescription %>
        <div class="product-info card-body">
            <p class="card-text">{$HtmlEncodedShortDescription}</p>
        </div>
        <% end_if %>
    </div>
    <div class="col-lg-6 pr-4">
        <div class="product-info">
            <% if $PluggedInProductMetaData %>
                <% loop $PluggedInProductMetaData %>
                    {$MetaData}
                <% end_loop %>
            <% end_if %>
            <dl class="row">
            <% if $AvailabilityStatus %>
                <dt class="col-5 col-sm-4 col-lg-5 col-xl-4 col-xxl-3"><%t SilverCart\Model\Product\AvailabilityStatus.SINGULARNAME 'Availability' %>:</dt>
                <dd class="col-7 col-sm-8 col-lg-7 col-xl-8 col-xxl-9">{$Availability('badge', 'badge-availability')}</dd>
            <% end_if %>
                <dt class="col-5 col-sm-4 col-lg-5 col-xl-4 col-xxl-3"><%t SilverCart\Model\Product\Product.PRODUCTNUMBER_SHORT 'Item no.' %>:</dt>
                <dd class="col-7 col-sm-8 col-lg-7 col-xl-8 col-xxl-9"><span>{$ProductNumberShop}</span></dd>
            <%-- if $Top.SiteConfig.enableStockManagement %>
                <dt class="col-5 col-sm-4 col-lg-5 col-xl-4 col-xxl-3">{$fieldLabel(StockQuantity)}:</dt>
                <dd class="col-7 col-sm-8 col-lg-7 col-xl-8 col-xxl-9"><span>{$StockQuantity} {$QuantityUnit.Title}</span></dd>
            <% end_if --%>
            <% if $EANCode %>
                <dt class="col-5 col-sm-4 col-lg-5 col-xl-4 col-xxl-3">{$fieldLabel(EANCode)}:</dt>
                <dd class="col-7 col-sm-8 col-lg-7 col-xl-8 col-xxl-9"><span>{$EANCode}</span></dd>
            <% end_if %>
            <% if $PackagingQuantity %>
                <dt class="col-5 col-sm-4 col-lg-5 col-xl-4 col-xxl-3"><%t SilverCart\Model\Pages\ProductPage.PACKAGING_CONTENT 'Content' %>:</dt>
                <dd class="col-7 col-sm-8 col-lg-7 col-xl-8 col-xxl-9">{$PackagingQuantity} {$QuantityUnit.Title}</dd>
            <% end_if %>
            <% if $Manufacturer %>
                <% with $Manufacturer %>
                <dt class="col-5 col-sm-4 col-lg-5 col-xl-4 col-xxl-3">{$singular_name}:</dt>
                <dd class="col-7 col-sm-8 col-lg-7 col-xl-8 col-xxl-9"><% if $Title %>{$Title}<% end_if %>
                    <% if $logo %><br/><img src="{$logo.Pad(100,50).URL}" alt="{$Title}" /><% end_if %>
                </dd>
                <% end_with %>
            <% end_if %>
            </dl>
        </div>

        <div class="bordered padding">
        <% if $PriceIsLowerThanMsr || $isNewProduct %>
            <span class="position-absolute top-right">
            <% if $PriceIsLowerThanMsr %>
                <span class="badge badge-secondary" title="<%t SilverCart\Model\Product\Product.Sale 'Sale' %>"><i><%t SilverCart\Model\Product\Product.Sale 'Sale' %>!</i></span>
            <% end_if %>
            <% if $isNewProduct %>
                <span class="badge badge-primary" title="<%t SilverCart\Model\Product\Product.New 'New' %>"><i><%t SilverCart\Model\Product\Product.New 'New' %>!</i></span>
            <% end_if %>
            </span>
        <% end_if %>
            <div class="product-price text-right">
                <span>
                <% if $PriceIsLowerThanMsr %>
                    <span class="text-line-through">{$MSRPrice.Nice}</span>
                    <strong class="price price-offer" id="product-price-{$ID}">{$PriceNice}</strong>
                <% else %>
                    <strong class="price" id="product-price-{$ID}">{$PriceNice}</strong>
                <% end_if %>
                </span><br/>
                <small class="sc-product-price-info">
                <% if $CurrentPage.showPricesGross %>
                    <%t SilverCart\Model\Pages\Page.INCLUDING_TAX 'incl. {amount}% VAT' amount=$TaxRate %>
                <% else_if $CurrentPage.showPricesNet %>
                    <%t SilverCart\Model\Pages\Page.EXCLUDING_TAX 'plus VAT' %>
                <% end_if %>
                <% with $CurrentPage.PageByIdentifierCode('SilvercartShippingFeesPage') %>
                    <a href="{$Link}" title="<%t SilverCart\Model\Pages\Page.GOTO 'Go to {title} page' title=$Title.XML %>">
                        <%t SilverCart\Model\Pages\Page.PLUS_SHIPPING 'plus shipping' %><br/>
                    </a>
                <% end_with %>
                <% if $HasDeliveryTime || $HasReleaseDate || $DeliveryForFreeIsPossible || $StockQuantityIsLow %>
                    <span class="d-block">
                    <% if $HasDeliveryTime %>
                        {$fieldLabel('Delivery')} <span class="text-success font-weight-bold">{$FullDeliveryDate}</span><br/>
                    <% else_if $HasReleaseDate %>
                        <span class="text-success font-weight-bold"><span class="fa fa-info-circle"></span> <%t SilverCart\Model\Product\Product.ThisProductWillBeReleasedOn 'This product will be released on {releasedate}' releasedate=$FullReleaseDate %></span><br/>
                    <% end_if %>
                    <% if $DeliveryForFreeIsPossible %>
                        <span class="fa fa-check"></span> {$DeliveryForFreeIsPossibleInfo}<br/>
                    <% end_if %>
                    <% if $StockQuantityIsLow %>
                        <span class="text-danger"><span class="fa fa-exclamation-circle"></span> {$fieldLabel('StockIsLowOrderNow')}</span><br/>
                    <% end_if %>
                    </span>
                <% end_if %>
                </small>
            </div>
            <div class="clearfix mt-3">
                <div class="float-right">
            <% if $isBuyableDueToStockManagementSettings %>
                    {$AddToCartForm('Detail')}
            <% else %>
                    <div class="alert alert-warning"><%t SilverCart\Model\Pages\ProductPage.OUT_OF_STOCK 'This product is out of stock.' %></div>
                    {$AfterOutOfStockNotificationContent}
            <% end_if %>
                </div>
            </div>
        </div>
    </div>
</div>