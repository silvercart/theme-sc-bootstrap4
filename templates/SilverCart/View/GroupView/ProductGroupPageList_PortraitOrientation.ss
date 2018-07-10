<article class="portrait-orientation list-item card card-product text-center text-md-left mb-3 {$EvenOdd} {$FirstLast}">
    <div class="card-body row no-gutters pt-0 pl-0 pb-0">
        <div class="col-12 col-md-4">
            <div class="card-img thumbnail">
                <a class="d-inline-block" href="{$Link}" title="<%t SilverCart\Model\Pages\Page.SHOW_DETAILS_FOR 'Show details for {title}' title=$Title %>">
                <% if $ListImage.Responsive %>
                    {$ListImage.Responsive.Theme('ImageResponsiveLazyLoad').Ratio(1.8).Method('Pad').SrcSet('200w','300w','550w').Sizes('(max-width: 544px) 80vw', '(min-width: 544.1px) and (max-width: 992px) 25vw','(min-width: 992.1px) 20vw')}
                <% else_if $ListImage %>
                    <img class="img-fluid lazyload" src="{$BaseHref}resources/vendor/silvercart/silvercart/client/img/loader-circle.gif" data-src="{$ListImage.Pad(400,400).URL}" alt="{$Title}" />
                <% end_if %>
                </a>
            </div>
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
        <div class="col-12 col-md-8">
            <header class="card-header no-gutters">
                <h2 id="product{$ID}" class="card-title">
                    <a href="{$Link}" class="highlight" title="<%t SilverCart\Model\Pages\Page.SHOW_DETAILS_FOR 'Show details for {title}' title=$Title %>">{$Title.HTML}</a>
                </h2>
            </header>
            <div class="row">
            <% if $getHtmlEncodedShortDescription || $PluggedInProductListAdditionalData %>
                <div class="sc-product-shortinfo col-12 col-md-6">
                <% if $getHtmlEncodedShortDescription %>
                    <div class="sc-product-description"><p>{$getHtmlEncodedShortDescription}</p></div>
                <% end_if %>
                <% if $PluggedInProductListAdditionalData %>
                    <div class="additionalData"><% loop $PluggedInProductListAdditionalData %>{$AdditionalData}<% end_loop %></div>
                <% end_if %>
                </div>
            <% end_if %>
                <div class="sc-product-shortinfo col-12 <% if $getHtmlEncodedShortDescription || $PluggedInProductListAdditionalData %>col-md-6<% end_if %> text-right">
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
                    <div class="sc-product-price-info margin-top">
                        <small>
                        <% if $CurrentPage.showPricesGross %>
                            <strong><%t SilverCart\Model\Pages\Page.INCLUDING_TAX 'incl. {amount}% VAT' amount=$TaxRate %></strong>
                        <% else_if $CurrentPage.showPricesNet %>
                            <strong><%t SilverCart\Model\Pages\Page.EXCLUDING_TAX 'plus VAT' %></strong>
                        <% end_if %>
                        <% with $CurrentPage.PageByIdentifierCode('SilvercartShippingFeesPage') %>
                            <a href="{$Link}" title="<%t SilverCart\Model\Pages\Page.GOTO 'go to {title} page' title=$Title.XML %>"><%t SilverCart\Model\Pages\Page.PLUS_SHIPPING 'plus shipping' %></a><br/>
                        <% end_with %>
                        <%t SilverCart\Model\Product\Product.PRODUCTNUMBER_SHORT 'Item no.' %>: <strong>{$ProductNumberShop}</strong>
                        <% if $PackagingQuantity %> | <%t SilverCart\Model\Pages\ProductPage.PACKAGING_CONTENT 'Content' %>: <strong>{$PackagingQuantity} {$QuantityUnit.Title}</strong><% end_if %>
                        <% if $Availability %> | <span class="text-nowrap">{$AvailabilityStatus.singular_name}: {$Availability('tag', 'tag-availability')}</span><% end_if %>
                        </small>
                    </div>
                <% if $PluggedInProductMetaData %>
                    <hr/><% loop $PluggedInProductMetaData %>{$MetaData}<% end_loop %>
                <% end_if %>
                </div>
            </div>
        </div>
    </div>
    <div class="card-footer clearfix text-right position-absolute bottom-right">
        <a class="btn btn-sm btn-secondary" data-title="<%t SilverCart\Model\Pages\Page.SHOW_DETAILS 'show details' %>" data-placement="top" data-toggle="tooltip" href="{$Link}" title="<%t SilverCart\Model\Pages\Page.SHOW_DETAILS_FOR 'Show details for {title}' title=$Title %>"><span class="fa fa-info-circle"></span> <%t SilverCart\Model\Pages\Page.SHOW_DETAILS 'show details' %></a>
    </div>
</article>
