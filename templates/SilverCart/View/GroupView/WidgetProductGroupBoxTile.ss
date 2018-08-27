<% if $Elements %>
<div class="row">
    <% loop $Elements %>
    <div class="<% if $Up.IsInContentArea %>col-12 col-sm-4 col-md-6 col-lg-3 col-xxl-2<% else %>col-12 col-xxl-6<% end_if %>">
        <article class="my-2 clearfix text-center">
            <div class="thumbnail card">
                <a class="d-inline-block" href="{$Link}" title="<%t SilverCart\Model\Pages\Page.SHOW_DETAILS_FOR 'Show details for {title}' title=$Title %>">
                <% if $GroupPicture %>
                    <img class="img-fluid lazyload" src="{$BaseHref}resources/vendor/silvercart/silvercart/client/img/loader-circle.gif" data-src="{$GroupPicture.Pad(275,165).URL}" alt="{$MenuTitle.HTML}" />
                <% else_if $getProductsToDisplay.first.ListImage %> 
                    <img class="img-fluid lazyload" src="{$BaseHref}resources/vendor/silvercart/silvercart/client/img/loader-circle.gif" data-src="{$getProductsToDisplay.first.ListImage.Pad(275,165).URL}" alt="{$MenuTitle.HTML}" />
                <% end_if %>
                </a>
            </div>
            <header>
                <h2 class="h6 mb-0 text-center"><a href="{$Link}" class="highlight" title="<%t SilverCart\Model\Pages\Page.SHOW_DETAILS_FOR 'Show details for {title}' title=$Title %>">{$Title.HTML}</a></h2>
            </header>
        </article>
    </div>
    <% end_loop %>
</div>
<% end_if %>