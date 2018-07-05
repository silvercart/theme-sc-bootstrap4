<% if $Elements %>
<div class="ProductGroupPageTile">
    <% if $Top.useSlider %>
    <div class="sc-products clearfix cycle-slideshow"
         data-cycle-fx="carousel"
         data-cycle-speed="200"
         data-cycle-pause-on-hover="true"
         data-cycle-slides="> div"
         data-cycle-next="#widget-{$Top.ID} .vPrev"
         data-cycle-prev="#widget-{$Top.ID} .vNext"
         data-cycle-carousel-visible="{$numberOfProductsToShowForGroupView}"
         data-cycle-carousel-vertical="true"
        <% if not $Autoplay %>
         data-cycle-timeout="0"
        <% end_if %>
         >
    <% end_if %>
         <div class="sc-products clearfix">
    <% loop $Elements %>
        <% if $first %>
            <div class="row row-eq-height row-equalheight-{$pos}">
        <% end_if %>
                <div class="col-xs-12 col-sm-6 col-lg-6 col-xl-4 col-xxl-3">
                    <div class="card card-product silvercart-product-group-page-tile-item {$EvenOdd} clearfix {$productAddCartFormObj.FormName} <% if $MultipleOf(2) %>last-in-row<% end_if %>">
                        <div class="sc-product-title card-header">
                            <h2 id="product{$ID}" class="card-title">
                                <a href="{$Link}" class="highlight" title="<%t SilverCart\Model\Pages\Page.SHOW_DETAILS_FOR 'Show details for {title}' title=$Title %>">{$Title.HTML}</a>
                            </h2>
                        </div>
                        <div class="thumbnail text-xs-center">
                            <% if $isNewProduct %><span class="absolute top-left tag-new tag tag-info" title="<%t SilverCart\Model\Product\Product.New 'New' %>"><b><%t SilverCart\Model\Product\Product.New 'New' %>!</b></span><% end_if %>
                            <% if $ListImage %>
                            <a href="{$Link}" title="<%t SilverCart\Model\Pages\Page.SHOW_DETAILS_FOR 'Show details for {title}' title=$Title %>">
                                <img class="img-fluid lazyload" src="{$BaseHref}resources/vendor/silvercart/silvercart/client/img/loader-circle.gif" data-src="{$ListImage.Pad(500,300).URL}" alt="{$Title}" />
                            </a>
                            <% end_if %>
                        </div>
                        <div class="card-block">
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
                                    <small>
                                    <% if $CurrentPage.showPricesGross %>
                                        <strong><%t SilverCart\Model\Pages\Page.INCLUDING_TAX 'incl. {amount}% VAT' amount=$TaxRate %></strong>, 
                                    <% else_if $CurrentPage.showPricesNet %>
                                        <strong><%t SilverCart\Model\Pages\Page.EXCLUDING_TAX 'plus VAT' %></strong>,
                                    <% end_if %>
                                    <% with $CurrentPage.PageByIdentifierCode('SilvercartShippingFeesPage') %>
                                        <a href="{$Link}" title="<%t SilverCart\Model\Pages\Page.GOTO 'go to {title} page' title=$Title.XML %>"><%t SilverCart\Model\Pages\Page.PLUS_SHIPPING 'plus shipping' %></a><br/>
                                    <% end_with %>
                                    </small>
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
                        <div class="card-footer">
                            <a class="btn btn-sm btn-secondary btn-block" href="{$Link}" title="<%t SilverCart\Model\Pages\Page.SHOW_DETAILS_FOR 'Show details for {title}' title=$Title %>" data-title="<%t SilverCart\Model\Pages\Page.SHOW_DETAILS 'show details' %>" data-placement="top" data-toggle="tooltip">
                                <span class="fa fa-info-circle"></span> <%t SilverCart\Model\Pages\Page.SHOW_DETAILS 'show details' %></a>
                    <% if $PluggedInProductMetaData %>
                        <% loop $PluggedInProductMetaData %>
                            {$MetaData}
                        <% end_loop %>
                    <% end_if %>
                        </div>
                    </div>
                </div>
        <% if $last %>
            </div>
        <% end_if %>
    <% end_loop %>
        </div>
    <% if $Top.useSlider %>
    </div>
    <% end_if %>
</div>
<% end_if %>