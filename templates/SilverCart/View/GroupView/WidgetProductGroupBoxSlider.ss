<% if $Elements %>
<div class="sly-container">
    <div id="widget-sly-{$ID}">
        <ul class="slider">
        <% loop $Elements %>
            <li class="slider-item">
                <article class="my-2 clearfix text-center h-100">
                    <div class="thumbnail card overflow-hidden">
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
<% end_if %>