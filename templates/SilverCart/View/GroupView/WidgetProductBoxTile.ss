<% if $Elements %>
    <% if not $Top.useSlider %>
<div class="sc-products sc-products-vertical-tiny clearfix no-slider">
    <% end_if %>
    <div class="row">
    <% loop $Elements %>
        <div class="d-flex <% if $Up.IsInContentArea %>col-12 col-sm-6 col-lg-4 col-xxl-3<% else %>col-12 col-xxl-6<% end_if %>">
            <article class="card card-product my-2 silvercart-product-group-page-tile-item {$EvenOdd} clearfix text-center w-100">
                <header class="sc-product-title card-header">
                    <h2 id="product{$ID}" class="card-title h5 mb-0 <% if $PriceIsLowerThanMsr || $isNewProduct %>pt-2<% end_if %>">
                        <a href="{$Link}" class="highlight" title="<%t SilverCart\Model\Pages\Page.SHOW_DETAILS_FOR 'Show details for {title}' title=$Title %>">{$Title.HTML}</a>
                    </h2>
                </header>
                <div class="thumbnail">
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
                    <a class="d-inline-block" href="{$Link}" title="<%t SilverCart\Model\Pages\Page.SHOW_DETAILS_FOR 'Show details for {title}' title=$Title %>">
                <% if $ListImage.Responsive %>
                        {$ListImage.setExtraClasses('d-inline-block').Responsive.Theme('ImageResponsiveLazyLoad').Ratio(2.5).Method('Pad').SrcSet('150w','300w').Sizes('(max-width: 544px) 50vw', '(min-width: 544.1px) 20vw')}
                <% else_if $ListImage %>
                        <img class="img-fluid lazyload" src="{$BaseHref}resources/vendor/silvercart/silvercart/client/img/loader-circle.gif" data-src="{$ListImage.Pad(275,165).URL}" alt="{$Title}" />
                <% end_if %>
                    </a>
                </div>
                <div class="card-body pb-0">
                    <div class="sc-product-price product-price">
                        <span class="price">
                        <% if $PriceIsLowerThanMsr %>
                            <span class="text-line-through">{$MSRPrice.Nice}</span>
                            <strong class="text-danger">{$PriceNice}</strong>
                        <% else %>
                            <strong>{$PriceNice}</strong>
                        <% end_if %>
                        </span><br>
                        <div id="toogle{$ID}" class="sc-product-price-info">
                            <small class="d-block">
                            <% if $CurrentPage.showPricesGross %>
                                <%t SilverCart\Model\Pages\Page.INCLUDING_TAX 'incl. {amount}% VAT' amount=$TaxRate %>, 
                            <% else_if $CurrentPage.showPricesNet %>
                                <%t SilverCart\Model\Pages\Page.EXCLUDING_TAX 'plus VAT' %>,
                            <% end_if %>
                            <% with $CurrentPage.PageByIdentifierCode('SilvercartShippingFeesPage') %>
                                <a href="{$Link}" title="<%t SilverCart\Model\Pages\Page.GOTO 'go to {title} page' title=$Title.XML %>"><%t SilverCart\Model\Pages\Page.PLUS_SHIPPING 'plus shipping' %></a>
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
                    <% if $PluggedInProductMetaData %><% loop $PluggedInProductMetaData %>{$MetaData}<% end_loop %><% end_if %>
                </div>
            </article>
        </div>
    <% end_loop %>
    </div>
    <% if not $Top.useSlider %>
</div>
    <% end_if %>
<% end_if %>