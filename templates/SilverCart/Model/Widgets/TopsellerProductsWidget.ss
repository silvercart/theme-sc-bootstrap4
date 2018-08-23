<% cached $WidgetCacheKey %>
<header><h3><%t SilverCart\Model\Widgets\TopsellerProductsWidget.TITLE 'Topsellers' %></h3></header>
<% if $UseAsSlider %>
    <% include SilverCart\View\GroupView\WidgetProductBoxSlider %>
<% else %>
    <% include SilverCart\View\GroupView\WidgetProductBoxTile %>
<% end_if %>
<% end_cached %>