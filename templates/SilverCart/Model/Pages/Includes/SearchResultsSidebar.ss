<% cached $CacheKey,'SideBar' %>
<% if $ProductGroups %>
<h4><%t SilverCart\Model\Pages\ProductGroupPage.ShowResultsFor 'Show results for' %></h4>
<ul class="list-unstyled mb-3 pb-3 border-bottom">
    <% if $SearchCategory %>
    <li><span class="fa fa-chevron-left text-gray"></span> <a href="{$Link}" title="<%t SilverCart\Model\Pages\ProductGroupPage.ShowResultsForAll 'Show results for all categories' %>"><%t SilverCart\Model\Pages\ProductGroupPage.ShowResultsForAllMenu 'All categories' %></a></li>
    <% end_if %>
    <% loop $ProductGroups %>
    <li class="ml-12"><a class="font-weight-bold" href="{$Link}" title="{$Title}">{$MenuTitle}</a>
        <% include SilverCart\Model\Pages\SearchResultsSidebar_Children %>
    </li>
    <% end_loop %>
</ul>
<% end_if %>
<% end_cached %>