<% if $TagsForCloud %>
<header><h3><%t SilverCart\Model\Widgets\SearchCloudWidget.TITLE 'Most frequent search terms' %></h3></header>
<div class="widget-search-cloud">
    <ul class="nav nav-pills">
    <% loop $TagsForCloud %>
        <li><a class="text-big-{$FontSize}" href="{$Link}"><span class="badge badge-light m-1"><i>{$SearchQuery}</i></span></a></li>
    <% end_loop %>
    </ul>
</div>
<% end_if %>