<div class="product-img-box card-body landscape-orientation text-center text-sm-left">
    <% if $getImages.count < 2 %>
    <div class="product-img thumbnail text-center">
        <% with $ListImage %>
        <a class="fancybox" href="{$Link}" data-fancybox-group="silvercart-standard-product-image-group" title="{$Up.Title}"><img class="img-fluid" src="{$Fit(940,450).URL}" alt="{$Up.Title}" /></a>
        <% end_with %>
    </div>
    <% else %>
    <div class="row">
        <div class="product-img thumbnail text-center col-lg-10 col-md-10 col-sm-9 col-xs-12">
        <% if $ListImage %>
            <% with $ListImage %>
            <a class="fancybox" href="{$Link}" data-fancybox-group="silvercart-standard-product-image-group" title="{$Up.Title}"><img class="img-fluid" src="{$Fit(940,450).URL}" alt="{$Up.Title}" /></a>
            <% end_with %>
        <% end_if %>
        </div>
        <div class="product-img-thumb col-lg-2 col-md-2 col-sm-3 col-xs-12">
        <% loop $getImages %>
            <% if not $First %>
            <a class="fancybox float-right mb-1" href="{$Image.Link}" data-fancybox-group="silvercart-standard-product-image-group" title="{$Product.Title}"><img class="img-thumbnail" src="{$Image.Pad(100,80).URL}" alt="{$Product.Title}" /></a>
            <% end_if %>
        <% end_loop %>
        </div>
    </div>
    <% end_if %>
</div>
<div class="row card-body no-gutters">
    <div class="col-sm-6 bordered order-sm-1">
    <% if $PriceIsLowerThanMsr || $isNewProduct %>
        <span class="position-absolute top-left">
        <% if $PriceIsLowerThanMsr %>
            <span class="badge badge-secondary" title="<%t SilverCart\Model\Product\Product.Sale 'Sale' %>"><i><%t SilverCart\Model\Product\Product.Sale 'Sale' %>!</i></span>
        <% end_if %>
        <% if $isNewProduct %>
            <span class="badge badge-primary" title="<%t SilverCart\Model\Product\Product.New 'New' %>"><i><%t SilverCart\Model\Product\Product.New 'New' %>!</i></span>
        <% end_if %>
        </span>
    <% end_if %>
        <div class="product-price text-right w-100">
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
            </small>
        </div>
        <div class="clearfix mt-3">
            <div class="float-right">
        <% if $isBuyableDueToStockManagementSettings %>
                {$AddToCartForm(Detail)}
        <% else %>
                <div class="alert alert-warning"><%t SilverCart\Model\Pages\ProductPage.OUT_OF_STOCK 'This product is out of stock.' %></div>
        <% end_if %>
            </div>
        </div>
    </div>
    <div class="col-sm-6 order-sm-0">
        <div class="product-info">
            <% if $PluggedInProductMetaData %>
                <% loop $PluggedInProductMetaData %>
                    {$MetaData}
                <% end_loop %>
            <% end_if %>
            <dl class="row">
            <% if $AvailabilityStatus %>
                <dt class="col-5 col-sm-6 col-lg-5 col-xl-4 col-xxl-3"><%t SilverCart\Model\Product\AvailabilityStatus.SINGULARNAME 'Availability' %>:</dt>
                <dd class="col-7 col-sm-6 col-lg-7 col-xl-8 col-xxl-9">{$Availability('tag', 'tag-availability')}</dd>
            <% end_if %>
                <dt class="col-5 col-sm-6 col-lg-5 col-xl-4 col-xxl-3"><%t SilverCart\Model\Product\Product.PRODUCTNUMBER_SHORT 'Item no.' %>:</dt>
                <dd class="col-7 col-sm-6 col-lg-7 col-xl-8 col-xxl-9"><span>{$ProductNumberShop}</span></dd>
            <%-- if $Top.SiteConfig.enableStockManagement %>
                <dt class="col-5 col-sm-6 col-lg-5 col-xl-4 col-xxl-3">{$fieldLabel(StockQuantity)}:</dt>
                <dd class="col-7 col-sm-6 col-lg-7 col-xl-8 col-xxl-9"><span>{$StockQuantity} {$QuantityUnit.Title}</span></dd>
            <% end_if --%>
            <% if $PackagingQuantity %>
                <dt class="col-5 col-sm-6 col-lg-5 col-xl-4 col-xxl-3"><%t SilverCart\Model\Pages\ProductPage.PACKAGING_CONTENT 'Content' %>:</dt>
                <dd class="col-7 col-sm-6 col-lg-7 col-xl-8 col-xxl-9">{$PackagingQuantity} {$QuantityUnit.Title}</dd>
            <% end_if %>
            <% if $Manufacturer %>
                <% with $Manufacturer %>
                <dt class="col-5 col-sm-6 col-lg-5 col-xl-4 col-xxl-3">{$singular_name}:</dt>
                <dd class="col-7 col-sm-6 col-lg-7 col-xl-8 col-xxl-9"><% if $Title %>{$Title}<% end_if %>
                    <% if $logo %><br/><img class="img-fluid" src="{$logo.Pad(100,50).URL}" alt="{$Title}" /><% end_if %>
                </dd>
                <% end_with %>
            <% end_if %>
            </dl>
        </div>
    </div>
</div>
<% if $HtmlEncodedShortDescription %>
<div class="product-info card-body">
    <p class="card-text">{$HtmlEncodedShortDescription}</p>
</div>
<% end_if %>