<% if $FrontTitle %>
<header><h4>{$FrontTitle}</h4></header>
<% end_if %>
<% cached $CurrentPage.CacheKey,'PriceFilterWidgetSuggestions' %>
    <% with $CurrentPage %>
        <% if $PriceRangeSuggestions %>
<ul class="list-unstyled mb-1">
            <% loop $PriceRangeSuggestions %>
    <li class="ml-12"><a href="{$Link}" title="{$Title}">{$MenuTitle}</a></li>
            <% end_loop %>
</ul>
        <% end_if %>
    <% end_with %>
<% end_cached %>
{$PriceRangeForm}