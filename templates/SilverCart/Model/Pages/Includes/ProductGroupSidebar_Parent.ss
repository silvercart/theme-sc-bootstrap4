<% with $Parent %>
    <% if $Parent.IsProductGroupPage %>
        <% include SilverCart\Model\Pages\ProductGroupSidebar_Parent %>
    <% end_if %>
<% end_with %>
<li><span class="fa fa-chevron-left text-gray"></span> <a href="{$Parent.Link}" title="{$Parent.Title}">{$Parent.MenuTitle}</a></li>