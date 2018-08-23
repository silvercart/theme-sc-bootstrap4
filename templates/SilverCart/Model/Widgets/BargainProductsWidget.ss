<% cached $WidgetCacheKey %>
    <% if $FrontTitle %>
<header><h3>{$FrontTitle}</h3></header>
    <% end_if %>
    <% if $FrontContent %>
<p>{$FrontContent.RAW}</p>
    <% end_if %>
    <% if $UseAsSlider %>
        <% include SilverCart\View\GroupView\WidgetProductBoxSlider %>
    <% else %>
        {$ElementsContent}
    <% end_if %>
<% end_cached %>