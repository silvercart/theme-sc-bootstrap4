<% if $isContentView && $Content && $DoUseWidgetContainer %>
<div class="silvercart-widget-content-area clearfix {$ExtraCssClasses}<% if WidgetSet.UseAsSlider %> silvercart-widget-slider-element" rel="silvercart-widget-slider-{$WidgetSet.ID}<% end_if %>">
    <div class="silvercart-widget-content-area_content">
        {$Content}
    </div>
</div>
<% else_if $Content && $DoUseWidgetContainer %>
<div class="widget clearfix {$ExtraCssClasses}">
    <div class="widget_content">
        {$Content}
    </div>
</div>
<% else %>
    {$Content}
<% end_if %>