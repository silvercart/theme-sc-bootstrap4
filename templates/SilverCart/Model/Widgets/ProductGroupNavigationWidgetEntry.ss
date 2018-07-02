<a href="{$Link}" title="{$Title.XML}" class="list-group-item <% if $IsActivePage %>active<% end_if %> <% if $IsSectionPage %>section<% end_if %> level-{$Level}">{$MenuTitle.XML}<% if $ActiveProducts.exists %> <span class="tag tag-pill tag-default pull-right">{$ActiveProducts.count}</span><% end_if %></a>
<% if $ChildPages %>
<div class="nav list-group <% if $IsSectionPage %>active-section<% end_if %>">{$ChildPages}</div>
<% end_if %>