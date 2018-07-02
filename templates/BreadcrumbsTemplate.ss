<% if $Pages %>
<ol itemscope itemtype="http://schema.org/BreadcrumbList" class="breadcrumb"> 
    <% loop $Pages %>
        <% if $First %>
    <%-- <li class="breadcrumb-item" itemprop="itemListElement" itemscope itemtype="http://schema.org/ListItem"><a class="nav-link" itemprop="item" href="{$Link}" title="{$MenuTitle.XML}"><span itemprop="name">{$MenuTitle.XML}</span></a><meta itemprop="position" content="{$Pos}" /></li> --%>
        <% else_if $Last %>
    <li class="breadcrumb-item" itemprop="itemListElement" itemscope itemtype="http://schema.org/ListItem"><a class="nav-link disabled" itemprop="item" href="{$Link}" title="{$MenuTitle.XML}"><span itemprop="name">{$MenuTitle.XML}</span></a><meta itemprop="position" content="{$Pos}" /></li> 
        <% else %>
    <li class="breadcrumb-item" itemprop="itemListElement" itemscope itemtype="http://schema.org/ListItem"><a class="nav-link" itemprop="item" href="{$Link}" title="{$MenuTitle.XML}"><span itemprop="name">{$MenuTitle.XML}</span></a><meta itemprop="position" content="{$Pos}" /></li>
        <% end_if %>
    <% end_loop %>
</ol>
<% end_if %>