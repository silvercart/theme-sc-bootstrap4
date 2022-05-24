<article class="d-flex col-xxl-2 col-xl-3 col-lg-3 col-md-4 col-sm-4 col-6 clearfix">
    <figure class="effect-overlay w-100 bg-white card">
        <a href="{$Link}" title="{$Title}" class="stretched-link">
        <% if $GroupPicture %>
            <img class="img-fluid lazyload" src="{$BaseHref}_resources/vendor/silvercart/silvercart/client/img/loader-circle.gif" data-src="{$GroupPicture.Pad(375,250).URL}" alt="{$MenuTitle.HTML}" />
        <% else_if $getProductsToDisplay.first.ListImage %> 
            <img class="img-fluid lazyload" src="{$BaseHref}_resources/vendor/silvercart/silvercart/client/img/loader-circle.gif" data-src="{$getProductsToDisplay.first.ListImage.Pad(375,250).URL}" alt="{$MenuTitle.HTML}" />
        <% end_if %>
        </a>
        <figcaption>
            <h2 id="{$ID}" class="z-1">
                <a href="{$Link}" class="btn btn-sm btn-secondary" title="{$Title}"><span>{$MenuTitle.HTML}</span></a>
            </h2>
        <% if $Content %>
            <p>{$Content.Plain.LimitWordCount(9)}</p>
        <% end_if %>
         <div class="text-center w-100 position-absolute bottom-5 btn-footer">
        <% if $hasProductCount(1) %> 
            <a href="{$Link}" class="btn btn-primary btn-sm" title="{$MenuTitle.HTML} - <%t SilverCart\Model\Pages\ProductGroupHolder.SHOW_PRODUCTS_WITH_COUNT_SINGULAR 'Show {count} product' count=$ActiveProducts.Count %>"><%t SilverCart\Model\Pages\ProductGroupHolder.SHOW_PRODUCTS_WITH_COUNT_SINGULAR 'Show {count} product' count=$ActiveProducts.Count %> <span class="fa fa-caret-right"></span></a>
        <% else_if not $hasProductCount(0) %>
            <a href="{$Link}" class="btn btn-primary btn-sm" title="{$MenuTitle.HTML} - <%t SilverCart\Model\Pages\ProductGroupHolder.SHOW_PRODUCTS_WITH_COUNT_PLURAL 'Show {count} products' count=$ActiveProducts.Count %>"><%t SilverCart\Model\Pages\ProductGroupHolder.SHOW_PRODUCTS_WITH_COUNT_PLURAL 'Show {count} products' count=$ActiveProducts.Count %> <span class="fa fa-caret-right"></span></a>
        <% else %>
            <a href="{$Link}" class="btn btn-primary btn-sm" title="{$MenuTitle.HTML} - <%t SilverCart\Model\Pages\Page.SHOW_DETAILS 'show details' %>"><%t SilverCart\Model\Pages\Page.SHOW_DETAILS 'show details' %> <span class="fa fa-caret-right"></span></a>
        <% end_if %>
        </div>
        </figcaption>
    </figure>
</article>