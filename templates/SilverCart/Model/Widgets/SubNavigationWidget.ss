<% cached $NavigationCacheKey %>
    <% if $Navigation.HasMenu %>
        <% if $FrontTitle %><h3>{$FrontTitle}</h3><% end_if %>
<nav class="categories silvercart-product-group-navigation-widget"><div class="nav list-group">{$Navigation.Menu}</div></nav>
    <% end_if %>
<% end_cached %>