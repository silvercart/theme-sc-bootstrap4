<h4><%t SilverCart\Model\Pages\ProductGroupPage.ShowOffersFor 'Show offers for' %></h4>
<ul class="list-unstyled mb-3 pb-3 border-bottom">
<% if $Parent.IsProductGroupPage %>
    <% include SilverCart\Model\Pages\ProductGroupSidebar_Parent %>
<% end_if %>
    <li class="ml-12"><strong>{$MenuTitle}</strong>
<% if $Children %>
        <ul class="list-unstyled ml-3">
    <% loop $Children %>
            <li><a href="{$Link}" title="{$Title}">{$MenuTitle}</a></li>
    <% end_loop %>
        </ul>
<% end_if %>
    </li>
</ul>