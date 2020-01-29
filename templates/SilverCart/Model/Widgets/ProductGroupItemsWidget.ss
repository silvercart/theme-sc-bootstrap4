<% cached $WidgetCacheKey %>
    <% if $FrontTitle %>
<header><h3>{$FrontTitle}</h3></header>
    <% end_if %>
    <% if $FrontContent %>
<p class="mb-0">{$FrontContent}</p>
    <% end_if %>
<% if $useSlider %>
    <% include SilverCart\View\GroupView\WidgetProductBoxSlider %>
<% else %>
    {$ElementsContent}
<% end_if %>
<% end_cached %>