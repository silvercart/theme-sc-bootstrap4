<% if $Elements %>
    <% if not $Top.useSlider %>
<div class="sc-products sc-products-vertical-tiny clearfix no-slider">
    <% end_if %>
    <% loop $Elements %>
        <% if $first %>
    <div class="row row-eq-height row-equalheight-{$pos}">
        <% end_if %>
        <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12 col-xl-12 col-xxl-6">
            <article class="card card-product silvercart-product-group-page-tile-item {$EvenOdd} clearfix text-center">
                  <header class="sc-product-title card-header">
                        <h2 id="product{$ID}" class="card-title">
                            <a href="{$Link}" class="highlight" title="<%t SilverCart\Model\Pages\Page.SHOW_DETAILS_FOR 'Show details for {title}' title=$Title %>">{$Title.HTML}</a>
                        </h2>
                    </header>
                    <div class="thumbnail text-xs-center">
                        <% if $isNewProduct %><span class="absolute top-left tag-new tag tag-info" title="<%t SilverCart\Model\Product\Product.New 'New' %>"><b><%t SilverCart\Model\Product\Product.New 'New' %>!</b></span><% end_if %>
                       <a href="{$Link}" title="<%t SilverCart\Model\Pages\Page.SHOW_DETAILS_FOR 'Show details for {title}' title=$Title %>">
                        <% if $ListImage %>
                             <% if $ListImage.Responsive %>
                                {$ListImage.setExtraClasses('d-inline-block').Responsive.Theme('ImageResponsiveLazyLoad').Ratio(2.5).Method('Pad').SrcSet('150w','300w').Sizes('(max-width: 544px) 50vw', '(min-width: 544.1px) 20vw')}
                            <% else %>
                                <img class="img-fluid lazyload" src="{$BaseHref}resources/vendor/silvercart/silvercart/client/img/loader-circle.gif" data-src="{$ListImage.Pad(275,275).URL}" alt="{$Title}" />
                            <% end_if %>    
                        <% end_if %>
                        </a>
                    </div>
                    <div class="card-block padded">
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
                                <p><small>
                                <% if $CurrentPage.showPricesGross %>
                                    <%t SilverCart\Model\Pages\Page.INCLUDING_TAX 'incl. {amount}% VAT' amount=$TaxRate %>, 
                                <% else_if $CurrentPage.showPricesNet %>
                                    <%t SilverCart\Model\Pages\Page.EXCLUDING_TAX 'plus VAT' %>,
                                <% end_if %>
                                <% with $CurrentPage.PageByIdentifierCode('SilvercartShippingFeesPage') %>
                                    <a href="{$Link}" title="<%t SilverCart\Model\Pages\Page.GOTO 'go to {title} page' title=$Title.XML %>"><%t SilverCart\Model\Pages\Page.PLUS_SHIPPING 'plus shipping' %></a>
                                <% end_with %>
                                </small></p>
                                <dl class="dl-inline">
                                    <dt><%t SilverCart\Model\Product\Product.PRODUCTNUMBER_SHORT 'Item no.' %>:</dt>
                                    <dd>{$ProductNumberShop}</dd>
                                <% if $PackagingQuantity %>
                                    <dt><%t SilverCart\Model\Pages\ProductPage.PACKAGING_CONTENT 'Content' %>:</dt>
                                    <dd>{$PackagingQuantity} {$QuantityUnit.Title}</dd>
                                <% end_if %>
                                <% if $Availability %>
                                    <dt><em>{$AvailabilityStatus.singular_name}:</em></dt>
                                    <dd>{$Availability('tag', 'tag-availability')}</dd>
                                <% end_if %>
                                </dl>
                            </div>
                        </div>
                    </div>
                    <footer class="card-footer">
                            <a class="btn btn-secondary btn-block" href="{$Link}" title="<%t SilverCart\Model\Pages\Page.SHOW_DETAILS_FOR 'Show details for {title}' title=$Title %>" data-title="<%t SilverCart\Model\Pages\Page.SHOW_DETAILS 'show details' %>" data-placement="top" data-toggle="tooltip">
                                <span class="fa fa-info-circle"></span> <%t SilverCart\Model\Pages\Page.SHOW_DETAILS 'show details' %></a>
                    <% if $PluggedInProductMetaData %>
                        <% loop $PluggedInProductMetaData %>
                            {$MetaData}
                        <% end_loop %>
                    <% end_if %>
                    </footer>
            </article>
        </div>
        <% if $last %>
    </div>
        <% end_if %>
    <% end_loop %>
    <% if not $Top.useSlider %>
</div>
    <% end_if %>
<% end_if %>