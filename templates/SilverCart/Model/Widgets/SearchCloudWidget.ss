<% if $TagsForCloud %>
<header><h3><%t SilverCart\Model\Widgets\SearchCloudWidget.TITLE 'Most frequent search terms' %></h3></header>
<div class="widget-search-cloud text-center">
    <% loop $TagsForCloud %>
    <a class="text-big-{$FontSize}" href="{$Link}"><span class="badge badge-light m-1"><i>{$SearchQuery}</i></span></a>
    <% end_loop %>
</div>
<% end_if %>