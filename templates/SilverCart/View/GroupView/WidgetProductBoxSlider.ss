<% if $Elements %>
<div class="sly-container">
    <div id="widget-sly-{$ID}">
        <ul class="slider">
        <% loop $Elements %>
            <li class="slider-item">
                <article class="card card-product my-2 silvercart-product-group-page-tile-item {$EvenOdd} clearfix text-center w-100 h-100 d-flex">
                    <header class="sc-product-title card-header pl-1 pr-1 pb-1">
                        <h2 id="product{$ID}" class="card-title h6 mb-0 <% if $PriceIsLowerThanMsr || $isNewProduct %>pt-2<% end_if %>">
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
                    <div class="card-body pb-0 pl-0 pr-0 pt-1">
                        <div class="sc-product-price product-price">
                            <span class="price">
                            <% if $PriceIsLowerThanMsr %>
                                <small class="text-line-through">{$MSRPrice.Nice}</small>
                                <strong class="text-danger">{$PriceNice}</strong>
                            <% else %>
                                <strong>{$PriceNice}</strong>
                            <% end_if %>
                            </span>
                        </div>
                    </div>
                    <div class="card-footer">
                        <a class="btn btn-secondary btn-block" href="{$Link}" title="<%t SilverCart\Model\Pages\Page.SHOW_DETAILS_FOR 'Show details for {title}' title=$Title %>" data-title="<%t SilverCart\Model\Pages\Page.SHOW_DETAILS 'show details' %>" data-placement="top" data-toggle="tooltip">
                            <span class="fa fa-info-circle"></span> <%t SilverCart\Model\Pages\Page.SHOW_DETAILS 'show details' %></a>
                        <% if $PluggedInProductMetaData %><% loop $PluggedInProductMetaData %>{$MetaData}<% end_loop %><% end_if %>
                    </div>
                </article>
            </li>
        <% end_loop %>
        </ul>
    </div>
    <div class="scrollbar">
        <div class="handle">
            <div class="mousearea"></div>
        </div>
    </div>
    <button class="btn prev"><span class="fa fa-chevron-left"></span><span class="sr-only"> prev</span></button>
    <button class="btn next"><span class="sr-only">next </span><span class="fa fa-chevron-right"></span></button>
</div>
<script>$(document).ready(function() {silvercart.sly.init($('#widget-sly-{$ID}'));});</script>
<% end_if %>