<% if $Pages %>
<ol itemscope itemtype="http://schema.org/BreadcrumbList" class="breadcrumb"> 
    <% loop $Pages %>
        <% if $Last %>
    <li class="breadcrumb-item" itemprop="itemListElement" itemscope itemtype="http://schema.org/ListItem"><a class="active" itemprop="item" href="<% if $OriginalLink %>{$OriginalLink}<% else %>{$Link}<% end_if %>" title="{$MenuTitle.XML}"><span itemprop="name">{$MenuTitle.XML}</span></a><meta itemprop="position" content="{$Pos}" /></li> 
        <% else %>
    <li class="breadcrumb-item" itemprop="itemListElement" itemscope itemtype="http://schema.org/ListItem"><a itemprop="item" href="<% if $OriginalLink %>{$OriginalLink}<% else %>{$Link}<% end_if %>" title="{$MenuTitle.XML}"><span itemprop="name">{$MenuTitle.XML}</span></a><meta itemprop="position" content="{$Pos}" /></li>
        <% end_if %>
    <% end_loop %>
</ol>
<% end_if %>