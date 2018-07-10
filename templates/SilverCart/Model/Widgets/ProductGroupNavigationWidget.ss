<% cached $NavigationCacheKey %>
    <% if $Navigation.HasMenu %>
        <% if $FrontTitle %><header><h3>{$FrontTitle}</h3></header><% end_if %>
<nav class="widget-product-group-navigation"><ul class="nav flex-column nav-fill">{$Navigation.Menu}</ul></nav>
    <% end_if %>
<% end_cached %>