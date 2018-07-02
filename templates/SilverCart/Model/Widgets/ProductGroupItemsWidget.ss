<% cached $WidgetCacheKey %>
        <div class="section-header clearfix">
            <% if $FrontTitle %>
                <h3>{$FrontTitle}</h3>
            <% end_if %>
            <% if $useSlider %>
                <div class="pagers">
                    <div class="btn-toolbar">
                        <div class="btn-group">
                        <% if $transitionEffect == 'horizontalSlide' %>
                            <button class="btn btn-xs vNext" id="cycle-next-{$ID}"><i class="fa fa-caret-left"></i></button>
                            <button class="btn btn-xs vPrev" id="cycle-prev-{$ID}"><i class="fa fa-caret-right"></i></button>
                        <% else %>
                            <button class="btn btn-xs vNext" id="cycle-next-{$ID}"><i class="fa fa-caret-down"></i></button>
                            <button class="btn btn-xs vPrev" id="cycle-prev-{$ID}"><i class="fa fa-caret-up"></i></button>
                        <% end_if %>
                        </div>
                    </div>
                </div>
            <% end_if %>
        </div>
        <% if $FrontContent %>
            {$FrontContent.RAW}
        <% end_if %>

    <% if $Top.useSlider %>
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
    <% else_if $Top.useRoundabout %>
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
