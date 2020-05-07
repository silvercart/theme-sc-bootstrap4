<div class="d-flex col-12 col-sm-4 col-md-3 col-lg-2 col-xxl-1">
    <article class="card card-product my-2 silvercart-product-group-page-tile-item {$EvenOdd} clearfix text-center w-100">
        <header class="sc-product-title card-header pl-1 pr-1 pb-1">
            <h2 class="card-title h6 mb-0 <% if $PriceIsLowerThanMsr || $isNewProduct %>pt-2<% end_if %>">
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
        <% if $ListImage %>
                <img class="img-fluid lazyload" src="{$BaseHref}resources/vendor/silvercart/silvercart/client/img/loader-circle.gif" data-src="{$ListImage.Pad(140,80).URL}" alt="{$Title}" />
        <% end_if %>
            </a>
        </div>
        <div class="card-body pb-0 pl-0 pr-0 pt-1">
            <div class="sc-product-price product-price">
                <span class="price">
                <% if $PriceIsLowerThanMsr %>
                    <small class="text-line-through">{$MSRPrice.Nice}</small>
                    <span class="text-danger font-weight-bold">{$PriceNice}</span>
                <% else %>
                    <span class="font-weight-bold">{$PriceNice}</span>
                <% end_if %>
                </span>
            </div>
        </div>
        <div class="card-footer">
            <a class="btn btn-secondary btn-block" href="{$Link}" title="<%t SilverCart\Model\Pages\Page.SHOW_DETAILS_FOR 'Show details for {title}' title=$Title %>" data-placement="top" data-toggle="tooltip">
                <span class="fa fa-info-circle"></span> <%t SilverCart\Model\Pages\Page.DETAILS 'Details' %></a>
            <% if $PluggedInProductMetaData %><% loop $PluggedInProductMetaData %>{$MetaData}<% end_loop %><% end_if %>
        </div>
    </article>
</div>