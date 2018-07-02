<div class="landscape-orientation">
    <div class="card-header">
        <h2 class="col-lg-10 card-title">
            <a href="{$Link}" class="highlight" title="<%t SilverCart\Model\Pages\Page.SHOW_DETAILS_FOR 'Show details for {title}' title=$Title %>">{$Title.HTML}</a>
        </h2>
        <span class="col-lg-2 card-subtitle text-right"> <%t SilverCart\Model\Product\Product.PRODUCTNUMBER_SHORT 'Item no.' %>: {$ProductNumberShop}</span>
    </div>
    <div class="card-img text-center">
        <div class="thumbnail text-center">
            <% if $isNewProduct %><span class="absolute top-left tag-new tag tag-info" title="<%t SilverCart\Model\Product\Product.New 'New' %>"><b><%t SilverCart\Model\Product\Product.New 'New' %>!</b></span><% end_if %>
            <% if $ListImage %>
            <a href="{$Link}" title="<%t SilverCart\Model\Pages\Page.SHOW_DETAILS_FOR 'Show details for {title}' title=$Title %>">
                <img class="img-fluid lazyload" src="{$BaseHref}resources/vendor/silvercart/silvercart/client/img/loader-circle.gif" data-src="{$ListImage.Pad(400,400).URL}" alt="{$Title}" />
            </a>
            <% end_if %>
        </div>
    </div>
    <div class="card-block">
        <div class="sc-product-shortinfo col-md-6">
            <% if $getHtmlEncodedShortDescription %>
            <div class="sc-product-description">
                <p>{$getHtmlEncodedShortDescription}</p>
            </div>
            <% end_if %>
        </div>
        <div class="sc-product-shortinfo col-md-6 text-right">
            <div class="sc-product-price product-price">
                <span class="price">
                <% if $PriceIsLowerThanMsr %>
                    <span class="strike-through">{$MSRPrice.Nice}</span>
                    <strong class="text-danger" id="product-price-{$ID}">{$PriceNice}</strong>
                <% else %>
                    <strong id="product-price-{$ID}">{$PriceNice}</strong>
                <% end_if %>
                </span>
            </div>
            <div class="sc-product-price-info margin-top">
                <small>
                <% if $CurrentPage.showPricesGross %>
                    <strong><%t SilverCart\Model\Pages\Page.INCLUDING_TAX 'incl. {amount}% VAT' amount=$TaxRate %></strong>
                <% else_if $CurrentPage.showPricesNet %>
                    <strong><%t SilverCart\Model\Pages\Page.EXCLUDING_TAX 'plus VAT' %></strong>
                <% end_if %>
                <% with $CurrentPage.PageByIdentifierCode('SilvercartShippingFeesPage') %>
                    <a href="{$Link}" title="<%t SilverCart\Model\Pages\Page.GOTO 'go to {title} page' title=$Title.XML %>"><%t SilverCart\Model\Pages\Page.PLUS_SHIPPING 'plus shipping' %></a>
                <% end_with %>
                <% if $PackagingQuantity %>
                    | <%t SilverCart\Model\Pages\ProductPage.PACKAGING_CONTENT 'Content' %>: <strong>{$PackagingQuantity} {$QuantityUnit.Title}</strong>
                <% end_if %>
                <% if $Availability %>
                    | {$AvailabilityStatus.singular_name}: {$Availability('tag', 'tag-availability')}
                <% end_if %>
                </small>
            </div>
            <% if $PluggedInProductMetaData %>
            <div><hr/><% loop $PluggedInProductMetaData %>{$MetaData}<% end_loop %></div>
            <% end_if %>
        </div>
        <% if $PluggedInProductListAdditionalData %>
        <div class="pull-xs-left additionalData">
            <% loop $PluggedInProductListAdditionalData %>
                {$AdditionalData}
            <% end_loop %>
        </div>
        <% end_if %>
    </div>
    <div class="card-footer clearfix text-right">
        <a class="btn btn-sm btn-secondary" data-title="<%t SilverCart\Model\Pages\Page.SHOW_DETAILS 'show details' %>" data-placement="top" data-toggle="tooltip" href="{$Link}" title="<%t SilverCart\Model\Pages\Page.SHOW_DETAILS_FOR 'Show details for {title}' title=$Title %>"><span class="fa fa-info-circle"></span> <%t SilverCart\Model\Pages\Page.SHOW_DETAILS 'show details' %></a>
    </div>
</div>
