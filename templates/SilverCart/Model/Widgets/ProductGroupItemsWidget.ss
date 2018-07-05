<% cached $WidgetCacheKey %>
    <% if $FrontTitle %>
<header><h3>{$FrontTitle}</h3></header>
    <% end_if %>
    <% if $useSlider %>
<div class="pagers">
    <div class="btn-toolbar">
        <div class="btn-group">
        <% if $transitionEffect == 'horizontalSlide' %>
            <button class="btn btn-sm vNext" id="cycle-next-{$ID}"><span class="fa fa-caret-left"></span></button>
            <button class="btn btn-sm vPrev" id="cycle-prev-{$ID}"><span class="fa fa-caret-right"></span></button>
        <% else %>
            <button class="btn btn-sm vNext" id="cycle-next-{$ID}"><span class="fa fa-caret-down"></span></button>
            <button class="btn btn-sm vPrev" id="cycle-prev-{$ID}"><span class="fa fa-caret-up"></span></button>
        <% end_if %>
        </div>
    </div>
</div>
    <% end_if %>
    <% if $FrontContent %>
<p>{$FrontContent.RAW}</p>
    <% end_if %>
    <% if $useSlider %>
        <div class="sc-products clearfix cycle-slideshow <% if $transitionEffect == 'verticalSlide' %>vertical<% end_if %>"
            data-cycle-fx="<% if $transitionEffect == 'horizontalSlide' %>scrollHorz<% else_if $transitionEffect == 'verticalSlide' %>carousel<% else %>default<% end_if %>"
            data-cycle-speed="200"
            data-cycle-pause-on-hover="true"
            data-cycle-slides="> div"
            data-cycle-next="#cycle-next-{$ID}"
            data-cycle-prev="#cycle-prev-{$ID}"
            data-cycle-carousel-visible="{$numberOfProductsToShow}"
        <% if $transitionEffect == 'fade' %>
            data-cycle-swipe="true"
            data-cycle-swipe-fx="scrollHorz"
        <% else_if $transitionEffect == 'verticalSlide' %>
            data-cycle-carousel-vertical="true"
        <% end_if %>
        <% if not $Autoplay %>
            data-cycle-timeout="0"
        <% end_if %>
            >
            {$ElementsContent}
             </div>
    <% else_if $useRoundabout %>
        <% if $ProductPages %>
        <div id="productSlider" class="carousel slide">
            <ul class="carousel-inner silvercart-widget-productgroupitems-roundabout" id="ProductGroupItemsWidgetSlider{$ID}">
                <% loop $ProductPages %>
                    <li class="item"><div>{$Content}</div></li>
                <% end_loop %>
            </ul>
        </div>
        <% end_if %>
    <% else %>
        {$ElementsContent}
    <% end_if %>
<% end_cached %>
