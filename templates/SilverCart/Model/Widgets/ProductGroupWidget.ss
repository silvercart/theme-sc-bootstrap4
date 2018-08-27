<% cached $WidgetCacheKey %>
<header><h3>{$FrontTitle}</h3></header>
    <% if $UseAsSlider %>
        <% include SilverCart\View\GroupView\WidgetProductGroupBoxSlider %>
    <% else %>
        <% include SilverCart\View\GroupView\WidgetProductGroupBoxTile %>
    <% end_if %>
<% end_cached %>