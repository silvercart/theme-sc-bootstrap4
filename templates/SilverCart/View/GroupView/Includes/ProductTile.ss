<div class="col-12 col-sm-6 col-lg-6 col-xl-4 col-xxl-3 mb-3 d-flex">
    <div class="card card-product silvercart-product-group-page-tile-item {$EvenOdd} clearfix w-100">
        <div class="sc-product-title card-header">
            <h2 id="product{$ID}" class="card-title h5 mb-0 <% if $PriceIsLowerThanMsr || $isNewProduct %>pt-2<% end_if %>">
                <a href="{$Link}" class="highlight" title="<%t SilverCart\Model\Pages\Page.SHOW_DETAILS_FOR 'Show details for {title}' title=$Title %>">{$Title.HTML}</a>
            </h2>
        </div>
        <div class="thumbnail text-xs-center">
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
        <div class="card-body pb-0">
            <div class="sc-product-price product-price text-center">
                <span class="price">
                <% if $PriceIsLowerThanMsr %>
                    <span class="text-line-through">{$MSRPrice.Nice}</span>
                    <strong class="text-danger" id="product-price-{$ID}">{$PriceNice}</strong>
                <% else %>
                    <strong id="product-price-{$ID}">{$PriceNice}</strong>
                <% end_if %>
                </span><br>
                <div id="toogle{$ID}" class="sc-product-price-info">
                    <small class="d-block">
                    <% if $CurrentPage.showPricesGross %>
                        <strong><%t SilverCart\Model\Pages\Page.INCLUDING_TAX 'incl. {amount}% VAT' amount=$TaxRate %></strong>, 
                    <% else_if $CurrentPage.showPricesNet %>
                        <strong><%t SilverCart\Model\Pages\Page.EXCLUDING_TAX 'plus VAT' %></strong>,
                    <% end_if %>
                    <% with $CurrentPage.PageByIdentifierCode('SilvercartShippingFeesPage') %>
                        <a href="{$Link}" title="<%t SilverCart\Model\Pages\Page.GOTO 'go to {title} page' title=$Title.XML %>"><%t SilverCart\Model\Pages\Page.PLUS_SHIPPING 'plus shipping' %></a><br/>
                    <% end_with %>
                    </small>
                    <small>
                        <%t SilverCart\Model\Product\Product.PRODUCTNUMBER_SHORT 'Item no.' %>: <strong>{$ProductNumberShop}</strong>
                        <% if $PackagingQuantity %> | <%t SilverCart\Model\Pages\ProductPage.PACKAGING_CONTENT 'Content' %>: <strong>{$PackagingQuantity} {$QuantityUnit.Title}</strong><% end_if %>
                        <% if $Availability %> | {$AvailabilityStatus.singular_name}: <strong class="h6">{$Availability('badge', 'badge-availability')}</strong><% end_if %>
                    </small>
                </div>
            </div>
        </div>
        <div class="card-footer">
            <a class="btn btn-secondary btn-block" href="{$Link}" title="<%t SilverCart\Model\Pages\Page.SHOW_DETAILS_FOR 'Show details for {title}' title=$Title %>" data-title="<%t SilverCart\Model\Pages\Page.SHOW_DETAILS 'show details' %>" data-placement="top" data-toggle="tooltip">
                <span class="fa fa-info-circle"></span> <%t SilverCart\Model\Pages\Page.SHOW_DETAILS 'show details' %></a>
    <% if $PluggedInProductMetaData %>
        <% loop $PluggedInProductMetaData %>
            {$MetaData}
        <% end_loop %>
    <% end_if %>
        </div>
    </div>
</div>