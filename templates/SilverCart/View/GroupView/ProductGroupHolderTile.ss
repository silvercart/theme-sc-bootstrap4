<% if $Elements %>
<div class="row ProductGroupHolderTile clearfix">
    <% loop $Elements %>
    <div class="col-6 col-xxl-3 col-xl-4 col-lg-6 col-md-6 col-sm-6 col-xs-12 clearfix">
        <figure class="effect-overlay" onclick="document.location.href='{$Link}';">
            <a href="{$Link}" title="{$Title}">
            <% if $GroupPicture %>
                <img class="img-fluid lazyload" src="{$BaseHref}resources/vendor/silvercart/silvercart/client/img/loader-circle.gif" data-src="{$GroupPicture.Pad(375,250).URL}" alt="{$MenuTitle.HTML}" />
            <% else_if $getProductsToDisplay.first.ListImage %> 
                <img class="img-fluid lazyload" src="{$BaseHref}resources/vendor/silvercart/silvercart/client/img/loader-circle.gif" data-src="{$getProductsToDisplay.first.ListImage.Pad(375,250).URL}" alt="{$MenuTitle.HTML}" />
            <% end_if %>
            </a>
            <figcaption>
                <h2 id="{$ID}">
                    <a href="{$Link}" class="highlight btn btn-secondary" title="{$Title}" data-title="{$Title}" data-placement="top" data-toggle="tooltip"><span>{$MenuTitle.HTML}</span></a>
                </h2>
            <% if $Content %>
                <p>{$Content.NoHTML.LimitWordCount(15)}</p>
            <% end_if %>
            </figcaption>
        </figure>
        <div class="text-center">
        <% if $hasProductCount(1) %> 
            <a href="{$Link}" class="btn btn-primary btn-sm" title="{$MenuTitle.HTML} - <%t SilverCart\Model\Pages\ProductGroupHolder.SHOW_PRODUCTS_WITH_COUNT_SINGLUAR 'Show {count} product' count=$ActiveProducts.Count %>" data-placement="top" data-toggle="tooltip"><%t SilverCart\Model\Pages\ProductGroupHolder.SHOW_PRODUCTS_WITH_COUNT_SINGLUAR 'Show {count} product' count=$ActiveProducts.Count %> <span class="fa fa-caret-right"></span></a>
        <% else_if not $hasProductCount(0) %>
            <a href="{$Link}" class="btn btn-primary btn-sm" title="{$MenuTitle.HTML} - <%t SilverCart\Model\Pages\ProductGroupHolder.SHOW_PRODUCTS_WITH_COUNT_PLURAL 'Show {count} products' count=$ActiveProducts.Count %>" data-placement="top" data-toggle="tooltip"><%t SilverCart\Model\Pages\ProductGroupHolder.SHOW_PRODUCTS_WITH_COUNT_PLURAL 'Show {count} products' count=$ActiveProducts.Count %> <span class="fa fa-caret-right"></span></a>
        <% else %>
            <a href="{$Link}" class="btn btn-primary btn-sm" title="{$MenuTitle.HTML} - <%t SilverCart\Model\Pages\Page.SHOW_DETAILS 'show details' %>" data-placement="top" data-toggle="tooltip"><%t SilverCart\Model\Pages\Page.SHOW_DETAILS 'show details' %> <span class="fa fa-caret-right"></span></a>
        <% end_if %>
        </div>
    </div>
    <% end_loop %>
</div>
<% end_if %>