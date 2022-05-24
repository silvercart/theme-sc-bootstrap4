<% if $Elements %>
<div class="ProductGroupHolderList">
    <ul class="sc-products clearfix list-unstyled">
        <% loop $Elements %>
        <li class="clearfix row mb-2 pb-2 border-bottom">
            <div class="col-2 col-md-4 pr-0 pl-0">
                <div class="thumbnail">
                    <a href="{$Link}" title="{$Title}">
                    <% if $GroupPicture %>
                        <img class="img-fluid lazyload" src="{$BaseHref}_resources/vendor/silvercart/silvercart/client/img/loader-circle.gif" data-src="{$GroupPicture.Pad(250,150).URL}" alt="{$MenuTitle.HTML}" />
                    <% else_if $getProductsToDisplay.first.ListImage %>
                        <img class="img-fluid lazyload" src="{$BaseHref}_resources/vendor/silvercart/silvercart/client/img/loader-circle.gif" data-src="{$getProductsToDisplay.first.ListImage.Pad(350,230).URL}" alt="{$MenuTitle.HTML}" />
                    <% end_if %>
                    </a>
                </div>
            </div>
            <div class="col-10 col-md-8">
                <h2><a href="{$Link}" class="highlight">{$Title.HTML}</a></h2>
                <p>{$Content.Plain.LimitWordCount(25)}</p>
                <div class="row clearfix">
                    <div class="span12 col-md-12 text-right">
                    <% if $hasProductCount(1) %>
                        <a href="{$Link}" class="btn btn-primary btn-sm" title="{$MenuTitle.HTML} - <%t SilverCart\Model\Pages\ProductGroupHolder.SHOW_PRODUCTS_WITH_COUNT_SINGULAR 'Show {count} product' count=$ActiveProducts.Count %>" data-placement="top" data-toggle="tooltip"><%t SilverCart\Model\Pages\ProductGroupHolder.SHOW_PRODUCTS_WITH_COUNT_SINGULAR 'Show {count} product' count=$ActiveProducts.Count %> <span class="fa fa-caret-right"></span></a>
                    <% else_if not $hasProductCount(0) %>
                        <a href="{$Link}" class="btn btn-primary btn-sm" title="{$MenuTitle.HTML} - <%t SilverCart\Model\Pages\ProductGroupHolder.SHOW_PRODUCTS_WITH_COUNT_PLURAL 'Show {count} product' count=$ActiveProducts.Count %>" data-placement="top" data-toggle="tooltip"><%t SilverCart\Model\Pages\ProductGroupHolder.SHOW_PRODUCTS_WITH_COUNT_PLURAL 'Show {count} product' count=$ActiveProducts.Count %> <span class="fa fa-caret-right"></span></a>
                    <% else %>
                        <a href="{$Link}" class="btn btn-primary btn-sm" title="{$MenuTitle.HTML} - <%t SilverCart\Model\Pages\Page.SHOW_DETAILS 'show details' %>" data-placement="top" data-toggle="tooltip"><%t SilverCart\Model\Pages\Page.SHOW_DETAILS 'show details' %> <span class="fa fa-caret-right"></span></a>
                    <% end_if %>
                    </div>
                </div>
            </div>
        </li>
        <% end_loop %>
    </ul>
</div>
<% end_if %>
