<% if $Children %>
<ul class="list-unstyled ml-2">
    <% loop $Children %>
    <li><a href="{$Link}" title="{$Title}">{$MenuTitle}</a>
        <% include SilverCart\Model\Pages\SearchResultsSidebar_Children %>
    </li>
    <% end_loop %>
</ul>
<% end_if %>