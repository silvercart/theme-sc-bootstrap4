<% if $isContentView && $Content && $DoUseWidgetContainer %>
<section class="widget widget-contentarea clearfix {$ExtraCssClasses} <% if $WidgetSet.UseAsSlider %>silvercart-widget-slider-element" rel="silvercart-widget-slider-{$WidgetSet.ID}<% end_if %>" id="widget-{$ID}">
    {$Content}
</section>
<% else_if not $isContentView && $Content && $DoUseWidgetContainer %>
<section class="widget clearfix {$ExtraCssClasses}" id="widget-{$ID}">
    {$Content}
</section>
<% else_if $Content %>
    {$Content}
<% end_if %>