<% if $ShowSiblings %>
    <% if $IsRootPage %>
        {$ChildPages}
    <% else %>
<li class="{$LinkingMode}">
    <div class="nav-item">
        <% if $IsActivePage %>
        <span class="nav-link active">{$MenuTitle.XML}</span>
        <% else %> 
        <a href="{$Link}" title="{$Title.XML}" class="nav-link <% if $IsRootPage %>section<% end_if %>">{$MenuTitle.XML}</a>
        <% end_if%>
        <% if $ProductGroup.ActiveProducts.exists %><span class="badge badge-pill badge-primary float-right">{$ProductGroup.ActiveProducts.count}</span><% end_if %>
    </div>
        <% if $ShowChildPages && $ChildPages %>
    <ul class="nav flex-column level-{$Level}">{$ChildPages}</ul>
        <% end_if %>
</li>
    <% end_if %>
<% else %>
<li class="{$LinkingMode}">
    <div class="nav-item">
    <% if $IsActivePage %>
        <span class="nav-link active">{$MenuTitle.XML}</span>
    <% else %> 
        <a href="{$Link}" title="{$Title.XML}" class="nav-link <% if $IsSectionPage %>section<% end_if %>">{$MenuTitle.XML}</a>
    <% end_if%>
    <% if $ProductGroup.ActiveProducts.exists %><span class="badge badge-pill badge-primary float-right">{$ProductGroup.ActiveProducts.count}</span><% end_if %>
    </div>
    <% if $ShowChildPages && $ChildPages %>
    <ul class="nav flex-column level-{$Level}">{$ChildPages}</ul>
    <% end_if %>
</li>
<% end_if %>