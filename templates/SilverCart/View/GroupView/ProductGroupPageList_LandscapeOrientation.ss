<div class="landscape-orientation list-item card card-product text-center text-md-left mb-3 {$EvenOdd} {$FirstLast}">
    <header class="card-header row no-gutters">
        <h2 id="product{$ID}" class="col-lg-10 card-title h3">
            <a href="{$Link}" class="highlight" title="<%t SilverCart\Model\Pages\Page.SHOW_DETAILS_FOR 'Show details for {title}' title=$Title %>">{$ListTitle.HTML}</a>
        </h2>
        <span class="col-lg-2 card-subtitle text-right"> <%t SilverCart\Model\Product\Product.PRODUCTNUMBER_SHORT 'Item no.' %>: {$ProductNumberShop}</span>
    </header>
    <div class="card-img text-center">
        <div class="thumbnail">
            <% if $ListImage.Responsive %>
            <a class="d-inline-block" href="{$Link}" title="<%t SilverCart\Model\Pages\Page.SHOW_DETAILS_FOR 'Show details for {title}' title=$Title %>">
                {$ListImage.Responsive.Theme('ImageResponsiveLazyLoad').Method('ScaleWidth').SrcSet('360w','640w','1080w').Sizes('(max-width: 768px) 95vw','(min-width: 768px) 60vw')}
            </a>
            <% else_if $ListImage %>
            <a class="d-inline-block" href="{$Link}" title="<%t SilverCart\Model\Pages\Page.SHOW_DETAILS_FOR 'Show details for {title}' title=$Title %>">
                <img class="img-fluid lazyload" src="{$BaseHref}resources/vendor/silvercart/silvercart/client/img/loader-circle.gif" data-src="{$ListImage.Pad(600,300).URL}" alt="{$Title}" />
            </a>
            <% end_if %>
        <% if $PriceIsLowerThanMsr || $isNewProduct %>
            <span class="position-absolute top-left-2">
            <% if $PriceIsLowerThanMsr %>
                <span class="badge badge-secondary" title="<%t SilverCart\Model\Product\Product.Sale 'Sale' %>"><i><%t SilverCart\Model\Product\Product.Sale 'Sale' %>!</i></span>
            <% end_if %>
            <% if $isNewProduct %>
                <span class="badge badge-primary" title="<%t SilverCart\Model\Product\Product.New 'New' %>"><i><%t SilverCart\Model\Product\Product.New 'New' %>!</i></span>
            <% end_if %>
            </span>
        <% end_if %>
        </div>
    </div>
    <div class="card-body no-gutters row">
        <div class="sc-product-shortinfo col-12 col-md-6">
            <% if $getHtmlEncodedShortDescription %>
            <div class="sc-product-description">
                <p>{$getHtmlEncodedShortDescription}</p>
            </div>
            <% end_if %>
        </div>
        <div class="sc-product-shortinfo col-12 col-md-6 text-right">
            <div class="sc-product-price product-price">
                <span class="price">
                <% if $PriceIsLowerThanMsr %>
                    <span class="text-line-through">{$MSRPrice.Nice}</span>
                    <strong class="text-danger" id="product-price-{$ID}">{$PriceNice}</strong>
                <% else %>
                    <strong id="product-price-{$ID}">{$PriceNice}</strong>
                <% end_if %>
                </span>
            </div>
            <div class="sc-product-price-info">
                <small>
                <% if $CurrentPage.showPricesGross %>
                    <strong><%t SilverCart\Model\Pages\Page.INCLUDING_TAX 'incl. {amount}% VAT' amount=$TaxRate %></strong>
                <% else_if $CurrentPage.showPricesNet %>
                    <strong><%t SilverCart\Model\Pages\Page.EXCLUDING_TAX 'plus VAT' %></strong>
                <% end_if %>
                <% with $CurrentPage.PageByIdentifierCode('SilvercartShippingFeesPage') %>
                    <a href="{$Link}" title="<%t SilverCart\Model\Pages\Page.GOTO 'go to {title} page' title=$Title.XML %>"><%t SilverCart\Model\Pages\Page.PLUS_SHIPPING 'plus shipping' %></a>
                <% end_with %>
                <% if $PackagingQuantity %> | <%t SilverCart\Model\Pages\ProductPage.PACKAGING_CONTENT 'Content' %>: <strong>{$PackagingQuantity} {$QuantityUnit.Title}</strong><% end_if %>
                <% if $Availability %> | {$AvailabilityStatus.singular_name}: <strong class="h6">{$Availability('badge', 'badge-availability')}</strong><% end_if %>
                </small>
            </div>
            <% if $PluggedInProductMetaData %>
            <hr/><% loop $PluggedInProductMetaData %>{$MetaData}<% end_loop %>
            <% end_if %>
        </div>
        <% if $PluggedInProductListAdditionalData %>
        <div class="additionalData">
            <% loop $PluggedInProductListAdditionalData %>{$AdditionalData}<% end_loop %>
        </div>
        <% end_if %>
    </div>
    <div class="card-footer clearfix text-right">
        <a class="btn btn-secondary" data-title="<%t SilverCart\Model\Pages\Page.SHOW_DETAILS 'show details' %>" data-placement="top" data-toggle="tooltip" href="{$Link}" title="<%t SilverCart\Model\Pages\Page.SHOW_DETAILS_FOR 'Show details for {title}' title=$Title %>"><span class="fa fa-info-circle"></span> <%t SilverCart\Model\Pages\Page.SHOW_DETAILS 'show details' %></a>
    </div>
</div>
