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
            <div class="row">
    <% loop $Elements %>
        <% include SilverCart\View\GroupView\ProductTile %>
    <% end_loop %>
            </div>
        </div>
    <% if $Top.useSlider %>
    </div>
    <% end_if %>
</div>
<% end_if %>