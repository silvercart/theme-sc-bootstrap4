<% if $WidgetSetContent.exists && $WidgetSetContent.hasWidgets %>
<section class="sc-widget-holder">
    <h4 class="sr-only"></h4>
    {$InsertWidgetArea(Content)}
</section>
<% end_if %>