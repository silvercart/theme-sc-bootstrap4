<% if $ShowSiblings %>
    <% if $IsRootPage %>
        {$ChildPages}
    <% else %>
<a href="{$Link}" title="{$ProductGroup.Title.XML}" class="list-group-item <% if $IsActivePage %>active<% end_if %> <% if $IsRootPage %>section<% end_if %>">{$MenuTitle.XML}<% if $ProductGroup.ActiveProducts.exists %> <span class="tag tag-pill tag-default pull-right">{$ProductGroup.ActiveProducts.count}</span><% end_if %></a>
        <% if $ShowChildPages && $ChildPages %>
<div class="nav list-group">{$ChildPages}</div>
        <% end_if %>
    <% end_if %>
<% else %>
<a href="{$Link}" title="{$ProductGroup.Title.XML}" class="list-group-item <% if $IsActivePage %>active<% end_if %> <% if $IsSectionPage %>section<% end_if %>">{$MenuTitle.XML}<% if $ProductGroup.ActiveProducts.exists %> <span class="tag tag-pill tag-default pull-right">{$ProductGroup.ActiveProducts.count}</span><% end_if %></a>
    <% if $ShowChildPages && $ChildPages %>
<div class="nav list-group <% if $IsSectionPage %>active-section<% end_if %>">{$ChildPages}</div>
    <% end_if %>
<% end_if %>