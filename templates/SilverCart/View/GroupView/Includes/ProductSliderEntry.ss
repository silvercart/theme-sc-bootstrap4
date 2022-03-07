<li class="slider-item">
    <article class="card card-product silvercart-product-group-page-tile-item {$EvenOdd} clearfix text-center w-100 h-100 d-flex">
        <div class="thumbnail pt-2">
        <% include SilverCart/Model/Pages/ProductBadges %>
        <% if $ListImage.Responsive %>
                {$ListImage.setExtraClasses('d-inline-block').Responsive.Theme('ImageResponsiveLazyLoad').Ratio(2.5).Method('Pad').SrcSet('150w','300w').Sizes('(max-width: 544px) 50vw', '(min-width: 544.1px) 20vw')}
        <% else_if $ListImage %>
                <img class="img-fluid lazyload" src="{$BaseHref}resources/vendor/silvercart/silvercart/client/img/loader-circle.gif" data-src="{$ListImage.Pad(275,165).URL}" alt="{$Title}" />
        <% end_if %>
        </div>  
        <h4 class="card-title h6 mb-0 <% if $PriceIsLowerThanMsr || $isNewProduct %>pt-2<% end_if %>">
            <a href="{$Link}" class="highlight stretched-link" title="<%t SilverCart\Model\Pages\Page.SHOW_DETAILS_FOR 'Show details for {title}' title=$Title %>">{$Title.HTML}</a>
        </h4>
        <div class="card-body p-0">
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
    </article>
</li>